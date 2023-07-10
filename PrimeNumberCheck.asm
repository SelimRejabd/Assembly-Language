INCLUDE EMU8086.INC
.MODEL SMALL
.STACK 100H
.DATA
    PRIME_NUMBERS DB 2D,3D,5D,7D,'$'
    NUM DB 0D
.CODE 

MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    MOV ES,AX

    PRINT 'INPUT: '
    
    MOV AH,1
    INT 21H
    MOV NUM,AL
    SUB NUM,48

    MOV CX,4
    MOV BL,2

    CHECK_PRIME:
        CMP NUM,0D 
        JE NON_PRIME

        CMP NUM,1D 
        JE NON_PRIME
        
        CMP BL,NUM
        JGE PRIME

        XOR AX,AX 
        MOV AL,NUM
        DIV BL
        CMP AH,0D
        JE NON_PRIME
        

        INC BL
    JMP CHECK_PRIME

    NON_PRIME:
        PRINTN ''
        PRINT 'NOT PRIME NUMBER'
        JMP EXIT
    PRIME:
        PRINTN ''
        PRINT 'PRIME NUMBER'

    EXIT:

    MOV AH,4CH
    INT 21H
MAIN ENDP
END MAIN