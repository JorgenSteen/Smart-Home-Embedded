#include "mbed.h"               // ned to use mbed basicly
#include "C12832_lcd.h"         // LCD screean lib
C12832_LCD lcd;                 // On board LCD display
PwmOut myled(LED1);    
#include "tst.h"                // LDR related støff
Serial pc(USBTX, USBRX);        // enable serial port which links to USB
Serial uart(p28, p27);          // enable uart comunicatinon
DigitalOut pc_activity(LED2);

int main(){
    
    while(1) {
        
        //Get_LDR_Raw_Value(valuesLDR[20]);                                     // Gets the raw data from te LDR and saves 20 values
       float AVG_tst_volt =  Get_LDR_Avrage_Value(10);                          // Gets Average value from the Analog inn
            
            myled = AVG_tst_volt;                                                // Lghts up LED1 on the mbed acording to the LDR value, PWM regulated               
            lcd.cls();                                                           // clear LCD screen
            lcd.locate(0,3);                                                     // Spescyfies the psotion on the LCD to wtrit  next
            lcd.printf("%1.5f Volts",AVG_tst_volt);                              // Prints The nuber that is calculetded
            
            //pc.printf("ADC Data Values for LDR is %1.5f Volts\n\r",ADCdataLDR);   // send an opening text message
  
            wait(0.1);                                  // Waits 1 millisecond
            }
}
 