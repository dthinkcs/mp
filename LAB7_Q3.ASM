Data Segment
        arr db 05H,04H,03H,02H,01H,32H,42H,52H,57H,92H
        min dB ?
Data ends
Code Segment
        Assume CS:Code,DS:Data
        Start:
                MOV AX,Data
                MOV DS,AX
                LEA SI,arr
                LEA DI,min
                MOV DL,[SI]
                MOV min,DL
                CALL small
                MOV AH,4CH
                INT 21H

                small PROC
                        check:
                                MOV BL,[SI]
                                MOV BH,[DI]
                                CMP BL,BH
                                JC exchange
                                CMP SI,09H
                                JE exit
                                INC SI
                                JMP check
                        exchange:
                                XCHG BH,BL
                                MOV min,BH
                                INC SI
                                JMP check
                        exit:
                                MOV min,BH
                                RET
                small endp
Code ends
end Start

