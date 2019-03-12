data segment
num1 db 20h
num2 db 15h
lcm dw ?
data ends
stack segment
dw 100 dup(?)
tos label word
stack ends
code segment
assume cs:code,ds:data,ss:stack
start: mov ax,data
       mov ds,ax
       mov ax,stack
       mov ss,ax
       mov ah,0
       mov al,num1
       mov bl,num2
       lea sp,tos
back:  push ax
       div bl
       cmp ah,0
       jz down
       pop ax
       add al,num1
       adc ah,0
       jmp back
down: pop lcm
      mov ah,4ch
      int 21h
      code ends
      end start
