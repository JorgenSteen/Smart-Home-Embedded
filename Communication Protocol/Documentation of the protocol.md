/**********************************
Jorgens Communication protocol over serial
Made for communication between an MCU and Labview

###Operation
####Sending from MCU to PC:
Sending is CSV based. Each letter is comma seperated and ends with 0xA "\n".
The first number is always the MCU address/name [0-255].
The order of the rest is not imporant, but rach form of data has a specific "Adress" before its value to indicate what the value is for.
Example string for MCU to PC:
Data info: MCU adress: A, data form adress: 7, value to send is 17.5.
"A, 7, 17.5 \n"

####Sending from PC to MCU
Sending position based with dynamic length.
Each package will only contain data about one ting. Time/date, Alarm, position etc.
The package consist of 4 main parts, were 1,2,3 is always a uint8_t and 4 is an array of uint8_t.
	1. Adress of MCU
	2. Type of package
	3. length of package
	4. Package

Example of data from PC to MCU
MCU address: A, Package type: date/time(2), Time: 22:02:11
uint8_t PC_package[] = [A, 2, 3, 22, , 2, 11];

************************************/

//Sending Function


#include <stdio.h>
#include <stdarg.h>
#define uint8_t int
uint8_t MCU_adress = 'A';


//This function takes in a variable amount of data and formats it in the correct fashion
//It also attaches the MCU adress to the string.
uint8_t Send_to_PC(uint8_t length, ...) {

  uint8_t error_status = 0; //initiate Error status for error handling

  //checks that an even number is sent inn
  if(!(length & 0x01)){
     va_list valist;
     char str[128]; //String buffer
     uint8_t index = 0; //Position of data written to the string.
     uint8_t input_position; //Position of Data
     uint8_t send_array[length]; //store the data before converting to string


     /* initialize valist for length number of arguments */
     va_start(valist, length);
     //Writes must have data into the string
    index += sprintf(&str[index], "%d,",  MCU_ADRESS_DATA); //Insert data location for the MCU NAme
    index += sprintf(&str[index], "%d",  MCU_adress); //Insert the MCU Name

     /* access all the input arguments assigned to valist  and puts it in the correct order*/
     for (input_position  = 0; input_position   < length; input_position++) {
        send_array[input_position] = va_arg(valist, int);
        index += sprintf(&str[index], ",%d", send_array[input_position]);
     }

         XBEE.printf("%s \n", str); //Sends the string
      /* clean memory reserved for valist */
      va_end(valist);
  }
  else
  {
    error_status = 1;
  }

   return error_status; //returns the Error status. 0 = everything is cool
}

int main() {

   printf("%d \n", Send_to_PC(4, 2,3,4,5));
}

//////////////////////////////////////////////////////
//Reciving function


#include <stdio.h>
#include <stdarg.h>
void Get_XBEE_data(void);
uint8_t MCU_adress = 'A';



int main() {
    XBEE.baud(9600); //Sets serial BAUD
  //  XBEE.printf("Hello World!\n");

    seconds.start(); //starts the second counter
    minut_int.attach(&time_master, 60); //Attaches the minut ticker to the time_master func
    //Accelerometer_init(); //initates the accelerometer

    while(1)
    {

        if(XBEE.readable())
        {
          Get_XBEE_data();
        }
       uint8_t dump = Send_to_PC(6, TIME_HOURS_DATA, hours,TIME_MINUTS_DATA, minuts, TIME_SECONDS_DATA, (uint8_t)seconds.read());
        wait(10);
    }

}

void Alarm_timout(void)
{
            lcd.cls();
        lcd.locate(0,0);
        lcd.printf("ALARM timeout");
        wait(1);

}

void Alarm_indicator(uint8_t Alert_time)
{


        lcd.cls();
        lcd.locate(0,0);
        lcd.printf("ALARM!!!!! RUN!! \n");

       // wait(2);
        lcd.printf("WE ARE ALL GOING TO DIE! \n");
        //wait(2);
        Alarm_time.attach(&Alarm_timout, Alert_time);
}



void Get_XBEE_data(void)
{
            lcd.locate(0,0);
            lcd.printf("Incoming!");
            int counter = 0;
            char buffer[60];

            while(XBEE.readable())
            {
                buffer[counter] = XBEE.getc();
                counter++;
            }

            uint8_t package_size = (uint8_t)buffer[2]; //reads the size of the package
            uint8_t RS_message[package_size+2]; //Creates a Array to store message
            //lcd.printf("len %d, msg: %s \n ", package_size, buffer); //displays message
            wait(1);

            if((uint8_t)buffer[0] == MCU_adress)
            {

                for(int i = 0; i<2+package_size ; i++)
                {

                    RS_message[i] = (uint8_t)buffer[i+1];
                }

                for (int J = 0; J < package_size+2; J++)
                {
                lcd.printf(",%d", RS_message[J] );
                }



           ////////////////////

                uint8_t Case_selector = RS_message[0];


                switch(Case_selector) {

                   // Alarm
                   case ALARM :
                     Alarm_indicator(30);
                   break;

                   // Error
                   case ERROR :
                      lcd.printf("\n Error\n");
                   break;

                   // Time_and_Date
                   case TIMEDATE :
                     lcd.printf("\n Time_and_Date \n");
                   break;

                   // Status
                   case STATUS :
                     lcd.printf("\n Status \n");
                   break;

                   // Request
                   case REQUEST :
                      lcd.printf("\n Request\n");
                   break;

                   default :
                   lcd.printf("\n default \n");
                }

             wait(2);
           }
            else
            {
              lcd.printf("Message for %c \n", buffer[0] );
            }


}
