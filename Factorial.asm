INCLUDE EMU8086.INC
.MODEL SMALL
.STACK 100H
.DATA 
    NUM DB 0D
    FACT DB 0D
    I DB 1D 
.CODE       
; Input 1-3
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    PRINT 'INPUT: '
    
    MOV AH,1
    INT 21H
    SUB AL,48D
    CMP AL,0D ;Exceptional case 0! = 1
    JE EXCEPTION_CASE_FOR_ZERO
    MOV I,AL

    FACTORIAL:
        DEC I
        CMP I,0D
        JLE PRINT_FACTORIAL

        MUL I
    JMP FACTORIAL

    EXCEPTION_CASE_FOR_ZERO:
        MOV AL,1D

    PRINT_FACTORIAL:

    MOV FACT, AL
    ADD FACT,48D
    PRINTN ''
    PRINT 'OUTPUT: '

    MOV DL,FACT
    MOV AH,2
    INT 21H

    MOV AH,4CH
    INT 21H
MAIN ENDP
END MAIN