
_main:

;SerialCom.c,5 :: 		void main() {
;SerialCom.c,6 :: 		setup();
	CALL       _setup+0
;SerialCom.c,7 :: 		UART1_Init(9600);
	MOVLW      51
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;SerialCom.c,8 :: 		Delay_ms(200);                  // Wait for UART module to stabilize
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_main0:
	DECFSZ     R13+0, 1
	GOTO       L_main0
	DECFSZ     R12+0, 1
	GOTO       L_main0
	DECFSZ     R11+0, 1
	GOTO       L_main0
;SerialCom.c,12 :: 		while (1) {
L_main1:
;SerialCom.c,13 :: 		UART1_Write(50);
	MOVLW      50
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;SerialCom.c,14 :: 		}
	GOTO       L_main1
;SerialCom.c,15 :: 		}
L_end_main:
	GOTO       $+0
; end of _main

_setup:

;SerialCom.c,17 :: 		void setup () {
;SerialCom.c,18 :: 		ANSEL = 0X00;
	CLRF       ANSEL+0
;SerialCom.c,19 :: 		ANSELH = 0X00;
	CLRF       ANSELH+0
;SerialCom.c,20 :: 		TRISA = 0X00;
	CLRF       TRISA+0
;SerialCom.c,21 :: 		TRISB = 0X50;
	MOVLW      80
	MOVWF      TRISB+0
;SerialCom.c,22 :: 		TRISD = 0X00;
	CLRF       TRISD+0
;SerialCom.c,24 :: 		}
L_end_setup:
	RETURN
; end of _setup
