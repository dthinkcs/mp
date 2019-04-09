data segment
msg1 db 'enter a lowercase sentence'
nextl db 10,13,'$'
max_len db 20
act_len db ?
string db 20 dup('$')
msg2 db 'uppercase sentence=$'
data ends

  print macro msg
  lea dx, msg
  mov ah,09h
  int 21h
  endm
  code segment
   assume cs:code, ds:data

 start:
   mov ax, data
   mov ds,ax
   mov es,ax

   print msg1
   lea dx, max_len      ;get the sentence
   mov ah, 0ah
   int 21h

   mov cl, act_len
   mov ch,0
   mov bl,'a'
   mov bh,'z'
   lea di,string

  back:
   mov al,bl
   scasb                ;compare with 'a'  = cmp al,[di]
   ja not_lower         ;if 'a'above [di]
   dec di
   mov al,bh
   scasb                ;compare with 'z'
   jb not_lower         ;if 'z' below [di]
   dec di

   mov dl,[di]          ;change to upper case
   sub dl,20H
   mov [di],dl  
   inc di
  not_lower:
   loop back            ;loop until end of string

   print msg2
   print nextl
   print string

   mov ah,4ch
   int 21h
  code ends
end start
