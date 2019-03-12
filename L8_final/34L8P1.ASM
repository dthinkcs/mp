data segment
m1 db "enter charachter$"
m3 db 10,8,"$"
m2 db "display$"
m4 db "$"
data ends

print macro msg
lea dx,msg
mov ah,04
int 21h
endm

code segment
assume cs:code , ds:data
start:
        mov ax,data
        mov ds,ax
        xor ax,ax
        print m1
	call enter
        print m3
	print m2
	mov dl,al
	mov ah,02
	int 21h

mov ah,4ch
int 21h
enter proc 
     back:   mov ah,01
             int 21h
       ret  
	enter endp     
code ends
end start