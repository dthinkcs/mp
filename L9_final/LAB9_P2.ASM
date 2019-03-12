PRINT MACRO STR
LEA DX,STR
MOV AH,09
INT 21h
ENDM
data segment
        msg1 db 'enter a string',10,13,'$'
        maxlen db 20
        actlen db ?
        str db 20 dup(?)
        msg2 db 13,10,'Palindrome$'
        msg3 db 13,10,'not a palindrome$'
data ends
code segment   
        assume cs:code,ds:data,es:data
        start:
        mov ax,data
        MOV DS,AX
        MOV ES,AX
        PRINT msg1
        LEA dx,maxlen
        mov ah,0AH
        int 21h
        lea si,str

        mov bl,actlen
        dec bx
        mov di,si
        add di,bx
        mov cl,actlen
        shr cx,1
        up:cld
        lodsb
        std
        scasb
        loopz up;
        jnz npa
        print msg2
        jmp ter
        npa: print msg3
        ter: mov ah,4ch
        int 21h
        code ends
        end start
