.intel_syntax noprefix
LEA R14, [R14 + 56] # instrumentation
MFENCE # instrumentation
.test_case_enter:
.function_main:
.bb_main.entry:
.bb_main.0:
AND RSI, 0b1111111111111 # instrumentation
LOCK OR word ptr [R14 + RSI], DX 
AND RCX, 0b1111111111111 # instrumentation
OR byte ptr [R14 + RCX], AL 
JNS .bb_main.1 
JMP .bb_main.4 
.bb_main.1:
AND RSI, 0b1111111111111 # instrumentation
AND RBX, 0b1111111111111 # instrumentation
AND RCX, 0b1111111111111 # instrumentation
LOCK XOR qword ptr [R14 + RCX], -90 
AND RCX, 0b1111111111111 # instrumentation
.bb_main.2:
AND RAX, 0b1111111111111 # instrumentation
AND RCX, 0b1111111111111 # instrumentation
AND RAX, 0b1111111111111 # instrumentation
OR dword ptr [R14 + RAX], 0b1000000000000000000000000000000 # instrumentation
AND RAX, 0b1111111111111 # instrumentation
AND RCX, 0b1111111111111 # instrumentation
JMP .bb_main.3 
.bb_main.3:
AND BL, -107 # instrumentation
AND RBX, 0b1111111111111 # instrumentation
CMOVNB RSI, qword ptr [R14 + RBX] 
AND RSI, 0b1111111111111 # instrumentation
JMP .bb_main.exit 
.bb_main.4:
AND RDX, 0b1111111111111 # instrumentation
AND byte ptr [R14 + RDX], 62 
AND RDI, 0b1111111111111 # instrumentation
NOT dword ptr [R14 + RDI] 
AND RSI, 0b1111111111111 # instrumentation
.bb_main.exit:
.test_case_exit:
MFENCE # instrumentation
LEA R14, [R14 - 56] # instrumentation
