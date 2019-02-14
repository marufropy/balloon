;OFFLINE 5_BALLOON GRAPHICS_1205090

.MODEL SMALL

DRAW_ROW MACRO X
    LOCAL L1
    
    MOV AH,0CH;PIXEL
    MOV AL,1;CYAN
    MOV CX,20;COLUMN 20
    MOV DX,X;ROW X
    L1:
    INT 10H
    INC CX;NEXT COLUMN
    CMP CX,301;BEYOND COLUMN 300?
    JL L1;REPEAT
    ENDM

DRAW_COLUMN MACRO Y
    LOCAL L2
    
    MOV AH,0CH;PIXEL
    MOV AL,1;CYAN
    MOV CX,Y;COLUMN Y
    MOV DX,20;ROW 20
    L2:
    INT 10H
    INC DX;NEXT ROW
    CMP DX,181;BEYOND ROW 180?
    JL L2;REPEAT
    ENDM 

.STACK 100H


.DATA 

NEW_TIMER_VEC DW ?,?
OLD_TIMER_VEC DW ?,?
TIMER_FLAG DB 0
VEL_X DW 0
VEL_Y DW -5

.CODE

SET_DISPLAY_MODE PROC
    
    MOV AH,0;SET MODE
    MOV AL,04H;MODE 4,320*200 4 COLOUR
    INT 10H
    
    MOV AH,0BH;SELECT PALETTE
    MOV BH,1
    MOV BL,1;PALETTE 1
    INT 10H
    
    MOV BH,0;SET BACKGROUND COLOUR
    MOV BL,1;BLUE
    INT 10H
    
    ;DRAW BOUNDARY
    DRAW_ROW 20
    DRAW_ROW 180
    DRAW_COLUMN 20
    DRAW_COLUMN 300
    
    RET

SET_DISPLAY_MODE ENDP

ID PROC
    
    MOV AH,2;SET MODE
    MOV BH,0;PAGE
    MOV DH,1;ROW
    MOV DL,28;COLUMN
    INT 10H
    MOV AH,9;CHAR FUNCTION
    MOV AL,'#';ID CHAR
    MOV BL,3;CHAR COLOUR
    MOV CX,1;1 CHAR
    INT 10H
    
    MOV AH,2;SET MODE
    MOV BH,0;PAGE
    MOV DH,1;ROW
    MOV DL,29;COLUMN
    INT 10H
    MOV AH,9;CHAR FUNCTION
    MOV AL,'1';ID CHAR
    MOV BL,3;CHAR COLOUR
    MOV CX,1;1 CHAR
    INT 10H
    
    MOV AH,2;SET MODE
    MOV BH,0;PAGE
    MOV DH,1;ROW
    MOV DL,30;COLUMN
    INT 10H
    MOV AH,9;CHAR FUNCTION
    MOV AL,'2';ID CHAR
    MOV BL,3;CHAR COLOUR
    MOV CX,1;1 CHAR
    INT 10H
    
    MOV AH,2;SET MODE
    MOV BH,0;PAGE
    MOV DH,1;ROW
    MOV DL,31;COLUMN
    INT 10H
    MOV AH,9;CHAR FUNCTION
    MOV AL,'0';ID CHAR
    MOV BL,3;CHAR COLOUR
    MOV CX,1;1 CHAR
    INT 10H
    
    MOV AH,2;SET MODE
    MOV BH,0;PAGE
    MOV DH,1;ROW
    MOV DL,32;COLUMN
    INT 10H
    MOV AH,9;CHAR FUNCTION
    MOV AL,'5';ID CHAR
    MOV BL,3;CHAR COLOUR
    MOV CX,1;1 CHAR
    INT 10H
    
    MOV AH,2;SET MODE
    MOV BH,0;PAGE
    MOV DH,1;ROW
    MOV DL,33;COLUMN
    INT 10H
    MOV AH,9;CHAR FUNCTION
    MOV AL,'0';ID CHAR
    MOV BL,3;CHAR COLOUR
    MOV CX,1;1 CHAR
    INT 10H
    
    MOV AH,2;SET MODE
    MOV BH,0;PAGE
    MOV DH,1;ROW
    MOV DL,34;COLUMN
    INT 10H
    MOV AH,9;CHAR FUNCTION
    MOV AL,'9';ID CHAR
    MOV BL,3;CHAR COLOUR
    MOV CX,1;1 CHAR
    INT 10H  
    
    MOV AH,2;SET MODE
    MOV BH,0;PAGE
    MOV DH,1;ROW
    MOV DL,35;COLUMN
    INT 10H
    MOV AH,9;CHAR FUNCTION
    MOV AL,'0';ID CHAR
    MOV BL,3;CHAR COLOUR
    MOV CX,1;1 CHAR
    INT 10H
    
    RET
    
ID ENDP  

SETUP_INT PROC
    
    MOV AH,35H;GET VECTOR
    INT 21H
    MOV [DI],BX;SAVE OFFSET
    MOV [DI+2],ES;SAVE SEGMENT
    
    MOV DX,[SI]
    PUSH DS
    MOV DS,[SI+2]
    MOV AH,25H;SET VECTOR
    INT 21H
    POP DS
    
    RET
    
SETUP_INT ENDP  

TIMER_TICK PROC
	PUSH DS;SAVE DS
	PUSH AX
	
	MOV AX,SEG TIMER_FLAG
	MOV DS,AX
	MOV TIMER_FLAG,1
	
	POP AX
	POP DS
	
	IRET

TIMER_TICK ENDP

DISPLAY_BALLOON1 PROC
    
    MOV AH,0CH
    INT 10H
    INC CX
    INT 10H
    INC CX
    INT 10H
    INC CX
    INT 10H
    INC CX
    INT 10H
    INC CX
    INT 10H
    INC CX
    INT 10H
    
    INC DX
    INT 10H
    INC CX
    INT 10H
    INC DX
    INT 10H
    INC CX
    INT 10H
    INC DX
    INT 10H
    INC CX
    INT 10H
    INC DX
    INT 10H
    INC CX
    INT 10H
    INC DX
    INT 10H
    INC CX
    INT 10H
    INC DX
    INT 10H
    INC CX
    INT 10H
    
    INC DX 
    INT 10H
    INC DX 
    INT 10H
    INC DX 
    INT 10H
    INC DX 
    INT 10H
    INC DX 
    INT 10H
    
    DEC CX
    INT 10H
    INC DX
    INT 10H
    DEC CX
    INT 10H
    INC DX
    INT 10H
    DEC CX
    INT 10H
    INC DX
    INT 10H
    DEC CX
    INT 10H
    INC DX
    INT 10H
    DEC CX
    INT 10H
    INC DX
    INT 10H
    DEC CX
    INT 10H
    INC DX
    INT 10H

    
    DEC CX
    INT 10H
    DEC CX
    INT 10H
    DEC CX
    INT 10H
    DEC CX
    INT 10H 
    
    INC DX
    INT 10H
    INC DX 
    INT 10H
    INC DX 
    INT 10H
    INC CX 
    INT 10H
    INC DX
    INT 10H
    INC CX 
    INT 10H
    INC DX
    INT 10H
    INC DX 
    INT 10H
    INC DX 
    INT 10H
    DEC CX
    INT 10H
    INC DX
    INT 10H
    DEC CX
    INT 10H
    INC DX
    INT 10H
    
    DEC DX
    INT 10H
    INC CX 
    INT 10H
    DEC DX 
    INT 10H
    INC CX 
    INT 10H
    DEC DX
    INT 10H
    DEC DX 
    INT 10H
    DEC DX
    INT 10H
    DEC CX 
    INT 10H
    DEC DX 
    INT 10H
    DEC CX
    INT 10H
    DEC DX
    INT 10H
    DEC DX
    INT 10H
    DEC DX
    INT 10H
    
    DEC CX
    INT 10H
    DEC CX
    INT 10H
    DEC CX
    INT 10H
    
    DEC DX
    INT 10H
    DEC CX
    INT 10H
    DEC DX
    INT 10H
    DEC CX
    INT 10H
    DEC DX
    INT 10H
    DEC CX
    INT 10H
    DEC DX
    INT 10H
    DEC CX
    INT 10H
    DEC DX
    INT 10H
    DEC CX
    INT 10H
    DEC DX
    INT 10H
    DEC CX
    INT 10H
    
    DEC DX
    INT 10H
    DEC DX
    INT 10H
    DEC DX
    INT 10H
    DEC DX
    INT 10H
    DEC DX
    INT 10H
    
    INC CX
    INT 10H
    DEC DX
    INT 10H
    INC CX
    INT 10H
    DEC DX
    INT 10H
    INC CX
    INT 10H
    DEC DX
    INT 10H
    INC CX
    INT 10H
    DEC DX
    INT 10H
    INC CX
    INT 10H
    DEC DX
    INT 10H
    INC CX
    INT 10H
    DEC DX
    INT 10H
            
    RET
    
DISPLAY_BALLOON1 ENDP    

DISPLAY_BALLOON2 PROC
    
    MOV AH,0CH
    INT 10H
    INC CX
    INT 10H
    INC CX
    INT 10H
    INC CX
    INT 10H
    INC CX
    INT 10H
    INC CX
    INT 10H
    INC CX
    INT 10H
    
    INC DX
    INT 10H
    INC CX
    INT 10H
    INC DX
    INT 10H
    INC CX
    INT 10H
    INC DX
    INT 10H
    INC CX
    INT 10H
    INC DX
    INT 10H
    INC CX
    INT 10H
    INC DX
    INT 10H
    INC CX
    INT 10H
    INC DX
    INT 10H
    INC CX
    INT 10H
    
    INC DX 
    INT 10H
    INC DX 
    INT 10H
    INC DX 
    INT 10H
    INC DX 
    INT 10H
    INC DX 
    INT 10H
    
    DEC CX
    INT 10H
    INC DX
    INT 10H
    DEC CX
    INT 10H
    INC DX
    INT 10H
    DEC CX
    INT 10H
    INC DX
    INT 10H
    DEC CX
    INT 10H
    INC DX
    INT 10H
    DEC CX
    INT 10H
    INC DX
    INT 10H
    DEC CX
    INT 10H
    INC DX
    INT 10H

    
    DEC CX
    INT 10H
    DEC CX
    INT 10H
    DEC CX
    INT 10H
    DEC CX
    INT 10H 
    
    INC DX
    INT 10H
    INC DX 
    INT 10H
    INC DX 
    INT 10H
    INC CX 
    INT 10H
    INC DX
    INT 10H
    INC CX 
    INT 10H
    INC DX
    INT 10H
    INC DX 
    INT 10H
    INC DX 
    INT 10H
    DEC CX
    INT 10H
    INC DX
    INT 10H
    DEC CX
    INT 10H
    INC DX
    INT 10H
    
    DEC DX
    INT 10H
    INC CX 
    INT 10H
    DEC DX 
    INT 10H
    INC CX 
    INT 10H
    DEC DX
    INT 10H
    DEC DX 
    INT 10H
    DEC DX
    INT 10H
    DEC CX 
    INT 10H
    DEC DX 
    INT 10H
    DEC CX
    INT 10H
    DEC DX
    INT 10H
    DEC DX
    INT 10H
    DEC DX
    INT 10H
    
    DEC CX
    INT 10H
    DEC CX
    INT 10H
    DEC CX
    INT 10H
    
    DEC DX
    INT 10H
    DEC CX
    INT 10H
    DEC DX
    INT 10H
    DEC CX
    INT 10H
    DEC DX
    INT 10H
    DEC CX
    INT 10H
    DEC DX
    INT 10H
    DEC CX
    INT 10H
    DEC DX
    INT 10H
    DEC CX
    INT 10H
    DEC DX
    INT 10H
    DEC CX
    INT 10H
    
    DEC DX
    INT 10H
    DEC DX
    INT 10H
    DEC DX
    INT 10H
    DEC DX
    INT 10H
    DEC DX
    INT 10H
    
    INC CX
    INT 10H
    DEC DX
    INT 10H
    INC CX
    INT 10H
    DEC DX
    INT 10H
    INC CX
    INT 10H
    DEC DX
    INT 10H
    INC CX
    INT 10H
    DEC DX
    INT 10H
    INC CX
    INT 10H
    DEC DX
    INT 10H
    INC CX
    INT 10H
    DEC DX
    INT 10H 
       
    RET
    
DISPLAY_BALLOON2 ENDP    

DISPLAY_BALLOON3 PROC
    
    MOV AH,0CH
    INT 10H
    INC CX
    INT 10H
    INC CX
    INT 10H
    INC CX
    INT 10H
    INC CX
    INT 10H
    INC CX
    INT 10H
    INC CX
    INT 10H
    
    INC DX
    INT 10H
    INC CX
    INT 10H
    INC DX
    INT 10H
    INC CX
    INT 10H
    INC DX
    INT 10H
    INC CX
    INT 10H
    INC DX
    INT 10H
    INC CX
    INT 10H
    INC DX
    INT 10H
    INC CX
    INT 10H
    INC DX
    INT 10H
    INC CX
    INT 10H
    
    INC DX 
    INT 10H
    INC DX 
    INT 10H
    INC DX 
    INT 10H
    INC DX 
    INT 10H
    INC DX 
    INT 10H
    
    DEC CX
    INT 10H
    INC DX
    INT 10H
    DEC CX
    INT 10H
    INC DX
    INT 10H
    DEC CX
    INT 10H
    INC DX
    INT 10H
    DEC CX
    INT 10H
    INC DX
    INT 10H
    DEC CX
    INT 10H
    INC DX
    INT 10H
    DEC CX
    INT 10H
    INC DX
    INT 10H

    
    DEC CX
    INT 10H
    DEC CX
    INT 10H
    DEC CX
    INT 10H
    DEC CX
    INT 10H 
    
    INC DX
    INT 10H
    INC DX 
    INT 10H
    INC DX 
    INT 10H
    INC CX 
    INT 10H
    INC DX
    INT 10H
    INC CX 
    INT 10H
    INC DX
    INT 10H
    INC DX 
    INT 10H
    INC DX 
    INT 10H
    DEC CX
    INT 10H
    INC DX
    INT 10H
    DEC CX
    INT 10H
    INC DX
    INT 10H
    
    DEC DX
    INT 10H
    INC CX 
    INT 10H
    DEC DX 
    INT 10H
    INC CX 
    INT 10H
    DEC DX
    INT 10H
    DEC DX 
    INT 10H
    DEC DX
    INT 10H
    DEC CX 
    INT 10H
    DEC DX 
    INT 10H
    DEC CX
    INT 10H
    DEC DX
    INT 10H
    DEC DX
    INT 10H
    DEC DX
    INT 10H
    
    DEC CX
    INT 10H
    DEC CX
    INT 10H
    DEC CX
    INT 10H
    
    DEC DX
    INT 10H
    DEC CX
    INT 10H
    DEC DX
    INT 10H
    DEC CX
    INT 10H
    DEC DX
    INT 10H
    DEC CX
    INT 10H
    DEC DX
    INT 10H
    DEC CX
    INT 10H
    DEC DX
    INT 10H
    DEC CX
    INT 10H
    DEC DX
    INT 10H
    DEC CX
    INT 10H
    
    DEC DX
    INT 10H
    DEC DX
    INT 10H
    DEC DX
    INT 10H
    DEC DX
    INT 10H
    DEC DX
    INT 10H
    
    INC CX
    INT 10H
    DEC DX
    INT 10H
    INC CX
    INT 10H
    DEC DX
    INT 10H
    INC CX
    INT 10H
    DEC DX
    INT 10H
    INC CX
    INT 10H
    DEC DX
    INT 10H
    INC CX
    INT 10H
    DEC DX
    INT 10H
    INC CX
    INT 10H
    DEC DX
    INT 10H 
       
    RET
    
DISPLAY_BALLOON3 ENDP    

MOVE_BALLOON PROC
                  
    MOV AL,0
    CALL DISPLAY_BALLOON1
    CALL DISPLAY_BALLOON2
    CALL DISPLAY_BALLOON3
    
    ADD DX,VEL_Y
    
    CALL CHECK_BOUNDARY
    
    TEST_TIMER:
    CMP TIMER_FLAG,1 
    JNE TEST_TIMER
    MOV TIMER_FLAG,0
    MOV AL,3
    
    CALL DISPLAY_BALLOON1
    CALL DISPLAY_BALLOON2
    CALL DISPLAY_BALLOON3
                  
    RET
    
MOVE_BALLOON ENDP

CHECK_BOUNDARY PROC
    
    CMP DX,20
    JG DONE         
    MOV DX,180
    JMP DONE
    DONE:
    
    RET
    
CHECK_BOUNDARY ENDP


MAIN PROC
    
    MOV AX,@DATA
    MOV DS,AX
    
    CALL SET_DISPLAY_MODE
    CALL ID
    
    MOV NEW_TIMER_VEC,OFFSET TIMER_TICK;OFFSET
    MOV NEW_TIMER_VEC+2,CS;SEGMENT
    MOV AL,1CH;INTERRUPT TYPE
    LEA DI,OLD_TIMER_VEC;VECTOR BUFFER
    LEA SI,NEW_TIMER_VEC;NEW VECTOR
    CALL SETUP_INT
    
    MOV CX,80
    MOV DX,120
    MOV AL,3
    CALL DISPLAY_BALLOON1 
    
    ;TEST_TIMER:
    ;CMP TIMER_FLAG,1;TICKED?
    ;JNE TEST_TIMER
    ;MOV TIMER_FLAG,0;CLEAR
    ;CALL MOVE_BALLOON
    
    ;TEST_TIMER_2:
    ;CMP TIMER_FLAG,1;TICKED?
    ;JNE TEST_TIMER_2
    ;MOV TIMER_FLAG,0;CLEAR
    ;JMP TEST_TIMER
    
    MOV CX,150
    MOV DX,40
    MOV AL,3
    CALL DISPLAY_BALLOON2
    
    ;TEST_TIMER:
    ;CMP TIMER_FLAG,1;TICKED?
    ;JNE TEST_TIMER
    ;MOV TIMER_FLAG,0;CLEAR
    ;CALL MOVE_BALLOON
    
    ;TEST_TIMER_2:
    ;CMP TIMER_FLAG,1;TICKED?
    ;JNE TEST_TIMER_2
    ;MOV TIMER_FLAG,0;CLEAR
    ;JMP TEST_TIMER
    
    MOV CX,230
    MOV DX,100
    MOV AL,3
    CALL DISPLAY_BALLOON3

    
    ;TEST_TIMER:
    ;CMP TIMER_FLAG,1;TICKED?
    ;JNE TEST_TIMER
    ;MOV TIMER_FLAG,0;CLEAR
    ;CALL MOVE_BALLOON
    
    ;TEST_TIMER_2:
    ;CMP TIMER_FLAG,1;TICKED?
    ;JNE TEST_TIMER_2
    ;MOV TIMER_FLAG,0;CLEAR
    ;JMP TEST_TIMER 
    
    MOV AH,0
    INT 16H
    
    MOV AH,0
    MOV AL,3
    INT 10H
    
    MOV AH,4CH
    INT 21H     
    
MAIN ENDP
    END MAIN