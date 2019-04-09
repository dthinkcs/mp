data segment
array1 db 01h,02h,03h,04h,05h
array2 db 06h,07h,08h,09h,10h
data ends
code segment
assume cs:code,ds:data
start: mov ax,data
mov ds,ax
lea si,array1
lea di,array2
mov cx,05h
up: mov al,[si]
mov bl,[di]
mov [SI],bL
mov [di],AL
INC si
INC di
loop up
mov ah,4ch
int 21h
code ends
end start
