data segment
msg1 db 'enter 2 digit BCD number:'
nextl db 10,13,'$'
msg2 db 'Sum:$'
a db ?
b db ?
sum dw 0
data ends

 print macro msg
 lea dx,msg
 mov ah,09
 int 21h
 endm

code segment

   assume cs:code, ds:data

  start:
     mov ax,data
     mov ds,ax

     print msg1
     call get_2digit_BCD
     PRINT nextl
     mov a,al

     print msg1
     call get_2digit_BCD
     print nextl
     mov b,al

     mov ah,0
     add al,a
     DAA
     adc ah,0
     mov sum,ax

     print msg2
     print nextl
     mov ax, sum
     call disp
     mov ah,4ch
     int 21h

     get_2digit_BCD:
     ;TENS Digit
        mov ah,01
        int 21h
        sub al,30H
        mov cl,04
        shl al,cl
        mov bl,al ; bl:N0H  

     ;ONES Digit
        mov ah,01
        int 21h
        sub al,30H

        add bl,al  ;BCD NUMBER: bl
        mov al,bl   ;al=bl
        ret



     disp:
        mov bl,al

        mov dl,ah  ; disp Hundreds digit
        add dl,30h
        mov ah,02h
        int 21h

        MOV AL,BL
        and al,0f0h ; disp Tens digit
        mov cl,04
        shr al,cl
        add al,30h
        mov dl,al
        mov ah,02h
        int 21h

        and bl,0fh  ; disp ones digit
        mov al,bl
        add al,30h
        mov dl,al
        mov ah,02h
        int 21h
        ret
    code ends
 end start

