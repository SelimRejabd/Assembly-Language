INCLUDE EMU8086.INC
.MODEL SMALL
.STACK 100H
.DATA

    
    STR DB 100 DUP('$')
    N DW ?

.CODE
MAIN PROC

    MOV AX,@DATA
    MOV DS,AX

    PRINT 'INTPUT: '

    XOR CX,CX
    XOR SI,SI
    MOV AH,1
    INPUT:
        INT 21H
        CMP AL,0DH
        JE EXIT_FROM_INPUT
        MOV STR[SI],AL
        INC CX
        INC SI
        JMP INPUT
    EXIT_FROM_INPUT:

    MOV N,CX 
    ;SORT

    DEC N
    JE END_SORT
    SORT_LOOP:
        MOV CX,N
        XOR SI,SI
        MOV DI,1
        SWAP_N_TIMES:
            MOV AL,STR[SI]
            CMP AL,STR[DI]
            JL SKIP_SWAPPING 
                XCHG AL,STR[DI]
                MOV STR[SI],AL
            SKIP_SWAPPING:
            INC SI
            INC DI
        LOOP SWAP_N_TIMES

        DEC N
    JNE SORT_LOOP
    END_SORT:
    

    PRINTN ''
    PRINT 'SORTED ARRAY: '
    
    LEA DX,STR 
    MOV AH, 9
    INT 21H
    

MAIN ENDP

END MAIN