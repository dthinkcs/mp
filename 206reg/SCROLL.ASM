code segment
assume cs:code
start: mov ah,0
mov al,03
int 10h
mov ah,06
mov al,7
mov bh,01110000B
mov ch,10
mov cl,2
mov dh,15
mov dl,40
int 10h
mov ah,4ch
int 21h
code ends
end start

