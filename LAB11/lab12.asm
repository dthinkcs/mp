data segment
buffer1 db 10
len1 db ?
str1 db 10 dup (?)
buffer2 db 10
len2 db ?
str2 db 10 dup (?)
buffer3 db 10
len3 db ?
str3 db 10 dup (?)
buffer4 db 10
len4 db ?
str4 db 10 dup (?)
buffer5 db 10
len5 db ?
str5 db 10 dup (?)
data ends
code segment
assume cs:code,ds:data
disp proc
mov ch,00
up: mov dh,[di]
push ds
mov ax,0b800h
mov ds,ax
mov bl,dl
mov al,160
mul bl
mov bx,ax
mov al,2
mul cl
add ax,bx
mov si,ax
mov [si],dh
mov byte ptr [si+1],27h
inc di
inc cl
inc bl
pop ds
inc ch
cmp ch,05
jnz up
ret
disp endp

start: mov ax,data
mov ds,ax
mov dx,offset buffer1
mov ah,0ah
int 21h
mov dx,offset buffer2
mov ah,0ah
int 21h
mov dx,offset buffer3
mov ah,0ah
int 21h
mov dx,offset buffer4
mov ah,0ah
int 21h
mov dx,offset buffer5
mov ah,0ah
int 21h
mov ah,0
mov al,03
int 10h
mov ah,06
mov al,7
mov bh,01110001b
mov ch,10
mov cl,20
mov dh,15
mov dl,60
int 10h
mov dl,10
mov cl,30
lea di,str1
call disp
mov dl,11
mov cl,30
lea di,str2
call disp
mov dl,12
mov cl,30
lea di,str3
call disp
mov dl,13
mov cl,30
lea di,str4
call disp
mov dl,14
mov cl,30
lea di,str5
call disp
exit: mov ah,4ch
int 21h
code ends
end start

