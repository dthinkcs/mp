data segment
 c1 db  01000000b
 c2 db  00100000b
 c3 db  00010000b
data ends


code segment
assume cs:code,ds:data
start: mov ax,data
       mov ds,ax

 up:
       mov ah,00
       mov al,03
       int 10h
  
       mov bh,c1
       mov ah,07
       mov al,0
       mov ch,10
       mov cl,2
       mov dh,20
       mov dl,40
       int 10h

       mov bh,c2
       mov ah,07
       mov al,0
       mov ch,12
       mov cl,8
       mov dh,18
       mov dl,34
       int 10h

       mov bh,c3
       mov ah,07
       mov al,0
       mov ch,14
       mov cl,14
       mov dh,16
       mov dl,28
       int 10h


       mov dh,c1
       mov dl,c2
       mov c1,dl
       mov dl,c3
       mov c2,dl
       mov c3,dh

       call delay

       mov dl,0ffh
       mov ah,06h
       int 21h
       jnz down
       jmp up

down:  mov ah,4ch
       int 21h

delay proc
     mov si,050h
  up1: mov di,0780h
  up2: dec di
       cmp di,00
       jnz up2
       dec si
       cmp si,00
       jnz up1
       ret
delay endp

     code ends
    end start

