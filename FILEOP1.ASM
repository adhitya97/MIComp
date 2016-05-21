.model small
.stack 20
.data
	msg1 db "Hellodude$" ;9
	msg2 db 10,13,"Message is: $" 
	text db "Hahahaha$";8
	string db 255 dup(?)
	filename db "Yoyo.txt",0
	handle dw 0
.code
.startup
	mov ax,@data
	mov ds,ax
	
	mov ah,3ch ;creating file
    mov cx,0h
	lea dx,filename
	int 21h
	;jc error
	
	mov handle,ax ;making handle point to correct location
	
	mov bx,handle ;writing onto file
	mov ah,40h
	mov cx,9h
	lea dx,msg1
	int 21h
	jc error
	
	mov ah,3Eh ;closing a file
	mov bx,handle
	int 21h
	jc error
	
	mov ah,3dh ;opening existing file
	lea dx,filename
    mov al,00h ;read model
	int 21h
	jc error
	
	mov handle,ax ;making handle point to correct location
	
	mov ah,3fh ;reading from file
    mov bx,handle
	mov cx,09h
	lea dx,string
	int 21h
	jc error
	
	mov ah,3Eh ;closing a file
	mov bx,handle
	int 21h
	jc error
	
    lea dx,msg2 ;printing message on screen
    mov ah,09h
    int 21h
	
	lea si,string ;adding $ to the input string
	mov [si+9],byte ptr '$'
	
	lea dx,string ;printing the contents read from the file.
	mov ah,09h
	int 21h
	
	mov ah,3dh ;opening to append contents
	mov al,02h
	lea dx,filename
	int 21h
	jc error
	
	mov handle,ax ;making handle point to correct location
	
	mov ah,42h ;seeking eof to append
	mov al,02h
	mov bx,handle
	mov cx,00h
	mov dx,00h
	int 21h
	jc error
	
	mov ah,40h ;appending contents to the file
	mov bx,handle
	lea dx,text
	mov cx,8h
	int 21h
	jc error
	
	mov ah,3eh ;closing the file
	int 21h
	jc error
	
	error:
		mov ah,4ch
		int 21h
	
	.exit
end
	
	
