code segment
assume cs:code
start: mov ah,0
mov al,3
int 10h

mov ah,06
mov al, 7
mov bh,00010000B
mov ch,27
mov cl,3
mov dh,15
mov dl,39
int 10h
mov ah,06
mov al,7
mov bh,00100000B
mov ch,9
mov cl,2
mov dh,5
mov dl,13
int 10h
mov ah,4ch
int 21h
code ends
end start
