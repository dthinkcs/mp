PRINT MACRO STR
LEA DX,STR
MOV AH,09
INT 21h
ENDM
data segment
        a db 'Enter the main string',10,13,'$'
        maxlen db 20
        actlen db ?
        str db 20 dup(?)
        b db 'Enter the substring',10,13,'$'
        maxlen2 db 10
        actlen2 db ?
        substr db 10 dup(?)
data ends
code segment
assume cs:code,ds:data,es:data
        start:
        mov ax,data
        MOV DS,AX
        MOV ES,AX
        PRINT a
        LEA dx,maxlen
        mov ah,0AH
        int 21h

		
code ends
end start

