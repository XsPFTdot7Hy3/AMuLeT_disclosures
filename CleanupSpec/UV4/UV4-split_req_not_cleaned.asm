.intel_syntax noprefix
LEA R14, [R14 + 60] # instrumentation
MFENCE # instrumentation
.test_case_enter:
.function_main:
.bb_main.entry:
JMP .bb_main.0 
.bb_main.0:
AND RAX, 0b111111111111 # instrumentation
LOCK XOR qword ptr [R14 + RAX], RDI 
AND RAX, 0b111111111111 # instrumentation
TEST qword ptr [R14 + RAX], RSI 
AND RDI, 0b111111111111 # instrumentation
OR qword ptr [R14 + RDI], RSI 
AND RAX, 0b111111111111 # instrumentation
TEST word ptr [R14 + RAX], BX 
AND RDX, 0b111111111111 # instrumentation
OR dword ptr [R14 + RDX], 0b1000000000000000000000000000000 # instrumentation
BSR EDI, dword ptr [R14 + RDX] 
JMP .bb_main.1 
.bb_main.1:
AND AL, 38 # instrumentation
AND RDX, 0b111111111111 # instrumentation
CMOVBE EBX, dword ptr [R14 + RDX] 
JBE .bb_main.2 
JMP .bb_main.3 
.bb_main.2:
AND RCX, 0b111111111111 # instrumentation
AND qword ptr [R14 + RCX], RDX 
JMP .bb_main.3 
.bb_main.3:
AND RDI, 0b111111111111 # instrumentation
LOCK OR dword ptr [R14 + RDI], 16 
AND RAX, 0b111111111111 # instrumentation
XOR ESI, dword ptr [R14 + RAX] 
AND RDI, 0b111111111111 # instrumentation
TEST byte ptr [R14 + RDI], DL 
AND RDI, 0b111111111111 # instrumentation
CMOVNZ EDI, dword ptr [R14 + RDI] 
AND RSI, 0b111111111111 # instrumentation
CMOVL RAX, qword ptr [R14 + RSI] 
AND RDI, 0b111111111111 # instrumentation
LOCK AND word ptr [R14 + RDI], DI 
AND RDI, 0b111111111111 # instrumentation
TEST word ptr [R14 + RDI], AX 
JMP .bb_main.4 
.bb_main.4:
AND RAX, 0b111111111111 # instrumentation
AND SIL, byte ptr [R14 + RAX] 
AND RAX, 0b111111111111 # instrumentation
XOR word ptr [R14 + RAX], CX 
.bb_main.exit:
.test_case_exit:
MFENCE # instrumentation
LEA R14, [R14 - 60] # instrumentation
