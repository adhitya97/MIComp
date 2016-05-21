.model small
.stack 20
.data
.code
.startup
	mov ax,@data
	mov ds,ax
	
	mov ah,0h ;setting video mode
	mov al,12h
	int 10h
	
	mov al,1100b ; setting color of pixels
	
	mov dx,100 ; setting initial row
	mov si,150 ; number of pixels
	mov cx,240 ; setting initial column
	
	loopy1:
		mov ah,0ch
		int 10h
		inc cx
		dec si
	jnz loopy1
	
	mov al,1101b
	
	mov dx,100 ; setting initial row
	mov si,150 ; number of pixels
	mov cx,240
	
	loopy2:
		mov ah,0ch
		int 10h
		dec cx
		inc dx
		dec si
	jnz loopy2
	
	mov al,1000b
	
	mov dx,100
	mov si,150
	mov cx,390
	
	loopy3:
		mov ah,0ch
		int 10h
		inc cx
		inc dx
		dec si
	jnz loopy3
	
	mov al,0010b
	
	mov si,150
	mov cx,90
	mov dx,250
	
	loopy4:
		mov ah,0ch
		int 10h
		inc cx
		inc dx
		dec si
	jnz loopy4
	
	mov al,0001b
	
	mov si,150
	mov cx,540
	mov dx,250
	
	loopy5:
		mov ah,0ch
		int 10h
		dec cx
		inc dx
		dec si
	jnz loopy5
	
	mov al,1111b
		
	mov dx,400
	mov si,150
	mov cx,240
	
	loopy6:
		mov ah,0ch
		int 10h
		inc cx
		dec si
	jnz loopy6
	
	
	mov ah,07h ;waits for keypress
	int 21h
	mov ah,4ch
	
	.exit
end