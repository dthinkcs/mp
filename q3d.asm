DATA SEGMENT
  x dW 0131h,2122h,6013h,3134h,0015h,3706h,1056h,0408h,1909h,8550h
DATA ends

CODE SEGMENT
  ASSUME CS:CODE,DS:DATA
  START:
        MOV AX,DATA
        MOV DS,AX
		MOV CX,09H
		BACK1: PUSH CX
		       LEA SI,x
			   BACK: MOV AX,[SI]
			         CMP AX,[SI+2]
					 JLE DOWN
					 XCHG AX,[SI+2]
					 MOV [SI],AX
			   DOWN: INC SI
			         INC SI
			         LOOP BACK
			         POP CX
	                 LOOP BACK1
					 MOV AH,4CH
					 INT 21H
	CODE ends
	end Start