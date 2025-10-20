global _start

section .data
    filename db "output.txt", 0
    message db "Hello world", 10
    msg_len equ $ - message
    success_msg db "Write success!", 10
    success_len equ $ - success_msg
    error_msg db "Error writing file!", 10
    error_len equ $ - error_msg

section .text
_start:
   
    mov rax, 2              
    mov rdi, filename      
    mov rsi, 0o101        
    mov rdx, 0o644          
    syscall

    cmp rax, 0              
    jl error

    mov r8, rax           

    mov rax, 1              
    mov rdi, r8            
    mov rsi, message       
    mov rdx, msg_len        
    syscall

    cmp rax, 0             
    jl error

    
    mov rax, 3              
    mov rdi, r8             
    syscall

   
    mov rax, 1              
    mov rdi, 1              
    mov rsi, success_msg
    mov rdx, success_len
    syscall

    
    mov rax, 60             
    mov rdi, 0
    syscall

error:
    
    mov rax, 1              
    mov rdi, 2              
    mov rsi, error_msg
    mov rdx, error_len
    syscall

    mov rax, 60            
    mov rdi, 1
    syscall
