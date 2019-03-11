; E1: using less instructions
.data
    var1 DWORD 123

mov ebx, var1
add eax, ebx

add eax, var1

;E2: using an instruction with less bytes

