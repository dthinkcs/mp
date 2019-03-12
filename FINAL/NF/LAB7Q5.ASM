data segment
array1 dw 0099h,0089h,0079h,0069h,0059h,0049h,0039h,0029h,0019h,0010h
data ends
code segment
assume cs:code,ds:data
start:
mov ax,data
mov ds,ax
mov cx,9
back1: push cx
lea si,array1
back:
mov ax,[si]
cmp ax,[si+2]
jc down
xchg ax,[si+2]
mov [si],ax
down:inc si
inc si
loop back
pop cx
loop back1
mov ah,4ch
int 21h
code ends
end start
