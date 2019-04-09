;Password input and validation
disp macro msg
	lea dx , msg
	mov ah , 09h
	int 21h
endm             

data segment
	password dB 'PASSWRD$'
	msg1 dB 'Valid Password$'        
	msg2 dB '*$'
	msg3 dB 10 ,13 , '$'
	msg4 dB 'Invalid Password$'
	entered dB ?
data ends        

code segment
	assume cs:code , ds:data
	start : mov ax , data
		mov ds , ax
		mov es , ax
		mov bl , 13
		lea si , entered
	up:     mov ah , 08h
		int 21h
		disp msg2
		cmp al , bl
		jz outt
		mov [si] , al
		inc si
		jmp up

	outt:   lea di , entered
		lea si , password
		mov bl , '$'
	iterate:
		cmp bl , [si]
		jz dis
		cmpsb
		jnz error       
		jmp iterate
		dis:    disp msg3
		disp msg1
	exit:
		mov ah , 4ch
		int 21h
	error:
		disp msg3
		disp msg4
		jmp exit
code ends
end start
