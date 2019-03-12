data segment
array1 dw 0012h,0023h,0034h,0045h,0056h,0067h,0078h,0089h,0032h,0050h
num1 dw 0067h
msg1 db "found$"
msg2 db "notfound$"
data ends
code segment
assume cs:code,ds:data
start:
mov ax,data
mov ds,ax
mov cx,10
lea si,array1
back:mov ax,[si]
cmp ax,num1
je found
inc si
inc si
loop back
lea dx,msg2
mov ah,09
int 21h
mov ah,4ch
int 21h
found:lea dx,msg1
mov ah,09
int 21h
mov ah,4ch
int 21h
code ends
end start



