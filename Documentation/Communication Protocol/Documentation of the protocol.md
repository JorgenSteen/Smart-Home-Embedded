
#### Jorgens Communication protocol over serial communication. Made for communication between an MCU and Labview, but can be implented on any device.

## Structure of the text

### Operation.
General info.  
Sending from MCU to PC.  
Sending from PC to MCU.  
Data type ID list.  
### Example for using the Library on the MCU. 
Calling it in the main.  
Examples of the main function in the liberary.  
The liberary should be close to these files.  
### LabVIEW code.
About.  
Functions.  

# Operation.

## General info Info about sending data.
Each data and message type has an ID and each MCU has an address. Every MCU sends to the PC and PC sends to everyone. Every package contains the address of either the sender or the one it is being sent to. Message for the PC contains the address of the one who sendes it and the message for the MCU contains the address of who it is for. In this way the MCU can separate all the package the PC sends, by reading the address and discards it if it is not ment for it. In the message there is also data and an ID of the type of data it contains. This is what they have in common, but how they format the string is different.

## Sending from MCU to PC.
Sending is CSV based. Each letter is comma seperated and ends with 0xA "\n", so the reciever knows that this is the end of the message.
The order is not important, as long as the data type ID comes right before the data.
The adress of the MCU is a Capital letter between B-Z. 

Example string for MCU to PC:
Data info: MCU address: B, with MCU address ID: 5, data type ID: 18, value to send is 17.5.

									"5, B, 7, 17.5 \n"
						ID, follower by data and ending it with \n (new line) 

When the data is received on the PC it should sort the incoming message into an array, were the data type ID is the location of the data point in the array, so it will be easy to retrive it later and it would make the sorting automatic.


## Sending from PC to MCU.
Each package will only contain data about one ting. Time/date or Alarm or position etc.
The package consist of 4 main parts, were 0,1,2 is always a uint8_t and 3 and onwards is the payload and can be any format, but it will be sent one byte at a time. 
	0. Address of MCU
	1. Type of package
	2. length of package
	3. Package

Example of data from PC to MCU
MCU address: B(66), Package type: date/time(3), Payload: [22,02,11] (the time is 22:02:11).
							[66, 3, 3, 22, , 2, 11]

MCU address: C, Package type Alarm, ID: 1, Payload: "Alarm" (A string)
							[67, 1, 5, 'A', 'l', 'a', 'r', 'm']
							
				 [MCU Adress, Data Type ID, Amount data bytes, Byte 1, Byte 2, ..., Byte n].

One send bytes that should be interpreted as bytes and another one sends byte chars that should be gathered and interpreted as a string. In the library complementing this library the input array gets pealed with case structures until it is ready to be read.
And any handling of the data should be the same.


## Data IDs.

//Types of data the MCU can receive

#define ALARM 1  
#define ERROR 2  
#define TIMEDATE 3  
#define STATUS 4  
#define REQUEST 5  
#define COMMAND 6  

//Types of Command and Request the MCU can receive.

#define NEOPIXEL 1  
#define FANCONTROL 2  
#define HEATCONTROL 3   
#define DISPLAYTEXT 4  


//These are all the types of Data that can be sent and sorted with this protocol.
//Data ID starts at 10.

#define MCU_ADRESS_DATA 5  
#define ACC_X_DATA 10  
#define ACC_Y_DATA 11  
#define ACC_Z_DATA 12  
#define ACC_LEN_DATA 13  
#define TIME_HOURS_DATA 14  
#define TIME_MINUTS_DATA 15  
#define TIME_SECONDS_DATA 16  
#define ZIGBEE_TEMP_DATA 17  
#define INSIDE_TEMP_DATA 18  
#define OUTSIDE_TEMP_DATA 19  
#define POT1_DATA 20  
#define PIR_SENSOR 21  
#define LIGHT_SENSOR 22  


//Array ID.  
#define Array_data 100  
#define Array_request 101  




# Example for using the Library on the MCU.
This part will contain some examples of how the library is used in the main and the 2 main functions that are used in this library.

## Example for using the code.

In this example i use the XBEE serial communication to tell me when a message is ready and a timer to make sure it sends every minut.

	int main()      
	{        
		Communication_shell_init();   
		while(1)  
		{
			//Sendinger data to a function that adds and format the text a little.
			if(Variable_that_becomes_true_every_minut)
			{
				Variable_that_becomes_true_every_minut = false;

				uint8_t dump = Send_to_PC(10, (float)TIME_HOURS_DATA, (float)hours, (float)TIME_MINUTS_DATA, (float)minuts, (float) TIME_SECONDS_DATA, (float)seconds.read(), (float)ZIGBEE_TEMP_DATA, temperature3); 
			}

			//Calls a serial read function if there is something to be read
			if(Serial_Com.readable())
			{
				Incomming_data_handler();
			}
		}
	}



## Example of the Library.


	//Sending from the MCU to PC  

	uint8_t Send_to_PC(uint8_t length, ...) {

	uint8_t error_status = 0; //initiate Error status for error handling

		//checks that an even number is sent inn
		if(!(length & 0x01)){

			char str[128]; //String buffer
			uint8_t index = 0; //Position of data written to the string. 
			uint8_t input_position; //Position of Data
			double send_array[length]; //store the data before converting to string


			/* initialize valist for length number of arguments */
			va_list valist;
			va_start(valist, length);
			//Writes must have data into the string
			index += sprintf(&str[index], "%d,", MCU_ADRESS_DATA); //Insert data location for the MCU NAme
			index += sprintf(&str[index], "%d", MCU_adress); //Insert the MCU Name

			/* access all the input arguments assigned to valist  and puts it in the correct order*/
			for (input_position  = 0; input_position   < length; input_position++) {
			send_array[input_position] = va_arg(valist, double);
			index += sprintf(&str[index], ",%.2f", send_array[input_position]);
			}

			 Serial_Com.printf("%s \n", str); //Sends the string
			/* clean memory reserved for valist */
			va_end(valist);
		}
		else
		{
			error_status = 1;
		}
	return error_status;
	}
	
	//Recieving Data from the PC
	void Incomming_data_handler(void)
	{
	    uint8_t Incomming_address = Serial_Com.getc();
	    if((Incomming_address == MCU_adress) || (Incomming_address == MCU_adress_all))
	    {   
		Message_in_buffer = true;
		uint8_t counter = 0; //Keeping track of the position of the next byte.
		while(Serial_Com.readable() && (counter<Input_buffer_size))
		{
		    Serial_Input_buffer[counter] = Serial_Com.getc(); //Places the data from the serial input to the buffer
		    counter++;
		}
		if(!(counter<Input_buffer_size))
		{
		    while(Serial_Com.readable())
		    { 
			uint8_t dump = Serial_Com.getc();
		    }
		}

		if(((uint8_t)Serial_Input_buffer[0] == 1) || ((uint8_t)Serial_Input_buffer[0] == 6))
		{
		    Serial_data_handler();
		}
	    }
	    else
	    {
		lcd.printf("Message for %c \n", Incomming_address); 
		while(Serial_Com.readable())
		{ 
		    uint8_t dump = Serial_Com.getc();
		    Serial_Com.attach(&Incomming_data_handler, Serial::RxIrq);
		} 
	    }
	}
# LabVIEW code.
## About. 
The LabVIEW code is not ment for be illustrated in text form, so it should be open and looked if it wish to be understood.
But using LabVIEW is not a must, as long as one has a reciever that interprets the incoming data as described over all the data should be collected. The main difference will be that the LabVIEW software contains. 

## Function.
Other than sorting the incoming data the LabVIEW code has 2 main type of functions.

1. Telling the MCU what to do.
	One function sends out alarm, another one controls the light and so forth. 
	They all have in common is that they use the PC to MCU protocol with the types of data to get the MCU to do what the user or the software wants.

2. Reading incoming data and seeing if their value is over a critical level. 
	Checking if it is vibrating to much or of the temperatur can indicate a fire.
	It does this by comparing the incoming values to values the user can set in the option settings, and sends out an alarm if the value is over the perfered temperatur.

