data segment
msg db 'Hello'
col db 40
data ends
code segment
assume cs:code,ds:data
start: mov ax,data
mov ds,ax
mov ah,0
mov al,3
int 10h
mov dl,00
lea di,msg
mov cl,col
up: mov dh,[di]
push ds
mov ax,0b800h
mov ds,ax
mov bl,12
mov al,169
mul bl
mov bx,ax
mov al,2
mul cl
add ax,bx
mov si,ax
mov [si],dh
mov byte ptr [si+1],35h
inc di
inc cl
pop ds
inc dl
cmp dl,05
jnz up
mov ah,4ch
int 21h
code ends
end start
