
; write an asm to count the number of elements having odd number of logic
; ones in an array with 5 bytes

; store the count in the data segment

DATA SEGMENT
        ARR DB 5 DUP(01)
        COUNT DB 00
DATA ENDS


CODE SEGMENT
        ASSUME CS: CODE, DS: DATA
START:
        MOV AX, DATA
        MOV DS, AX;

        ;for i = 0; i < 5; i ++
        ; for ; till arr[i] becomes zero ; 
        ;  if arr[i] % 2 == 1
        ;    count += 1
        ;  arr[i] /= 2

        MOV CX, 5
        MOV DX, 0; count var
        MOV SI, 0

        OUTER:

                INNER:
                        ; // DIV ARR[SI]
						mov ah, 0; // awesome BUG here entire thing was not working
                        MOV AL, ARR[SI]
                        MOV BL, 2;
                        DIV BL; get remainder by 2

                        CMP AH, 0;IF AH == 0
                        JZ REM
                                INC DX; increment count

                        REM:


                        ; store the q AL in AL WHICH HAPPENS AUTOMATICALLY
                        ; if ARR[I] / 2 == 0
                        ; if AL == 0
                        CMP AL, 0
                        mov ARR[SI], AL
                        JZ OUTOFIN
                        JMP INNER; if AL IS NOT ZERO then continue

                OUTOFIN:
                INC SI
      LOOP OUTER

      MOV COUNT, DX 


      MOV AH, 4CH
      INT 21H


CODE ENDS
END START


