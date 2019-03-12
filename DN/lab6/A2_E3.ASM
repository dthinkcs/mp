;WALP TO COUNT NUMBER OF ELEMENTS HAVING ODD NUMBER ONES IN AN ARRAY
;WITH 5 BYTES AND STORE THE COUNT IN THE DATA SEGMENT


DATA SEGMENT
        A DB 5 DUP (?)
        ONES DB 0
        ODDONE DB 0
        RES DB 0
DATA ENDS


CODE SEGMENT
ASSUME CS:CODE, DS: DATA
START:
        MOV DX, DATA
        MOV DS, DX

        MOV CX, 5
        MOV SI, 0

       BACK:
                MOV ONES, 0
                MOV ODDONE, 0
                MOV AL, BYTE PTR A[SI]
                INC SI
                CALL FUNC
                CALL ODD
                CMP ODDONE, 0
                JZ EXIT
                INC RES

                EXIT: LOOP BACK

        MOV AH, 4CH
        INT 21H

        FUNC:
             MOV BL, 08

             L1:
                ROR AL, 01
                JNC L2
                INC ONES

             L2:
                DEC BL
                CMP BL, 0
                JNZ L1

        RET

        ODD:
                ROR ONES, 01
                JNC L5
                MOV ODDONE, 01
                        
                L5 :      RET


CODE ENDS
END START



