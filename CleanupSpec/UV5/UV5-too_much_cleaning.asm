.intel_syntax noprefix
LEA R14, [R14 + 12] # instrumentation
MFENCE # instrumentation
.test_case_enter:
.function_main:
.bb_main.entry:
JMP .bb_main.0 
.bb_main.0:
AND CL, -64 # instrumentation
AND RDX, 0b111111111111 # instrumentation
CMOVS RDI, qword ptr [R14 + RDX] 
AND RDX, 0b111111111111 # instrumentation
XOR qword ptr [R14 + RDX], RSI 
AND RDX, 0b111111111111 # instrumentation
LOCK XOR byte ptr [R14 + RDX], -16 
JNBE .bb_main.1 
JMP .bb_main.2 
.bb_main.1:
AND RSI, 0b111111111111 # instrumentation
XOR BL, byte ptr [R14 + RSI] 
AND RBX, 0b111111111111 # instrumentation
CMOVB DX, word ptr [R14 + RBX] 
JB .bb_main.2 
JMP .bb_main.exit 
.bb_main.2:
AND RAX, 0b111111111111 # instrumentation
TEST byte ptr [R14 + RAX], BL 
AND RBX, 0b111111111111 # instrumentation
XOR byte ptr [R14 + RBX], DL 
JMP .bb_main.3 
.bb_main.3:
AND DL, 51 # instrumentation
AND RDI, 0b111111111111 # instrumentation
NOT byte ptr [R14 + RDI] 
AND RCX, 0b111111111111 # instrumentation
CMOVNS RAX, qword ptr [R14 + RCX] 
JMP .bb_main.4 
.bb_main.4:
AND DL, 51 # instrumentation
AND RDX, 0b111111111111 # instrumentation
CMOVNO RCX, qword ptr [R14 + RDX] 
AND RSI, 0b111111111111 # instrumentation
LOCK XOR byte ptr [R14 + RSI], -112 
AND RBX, 0b111111111111 # instrumentation
AND dword ptr [R14 + RBX], ECX 
AND RSI, 0b111111111111 # instrumentation
OR dword ptr [R14 + RSI], 35 
AND RDX, 0b111111111111 # instrumentation
LOCK AND byte ptr [R14 + RDX], CL 
AND RBX, 0b111111111111 # instrumentation
LOCK NOT dword ptr [R14 + RBX] 
AND RSI, 0b111111111111 # instrumentation
CMOVNL RSI, qword ptr [R14 + RSI] 
.bb_main.exit:
.test_case_exit:
MFENCE # instrumentation
LEA R14, [R14 - 12] # instrumentation
