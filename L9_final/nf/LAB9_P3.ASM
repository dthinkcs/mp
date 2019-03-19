
data segment
        a db 'Enter the main string',10,13,'$'
        maxlen db 20
        actlen db ?
        str db 20 dup(?)
        b db 'Enter the substring',10,13,'$'
        maxlen2 db 10
        actlen2 db ?
        substr db 10 dup(?)
data ends
code segment
	assume cs:code,ds:data,es:data     
print macro str
	lea dx,str
	mov ah,09
	int 21h
endm
start:
	mov ax,data
	mov ds,ax
	mov es,ax
	print a
	lea dx,maxlen
	mov ah,0ah
	int 21h

		
code ends
end start

