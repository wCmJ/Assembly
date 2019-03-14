Registers:
    General registers:
        data registers:
            EAX,EBX,ECX,EDX
        pointer registers:
            IP,SP,BP
        index registers:
            SI,DI
    Control registers:
        OF,DF,IF,TF,SF,ZF,AF,PF,CF
    Segment registers:
        CS,DS,SS

System call:
    move sys call num to EAX
    move argus to EBX, ECX, EDX, ESI, EDI, EBP
    call the relevant interrupt(80h)
    return result to EAX

Addressing modes:
    register addressing:
        register contains the operand
    immediate addressing:
        an immediate operand has a constant value or an expression
    direct memory addressing:
        segment + offset

MOV instruction:
    mov destination, source
    mov register, register
    mov register, immediate
    mov register, memory
    mov memory, register
    mov memory, immediate
    
    MY_TABLE TIMES 10 DW 0
    MOV EBX, [MY_TABLE]     ; Effective Address of MY_TABLE in EBX
    MOV [EBV], 110          ; MY_TABLE[0] = 110

Type specifier:
    BYTE    1       DB(allocate 1 byte)
    WORD    2       DW  ...
    DWORD   4       DD  
    QWORD   8       DQ
    TBYTE   10      DT
    
Allocating storage space for uninitialized data:
    RESB
    RESW
    RESD
    RESQ
    REST
    
EQU: is used for defining constants.
    CONSTANT_NAME EQU expression
%assign: define numeric constant
    %assign TOTAL 10
%define: define both numeric and string constants
    %define PTR [EBP+4]
INC: increment by one
    INC destination
DEC: decrement by one
    DEC destination
ADD/SUB:
    ADD/SUB destination, source
    r to r
    r to m
    r to constant data
    m to constant data
    m to r
MUL(unsigned data)/IMUL(signed data):
    AL  ×   8-bit   ->  AH  AL
    AX  ×   16-bit  ->  DX  AX
    EAX ×   32-bit  ->  EDX EAX    
DIV/IDIV:
    AX(16-bit)      ÷   8-bit   ->      AL(quotient)    AH(remainder)    
    DX AX(32-bit)   ÷   16-bit  ->      AX()            DX()
    EDX EAX         ÷   32-bit  ->      EAX()           EDX() 
AND/OR/XOR/TEST/NOT:
    
CMP destination, source
CMP DX, 00  compare the DX value with zero
JE L7       if yes, then jump to label L7
L7:
...

INC EDX
CMP EDX, 10
JLE LP1     if less than or equal to 10

JMP
SHL         (shift left)
JE/JZ       jump equal or jump zero             ZF
JNE/JNZ     jump not equal or jump not zero     ZF
JA/JNBE     jump above or jump not below/equal  CF,ZF
JAE/JNB
JB/JNAE
JBE/JNA

JXCZ
JC
JNC
JO
JNO
JP/JPE
JNP/JPO
JS
JNS
OF  ZF  DF  PF  CF  IF  AF  TF  SF























