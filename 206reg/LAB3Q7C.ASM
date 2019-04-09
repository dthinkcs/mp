data segment
num1 dd 23456789h
num2 dd 12348900h
res dd ?
BORROW dB ?
data ends
code segment
assume CS:code,DS:data
start:
mov ax,data
mov ds,ax
mov cx,04
clc
lea SI,num1
lea DI,num2
lea BX,res
back: MOV AL,[SI]
sbb al,[DI]
das
mov [bx],al
iNc si
inc di
inc bx
loop back
sbb BORROW,0
mov ah,4ch
int 21h
code ends
end start
