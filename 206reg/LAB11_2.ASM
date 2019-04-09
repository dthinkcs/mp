Code Segment 
 Assume CS:Code
Start: 
	  MOV AH, 0
	  MOV AL, 03
	  INT 10H
	  
	  MOV AH, 06
	  MOV AL, 0
	  MOV BH, 01110000B
	  MOV CH, 10
          MOV CL, 2
	  MOV DH, 15
	  MOV DL, 40
	  INT 10H
	  
	  MOV AH, 4CH
	  INT 21H
  CODE ENDS
 END Start
