hcf macro n1,n2
mov ax,n1
mov bx,n2
gcds: cmp ax,bx
      jc down
      jz exit
      divax: mov dx,0
             div bx
             cmp dx,0
             je exit
             mov ax,dx
             jmp gcds
      down: xchg ax,bx
            jmp divax
      exit: mov gcd,bx
       endm
hcf1 macro n3,n4
mov ax,n3
mov bx,n4
gcdt: cmp ax,bx
      jc down1
      jz exit1
      divax1: mov dx,0
             div bx
             cmp dx,0
             je exit1
             mov ax,dx
             jmp gcdt
      down1: xchg ax,bx
            jmp divax1
      exit1: mov gcd,bx
       endm
hcf2 macro n5,n6
mov ax,n5
mov bx,n5
gcdu: cmp ax,bx
      jc down2
      jz exit2
      divax2: mov dx,0
             div bx
             cmp dx,0
             je exit2
             mov ax,dx
             jmp gcdu
      down2: xchg ax,bx
            jmp divax2
      exit2: mov gcd,bx
       endm


data segment
num1 dw 0075,0050,0080,0095
gcd dw ?
gcd1 dw ?
gcd2 dw ?
data ends
code segment
assume cs:code,ds:data
start: mov ax,data
       mov ds,ax
       hcf num1,num1+2
       mov bx,gcd
       mov gcd1,bx
       hcf1 num1+4,num1+6
       mov bx,gcd
       mov gcd2,bx
       hcf2 gcd1,gcd2

       mov ah,4ch
       int 21h
       code ends
       end start
