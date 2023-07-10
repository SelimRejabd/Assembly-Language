INCLUDE EMU8086.INC
.MODEL SMALL
.STACK 100H
.DATA

STR DB 100 DUP ('$')


.CODE
MAIN PROC

    MOV AX,@DATA
    MOV DS,AX

    PRINT 'INPUT: '
  
    XOR CX,CX
    MOV AH,1
    INPUT:
        INT 21H 
        CMP AL,0DH
        JE EXIT_FROM_INPUT
        ; MOV STR[SI],AL
        PUSH AX
        INC CX
        JMP INPUT

    EXIT_FROM_INPUT:

   
    PRINTN ''
    PRINT 'OUTPUT: '

    JCXZ EXIT_FROM_OUTPUT
    MOV AH,2
    OUTPUT:
        POP DX
        INT 21H 
    LOOP OUTPUT

    EXIT_FROM_OUTPUT:


MAIN ENDP

END MAIN
