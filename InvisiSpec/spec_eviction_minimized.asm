.intel_syntax noprefix
LEA R14, [R14 + 44] # instrumentation
MFENCE # instrumentation
.test_case_enter:
.function_main:
.bb_main.entry:
.bb_main.0:
AND RBX, 0b1111111111111 # instrumentation
AND RCX, 0b1111111111111 # instrumentation
AND RCX, 0b1111111111111 # instrumentation
LOCK XOR qword ptr [R14 + RCX], RAX 
.bb_main.1:
AND RDX, 0b1111111111111 # instrumentation
AND RAX, 0b1111111111111 # instrumentation
AND RDX, 0b1111111111111 # instrumentation
.bb_main.2:
AND DL, -40 # instrumentation
AND RDX, 0b1111111111111 # instrumentation
CMOVNBE CX, word ptr [R14 + RDX] 
AND RCX, 0b1111111111111 # instrumentation
AND RCX, 0b1111111111111 # instrumentation
CMOVS RCX, qword ptr [R14 + RCX] 
AND RCX, 0b1111111111111 # instrumentation
JP .bb_main.3 
JMP .bb_main.exit 
.bb_main.3:
AND RDI, 0b1111111111111 # instrumentation
NOT dword ptr [R14 + RDI] 
AND RAX, 0b1111111111111 # instrumentation
AND RAX, 0b1111111111111 # instrumentation
AND RSI, 0b1111111111111 # instrumentation
AND RDI, 0b1111111111111 # instrumentation
.bb_main.4:
AND BL, -37 # instrumentation
AND RDX, 0b1111111111111 # instrumentation
.bb_main.exit:
.test_case_exit:
MFENCE # instrumentation
LEA R14, [R14 - 44] # instrumentation
