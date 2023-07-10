.MODEL SMALL
.STACK 100H
.DATA

STR DB 100 DUP ('$')
INPUT_MSG1 DB 'ENTER YOUR INPUT STRING:  $'
OUTPUT_MSG1 DB 'Output:  $'
NEW_LINE DB '0AH','0DH','$'

.CODE
MAIN PROC

    MOV AX,@DATA
    MOV DS,AX   

    MOV AH,9
    LEA DX,INPUT_MSG1
    INT 21H 

    MOV AH,1
    XOR CX,CX
    XOR SI,SI
    INPUT:
        INT 21H
        CMP AL,0DH
        JE EXIT_FROM_INPUT
        MOV STR[SI],AL
        INC CX
        INC SI
        JMP INPUT
    EXIT_FROM_INPUT: 
    
        mov ah, 2 
        mov dl, 10
        int 21h
        mov dl, 13
        int 21h


    LEA DX,OUTPUT_MSG1
    MOV AH,9
    INT 21H 

    XOR SI,SI 
    LOOP_THROUGH_STR:
        MOV DL,STR[SI]
        
        CMP DL,61H
        JL CHECK_UPPER_CASE
        CMP DL,7AH
        JG PRINT
        SUB DL,20H
        JMP PRINT
        
        CHECK_UPPER_CASE:
        CMP DL,41H
        JL PRINT
        CMP DL,5AH
        JG PRINT
        ADD DL,20H
        
        

        PRINT:
        MOV AH,2
        INT 21H 
        
        INC SI
     LOOP LOOP_THROUGH_STR

MAIN ENDP

END MAIN

