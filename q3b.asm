DATA SEGMENT
  x dB 01h,22h,13h,34h,15h,06h,56h,08h,09h,50h
DATA ends

CODE SEGMENT
  ASSUME CS:CODE,DS:DATA
  START:
        MOV AX,DATA
        MOV DS,AX
		MOV CX,09H
		BACK1: PUSH CX
		      LEA SI,x
			  BACK: MOV AL,[SI]
			        CMP AL,[SI+1]
					JLE DOWN
					XCHG AL,[SI+1]
					MOV [SI],AL
			  DOWN: INC SI
			        LOOP BACK
			        POP CX
	                LOOP BACK1
					MOV AH,4CH
					INT 21H
	CODE ends
	end Start