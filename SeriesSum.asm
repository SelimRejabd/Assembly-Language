INCLUDE EMU8086.INC        
.MODEL SMALL
.STACK 100H
.DATA 
    NUM DB 0D
    SUM DB 0D
    DIVIDEND DB 2D
.CODE
;description
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    MOV ES,AX
    
    PRINT 'INPUT: '
    MOV AH,1
    INT 21H
    ;IMPLEMENT FORMULA (NUM*(NUM+1)/2)
    ;SUB AL,48D
    MOV NUM,AL
    INC NUM

    MUL NUM
    DIV DIVIDEND
    MOV SUM,AL
    ADD SUM,48D

    PRINTN ''
    PRINT 'SUM: '

    MOV AH,2D
    MOV DL, SUM
    INT 21H


    MOV AH,4CH
    INT 21H
MAIN ENDP
END MAIN