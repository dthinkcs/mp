hcf macro num1,num2
mov ax,num1
mov bx,num2
gcd1: cmp ax,bx
jc bigbx
jz exit
divax: mov dx,0
       div bx
       cmp dx,0
       je exit
       mov ax,dx
       jmp gcd1
 bigbx: xchg ax,bx
       jmp divax
 exit: mov gcd,bx
       endm

data segment
num1 dw 1015h
num2 dw 2030h
gcd dw ?
data ends
code segment
assume cs:code,ds:data
start: mov ax,data
       mov ds,ax
       hcf num1,num2
       mov ah,4ch
       int 21h
       code ends
       end start
       
