/*
 * ASSIGNMENT1.asm
 *
 *  Created: 28/11/2023 9:24:14 PM
 *   Author: Eiffel
 */ 
 .ORG 0X0000
 Start:
 LDI R30, 0xFF
 OUT DDRC, R30 /* setting all pins of port C at output direction */
 SBI PORTC, 0
 call delay
 call delay
 call delay
 call delay
 CBI PORTC, 0
 call delay
 call delay
 call delay
 LDI R16, 0x00
 LDI R17,0xFF
 OUT DDRB, R16 /* setting all pins of port B at input direction */
 OUT DDRD, R17 /* setting all pins of port D at output direction */
 Input1:
 IN R18, PINB /* taking input at port B and storing it in register 18 */
 zero:
 LDI R19, 0b00000010 /* storing the value that decoder gives when 0 is pressed on the keypad */
 SUB R19, R18 /* subtracting the pre assigned value with input at port B to check if 0 key is pressed or not */
 BRNE one /* if 0 is not pressed jump to one to check if 1 key is pressed or not */
 LDI R20, 0b00000000 /* if 0 is not pressed jump to one to check if 1 key is pressed or not */
 one:
 LDI R19, 0b00000111
 SUB R19, R18
 BRNE two
 LDI R20, 0b00000001
 two:
 LDI R19, 0b00000110
 SUB R19, R18
 BRNE three
 LDI R20, 0b00000010
 three:
 LDI R19, 0b00000101
 SUB R19, R18
 BRNE four
 LDI R20, 0b00000011
 four:
 LDI R19, 0b00001011
 SUB R19, R18
 BRNE five
 LDI R20, 0b00000100
 five:
 LDI R19, 0b00001010
 SUB R19, R18
 BRNE six
 LDI R20, 0b00000101
 six:
 LDI R19, 0b00001001
 SUB R19, R18
 BRNE seven
 LDI R20, 0b00000110
 seven:
 LDI R19, 0b00001111
 SUB R19, R18
 BRNE eight
 LDI R20, 0b00000111
 eight:
 LDI R19, 0b00001110
 SUB R19, R18
 BRNE nine
 LDI R20, 0b00001000
 nine:
 LDI R19, 0b00001101
 SUB R19, R18
 BRNE Sign
 LDI R20, 0b00001001

 Sign: /* taking sign key input from the keypad through port C */
 SBI PORTC, 0
 call delay
 call delay
 call delay
 call delay
 call delay
 CBI PORTC, 0
 call delay
 call delay
 call delay
 call delay
 call delay
 call delay
 IN R21, PINB

 Input2: /* taking 2nd input from the keypad */
 SBI PORTC, 0
 call delay
 call delay
 call delay
 call delay
 call delay
 call delay
 call delay
 CBI PORTC, 0
 call delay
 call delay
 call delay
 call delay
 call delay
 call delay
 IN R23, PINB
 zero2:
 LDI R24, 0b00000010
 SUB R24, R23
 BRNE one2
 LDI R25, 0b00000000
 one2:
 LDI R24, 0b00000111
 SUB R24, R23
 BRNE two2
 LDI R25, 0b00000001
 two2:
 LDI R24, 0b00000110
 SUB R24, R23
 BRNE three2
 LDI R25, 0b00000010
 three2:
 LDI R24, 0b00000101
 SUB R24, R23
 BRNE four2
 LDI R25, 0b00000011
 four2:
 LDI R24, 0b00001011
 SUB R24, R23
 BRNE five2
 LDI R25, 0b00000100
 five2:
 LDI R24, 0b00001010
 SUB R24, R23
 BRNE six2
 LDI R25, 0b00000101
 six2:
 LDI R24, 0b00001001
 SUB R24, R23
 BRNE seven2
 LDI R25, 0b00000110
 seven2:
 LDI R24, 0b00001111
 SUB R24, R23
 BRNE eight2
 LDI R25, 0b00000111
 eight2:
 LDI R24, 0b00001110
 SUB R24, R23
 BRNE nine2
 LDI R25, 0b00001000
 nine2:
 LDI R24, 0b00001101
 SUB R24, R23
 BRNE Result
 LDI R25, 0b00001001


 Result: /* addition and subtraction functions */
 plus:
 LDI R22, 0b00000000
 SUB R22, R21
 BRNE minus
 ADD R20, R25
 minus:
 LDI R22, 0b00000100
 SUB R22, R21
 BRNE display
 SUB R20, R25
 display:
 OUT PORTD, R20
 RJMP Start


 delay: /* delay function */
 LDI R26, 50
 Loop1: LDI R27, 100
 Loop2: LDI R28, 100
 Loop3:
 Dec R28
 BRNE Loop3
 Dec R27
 BRNE Loop2
 Dec R26
 BRNE Loop1
 RET
 RET



