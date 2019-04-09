data segment
 buf1 db 30
 len1 db ?
 str1 db 30 dup(?)

 buf2 db 30
 len2 db ?
 str2 db 30 dup(?)

 buf3 db 30
 len3 db ?
 str3 db 30 dup(?)

 buf4 db 30
 len4 db ?
 str4 db 30 dup(?)

 buf5 db 30
 len5 db ?
 str5 db 30 dup(?)

 len  db ?

data ends

printgap macro
 mov dl,13
 mov ah,02
 int 21h
 mov dl,10
 mov ah,02
 int 21h

endm

code segment
assume cs:code,ds:data
start: mov ax,data
       mov ds,ax

       mov ah,00
       mov al,03
       int 10h

  ; Dispalaying a blank window

   mov ah,06
   mov al,0
   mov bh,00010111b
   mov ch,10
   mov cl,20
   mov dh,14
   mov dl,50
   int 10h
       
       lea dx,buf1
       mov ah,0ah
       int 21h
       printgap

       mov cl,len1
       mov dl,10
       lea di,str1
       call disp

       lea dx,buf2
       mov ah,0ah
       int 21h
       printgap

       mov cl,len2
       mov dl,11
       lea di,str2
       call disp


       lea dx,buf3
       mov ah,0ah
       int 21h
       printgap

       mov cl,len3
       mov dl,12
       lea di,str3
       call disp


       lea dx,buf4
       mov ah,0ah
       int 21h
       printgap

       mov cl,len4
       mov dl,13
       lea di,str4
       call disp

       lea dx,buf5
       mov ah,0ah
       int 21h

       mov cl,len5
       mov dl,14
       lea di,str5
       call disp


        mov ah,4ch
        int 21h

 disp proc
     mov ch,20

 up: mov dh,[di]
     push ds
     mov ax,0B800H
     mov ds,ax

     mov bl,dl
     mov al,160
     mul bl
     mov bx,ax
     mov al,02
     mul ch
     add bx,ax
     mov si,bx
     mov [si],dh
     mov byte ptr [si+1],00010010b
     inc di
     inc ch
     pop ds
     dec cl
     cmp cl,00
     jnz  up
     ret

 disp endp



  code ends
end start







