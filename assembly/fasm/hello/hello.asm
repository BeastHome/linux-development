format ELF64 executable

entry _start
  _start:    
    mov r15, 10
  .again:
    cmp r15, 0
    jle .over  
      mov rax, 1
      mov rdi, 1
      mov rsi, hello
      mov rdx, hello_len
      syscall
      dec r15
    jmp .again

  .over:
		mov rax, 60
		mov rdi, 0
		syscall

hello: 
  file "hello.txt"
hello_len = $-hello