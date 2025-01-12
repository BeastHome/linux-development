global _start

_start:
    mov r15, 10
  .again:
    cmp r15, 0
    jle .over  
  mov rax, 1        ; write(
  mov rdi, 1        ;   STDOUT_FILENO,
  mov rsi, msg      ;   "Hello, world!\n",
  mov rdx, msglen   ;   sizeof("Hello, world!\n")
  syscall           ; );
      dec r15
    jmp .again

  .over:
		mov rax, 60
		mov rdi, 0
		syscall

  msg: db "Hello, world!", 10
  msglen: equ $ - msg