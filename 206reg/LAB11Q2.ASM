data segment
msg db 'Hello$'
col db 40
row db 12
data ends
code segment
assume cs:code,ds:data
start: mov ax,data
mov ds,ax
chk: call refresh
mov dl,0ffh
mov ah,06
int 21h
cmp al,'r'
jz iny
cmp al,'l'
jz dey
cmp al,'d'
jz inx
cmp al,'u'
jz dex
cmp al,'t'
jnz chk
mov ah,4ch
int 21h
iny: inc col
call refs
jmp chk
dey: dec col
call refs
jmp chk
inx: inc row
call refs
jmp chk
dex: dec row
call refs
jmp chk
refresh proc
mov dl,00h
lea di,msg
mov cl,col
up: mov bl,row
mov dh,[di]
push ds
mov ax,0B800h
mov ds,ax
mov al,160
mul bl
mov bx,ax
mov al,2
mul cl
add ax,bx
mov si,ax
mov [si],dh
mov byte ptr [si+1],74h
inc di
inc cl
pop ds
inc dl
cmp dl,05
jnz up
ret
refresh endp
refs proc
mov ah,0
mov al,3
int 10h
ret
refs endp
code ends
end start
