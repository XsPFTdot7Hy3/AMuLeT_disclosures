.intel_syntax noprefix
LEA R14, [R14 + 36] # instrumentation
MFENCE # instrumentation
.test_case_enter:
.function_main:
.bb_main.entry:
JMP .bb_main.0 
.bb_main.0:
AND RDX, 0b111111111111 # instrumentation
XOR word ptr [R14 + RDX], -37 
AND RCX, 0b111111111111 # instrumentation
CMOVL RBX, qword ptr [R14 + RCX] 
AND RDI, 0b111111111111 # instrumentation
CMOVNZ RBX, qword ptr [R14 + RDI] 
JZ .bb_main.1 
JMP .bb_main.2 
.bb_main.1:
AND RBX, 0b111111111111 # instrumentation
XOR DL, byte ptr [R14 + RBX] 
AND RDX, 0b111111111111 # instrumentation
LOCK XOR qword ptr [R14 + RDX], RBX 
AND RCX, 0b111111111111 # instrumentation
XOR dword ptr [R14 + RCX], 89 
JMP .bb_main.2 
.bb_main.2:
AND RDI, 0b111111111111 # instrumentation
XOR word ptr [R14 + RDI], AX 
AND RDX, 0b111111111111 # instrumentation
TEST word ptr [R14 + RDX], CX 
AND RDI, 0b111111111111 # instrumentation
CMOVNO EDX, dword ptr [R14 + RDI] 
JP .bb_main.3 
JMP .bb_main.exit 
.bb_main.3:
AND RSI, 0b111111111111 # instrumentation
OR dword ptr [R14 + RSI], -24 
AND RAX, 0b111111111111 # instrumentation
LOCK OR word ptr [R14 + RAX], -21 
JMP .bb_main.4 
.bb_main.4:
AND DL, -102 # instrumentation
AND RSI, 0b111111111111 # instrumentation
CMOVNS BX, word ptr [R14 + RSI] 
AND RDX, 0b111111111111 # instrumentation
AND DL, byte ptr [R14 + RDX] 
AND RDI, 0b111111111111 # instrumentation
AND byte ptr [R14 + RDI], 74 
AND RAX, 0b111111111111 # instrumentation
CMOVZ AX, word ptr [R14 + RAX] 
AND RDX, 0b111111111111 # instrumentation
LOCK AND word ptr [R14 + RDX], 33 
.bb_main.exit:
.test_case_exit:
MFENCE # instrumentation
LEA R14, [R14 - 36] # instrumentation
