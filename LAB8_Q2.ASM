Data Segment
        msg db "Please enter a 2 digit hex value:$"
        array db 2 dup(?)
        res dw ?
Data ends
Code Segment
        Assume CS:Code,DS:Data
        Start:
                MOV AX,Data
                MOV DS,AX
                LEA SI,array
                LEA DI,array
                MOV CX,2
                LEA DX,msg
                MOV AH,09H
                INT 21H

                Back:
                        PUSH CX
                        CALL read
                        INC SI
                        POP CX
                Loop Back

                MOV BL,[SI-1]
                MOV CL,[DI]
                MOV CH,0
                MOV BH,0
                ADD BX,CX
                MOV res,BX
                CALL Display
                XCHG BH,BL
                CALL Display
                MOV AH,4CH
                INT 21H

                Read PROC
                        MOV AH,01H
                        INT 21H
                        SUB AL,30H
                        CMP AL,0AH
                        JC Down
                        SUB AL,07H

                        Down:
                                MOV CL,4
                                SHL AL,CL
                                MOV BL,AL
                                MOV AH,01H
                                INT 21H
                                SUB AL,30H
                                CMP AL,0AH
                                JC exit
                                SUB AL,07H

                        exit:
                                ADD BL,AL
                                MOV [SI],BL
                                RET
                Read endp
                Display PROC
                        MOV DL,BH
                        MOV CL,04
                        SHR DL,CL
                        CMP DL,0AH
                        JC Down1
                        ADD DL,07H
                        Down1:
                                ADD DL,30H
                                MOV AH,02H
                                INT 21H
                                MOV DL,BH
                                AND DL,0FH
                                CMP DL,0AH
                                JC Down2
                                ADD DL,07H
                                Down2:
                                        ADD DL,30H
                                        MOV AH,02H
                                        INT 21H
                                        RET
                Display endp
Code ends
end Start
