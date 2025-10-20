global _start                      

section .data                      
    message db  "Hello world!",10  
    length  equ $ - message        
    error_msg db "ERROR!",10 
    error_len equ $ - error_msg    

section .text                      
_start:   
    mov rax, 1                     
    mov rdi, 1                     
    mov rsi, message               
    mov rdx, length                
    syscall                        
    
    cmp rax, 0                     
    jl error_exit 

    mov rax, 60                    
    mov rdi, 0                     
    syscall                          

error_exit:                        
    
    mov rax, 1                     
    mov rdi, 2                     
    mov rsi, error_msg           
    mov rdx, error_len             
    syscall

    mov rax, 60                   
    mov rdi, 1                     
    syscall
