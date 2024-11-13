.intel_syntax noprefix
LEA R14, [R14 + 12] # instrumentation
MFENCE # instrumentation
.test_case_enter:
.function_main:
.bb_main.entry:
.bb_main.0:
AND RBX, 0b1111111111111 # instrumentation
.bb_main.1:
AND RSI, 0b1111111111111 # instrumentation
AND RBX, 0b1111111111111 # instrumentation
AND RBX, 0b1111111111111 # instrumentation
AND RDX, 0b1111111111111 # instrumentation
AND RBX, 0b1111111111111 # instrumentation
AND RCX, 0b1111111111111 # instrumentation
AND RAX, 0b1111111111111 # instrumentation
.bb_main.2:
AND RCX, 0b1111111111111 # instrumentation
AND RCX, 0b1111111111111 # instrumentation
AND RCX, 0b1111111111111 # instrumentation
AND RCX, 0b1111111111111 # instrumentation
JRCXZ .bb_main.3 
JMP .bb_main.exit 
.bb_main.3:
AND RBX, 0b1111111111111 # instrumentation
AND RDI, 0b1111111111111 # instrumentation
AND qword ptr [R14 + RDI], RCX 
.bb_main.4:
AND CL, -37 # instrumentation
AND RDI, 0b1111111111111 # instrumentation
AND RSI, 0b1111111111111 # instrumentation
.bb_main.exit:
.test_case_exit:
MFENCE # instrumentation
LEA R14, [R14 - 12] # instrumentation
