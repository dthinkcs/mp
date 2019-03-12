data segment
msg1 db 'enter 2 digit hexa number:'
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
     call get_2digit_hexa
     PRINT nextl
     mov a,al

     print msg1
     call get_2digit_hexa
     print nextl
     mov b,al

     mov ah,0
     add al,a
     adc ah,0
     mov sum,ax

     print msg2
     print nextl
     mov ax, sum
     call disp
     mov ah,4ch
     int 21h

     get_2digit_hexa:
     ;TENS Digit
        mov ah,01
        int 21h
        cmp al,39H
        jbe deec
        sub al,07H
     deec:
        sub al,30H
        mov cl,04
        shl al,cl
        mov bl,al ; bl:N0H  

     ;ONES Digit
        mov ah,01
        int 21h
        cmp al,39H
        jbe dec2
        sub al,07H
     dec2:
        sub al,30H

        add bl,al  ;HEXA NUMBER: bl
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
        cmp al,39h
        jbe x
        ADD al,07h
       x:
        mov dl,al
        mov ah,02h
        int 21h

        and bl,0fh  ; disp ones digit
        mov al,bl
        add al,30h
        cmp al,39h
        jbe x2
        ADD al,07h
       x2:
        mov dl,al
        mov ah,02h
        int 21h
        ret
    code ends
 end start

