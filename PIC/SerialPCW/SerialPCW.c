#include <16f887.h>
#use delay (clock = 48000000)
#use RS232 (BAUD=9600,BITS=8,PARITY=N,XMIT=PIN_C6,RCV=PIN_C7)
# org 0x0000
#use fast_io(d)  
#define swo pin_B7



void main(){
 int conteo;
set_tris_d(0b00000000);


while(1){


if(input(swo)==1){
conteo=conteo+1;
delay_ms(500);
if (conteo>10) 
conteo = 0x00;  
  
}

putc(conteo);  

         switch(conteo){    
         case 0:
         output_b (0b1000000);
         break;         
         case 1:
         output_d (0b1111001);        
         break; 
         case 2:
         output_d (0b0100100);
         break;          
         case 3:
         output_d (0b0110000);
         break;          
         case 4:
         output_d (0b0011001);
         break;                  
         case 5:
         output_d (0x12);
         break;   
         case 6:
         output_d (0x02);
         break;
         case 7:
         output_d (0x78);
         break;   
         case 8:
         output_d (0x00);
         break; 
         case 9:
         output_d (0x18);
         break; 
         

         
         }


}




}

