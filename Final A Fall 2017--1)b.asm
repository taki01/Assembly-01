org 100h
.stack 100h
.model small
.data
    char db 'TYPE A CHARACTER : $'
    bin db 10,13,'THE ASCII CODE OF A IN BINARY IS $'
    num db 10,13,'THE NUMBER OF 0 BITS IS $'
    x  db 0
.code
main proc
    
    mov ax,@data
    mov ds,ax
    
    mov ah,9
    lea dx,char
    int 21h
    
    mov ah,1
    int 21h
    mov bl,al
    mov cx,8
    
    mov ah,9
    lea dx,bin
    int 21h
    
    top:
        rol bl,1
        jc one
        
        mov ah,2
        mov dl,'0'
        int 21h
        inc x
        jmp next
    one:
        mov ah,2
        mov dl,'1'
        int 21h
    next: 
        loop top
    mov ah,9
    lea dx,num
    int 21h
        
    mov ah,2
    mov dl,x
    add dl,48
    int 21h   

endp main
end main
ret