Data Segment
		passBuffer db 20, "$", 20 dup(0)
        storedPass db "password"
        SuccessMsg db "password verified$"
        FailMsg db "invalid password$"
		
Code Segment
        Assume CS:Code
        Start:
			MOV AX, Data
			MOV DS, AX
			CALL EnterPass
			CALL VerifyPass
			
			MOV AH, 4CH
			INT 21H

	EnterPass PROC
			MOV DX, offset passBuffer
			MOV AH, 0AH
			INT 21H
			RET
	EnterPass EndP

	VerifyPass PROC
					LEA DI, storedPass
					LEA SI, passBuffer[2]
					MOV CL, 8
			PassLoop:
					MOV AL, [SI]
					MOV AH, [DI]
					CMP AH, AL
					JNE Fail
					INC SI
					INC DI
					Loop PassLoop
			Success:
					MOV AH, 09H
					LEA DX, SuccessMsg
					INT 21H
					JMP EXTVRFY
			Fail:
					MOV AH, 09H
					LEA DX, FailMsg
					INT 21H
					JMP EXTVRFY

			EXTVRFY:
					RET

	VerifyPass EndP
Code ends
End Start



