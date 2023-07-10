INCLUDE EMU8086.INC
.MODEL SMALL
.STACK 100H
.DATA
STR DB 100 DUP('$')
VOWELS DB 'AEIOUaeiou'
N DW 0H
VC DW 0H
CC DW 0H
DC DW 0H
SC DW 0H

.CODE

MAIN PROC

    MOV AX,@DATA
    MOV DS,AX

    PRINT 'INPUT: '
    XOR SI,SI
    ; MOV N,0
    MOV AH,1
    INPUT:
        INT 21H
        CMP AL,0DH
        JE EXIT_FROM_INPUT
        ; MOV STR[SI],AL

        CMP AL,'A'
        JL NOT_A_CHARACTER
        CMP AL,'Z'
        JL CHECK_FOR_VC

        CMP AL,'a'
        JL NOT_A_CHARACTER
        CMP AL,'z'
        JG NOT_A_CHARACTER

        CHECK_FOR_VC:
        MOV CX,10
        XOR SI,SI
        CHECK_VOWEL:
            CMP AL,VOWELS[SI] 
            JE FIND_VOWEL
            
            INC SI
        LOOP CHECK_VOWEL
        JMP FIND_CONSONENT
        FIND_VOWEL:
            INC VC
            JMP COMPLETE_CHECKING_FOR_AL
        FIND_CONSONENT:
            INC CC
            JMP COMPLETE_CHECKING_FOR_AL

        NOT_A_CHARACTER:

        CMP AL,' '
        JE FIND_SPACE
        CMP AL,'0'
        JL COMPLETE_CHECKING_FOR_AL
        CMP AL,'9'
        JG COMPLETE_CHECKING_FOR_AL
        JMP FIND_DIGIT
        FIND_SPACE:
            INC SC
            JMP COMPLETE_CHECKING_FOR_AL
        FIND_DIGIT:
            INC DC
            JMP COMPLETE_CHECKING_FOR_AL

        COMPLETE_CHECKING_FOR_AL:
        ; INC SI
    JMP INPUT
    EXIT_FROM_INPUT:

    MOV N,SI 
    
    PRINTN ''
    PRINT 'NUMBER OF VOWELS: '
    MOV AH,2
    ADD VC,30H
    MOV DX,VC
    INT 21H


    PRINTN ''
    PRINT 'NUMBER OF CONSONANTS: '
    MOV AH,2
    ADD CC,30H
    MOV DX,CC
    INT 21H

    PRINTN ''
    PRINT 'NUMBER OF SPACES: '
    MOV AH,2
    ADD SC,30H
    MOV DX,SC
    INT 21H
    
    PRINTN ''
    PRINT 'NUMBER OF DIGITS: '
    MOV AH,2
    ADD DC,30H
    MOV DX,DC
    INT 21H
 
    MOV AH,4CH
    INT 21H

MAIN ENDP

END MAIN