;mov can not move from memory to memory
;the general purpose registers available in 32-bit are EAX, EBX, ECX, EDX, ESI, and EDI, do not touch ESP and EBP that are for system use.
;atomic: XADD, XCHG, MOVZX, MOVSX

; BTC

; E1: using less instructions
.data
    var1 DWORD 123

mov ebx, var1
add eax, ebx

; ADD can accept one memory operand
add eax, var1

;E2: using an instruction with less bytes
.data
    array DWORD 1,2,3
; to 3,1,2    
mov eax, array
xchg eax, [array+4]
xchg eax, [array+8]
xchg array, eax

;MOV instead of XCHG, MOV takes 5-byte machine code, XCHG takes 6
mov array, eax

;E3: implementing with memory variables
.data
    previous DWORD ?
    current DWORD ?
FibonacciByMemory PROC
    mov eax, 1
    mov previous, 0
    mov current, 0
L1:
    add eax, previous
    mov edx, current
    mov previous, edx
    mov current, eax
loop L1
    ret
FibonacciByMemory ENDP    

    mov previous, 1
    mov current, 1
L1:
    mov eax, previous
    add eax, current
    mov previous, current
    mov current, eax
    
;E4: use registers not memory
FibonacciByMemory PROC
    mov eax, 1
    xor ebx, ebx
    xor edx, edx
L1:
    add eax, ebx
    mov ebx, edx
    mov edx, eax
loop L1
    ret
FibonacciByMemory ENDP    

FibonacciByMemory PROC
    xor eax, eax
    mov ebx, 1
L1:
    xadd eax, ebx
loop L1
    ret
FibonacciByMemory ENDP






































