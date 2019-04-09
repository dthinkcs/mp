code segment
assume cs:code
start: 
mov ah, 0   ; set display mode function.
mov al, 13h ; mode 13h = 320x200 pixels, 256 colors.
int 10h     ; set it!

mov cx, 20  ;col
mov dx, 20  ;row
mov ah, 0Ch ; put pixel

colcount:
inc cx
int 10h
cmp cx, 90
JNE colcount

mov cx, 20  ; reset to start of col
inc dx      ;next row
cmp dx, 90
JNE colcount

mov ah,4ch
int 21h
code ends
end start