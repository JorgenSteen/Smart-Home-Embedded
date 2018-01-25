
AnalogIn photocell(p15);            // Analog in
              // 
//photocell analog input dims led at lower light levels using PWM

//float ADCdataLDR;                   // our data for the analog to digital conversion
//float valuesLDR[20];                // it will store our 20 values
//float avvalueLDR;                   // it will store the averge value
 /*
float Get_LDR_Raw_Value(float valuesLDR[20]){
        
    for (int i=0;i<20;i++){                         // reading analog input
        valuesLDR[i]=photocell;                     // saves 20 values
        } 
        return (valuesLDR[20]);   
    }
    

float Get_LDR_Avrage_Value(float avvalueLDR, float ADCdataLDR, float valuesLDR[20])
    {
    avvalueLDR=0;                                   // average value is initialized at 0
    for (int i=0;i<20;i++){                         // finding the average value
        avvalueLDR = avvalueLDR+valuesLDR[i];   // avrage value updated
        }
    ADCdataLDR=3.3*avvalueLDR/20;                   // the data is normalized
    
    return (ADCdataLDR);
    }
    */
float Get_LDR_Avrage_Value(float AVR_Amount){
    float AVG_Value = 0;                                // average value is initialized at 0
    for (int i=0;i<AVR_Amount;i++)                      // finding the average value
    {                         
        AVG_Value = photocell+AVG_Value;                // avrage value updated
    }
    AVG_Value=3.3*(AVG_Value/AVR_Amount);               // the data is normalized
    
    return (AVG_Value);
}