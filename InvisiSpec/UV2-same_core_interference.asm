.intel_syntax noprefix
LEA R14, [R14 + 4] # instrumentation
MFENCE # instrumentation
.test_case_enter:
.function_main:
.bb_main.entry:
JMP .bb_main.0 
.bb_main.0:
AND DL, 77 # instrumentation
AND RSI, 0b111111111111 # instrumentation
CMOVL CX, word ptr [R14 + RSI] 
AND RDX, 0b111111111111 # instrumentation
LOCK OR byte ptr [R14 + RDX], CL 
LOOP .bb_main.1 
JMP .bb_main.3 
.bb_main.1:
AND BL, -37 # instrumentation
AND RCX, 0b111111111111 # instrumentation
CMOVL CX, word ptr [R14 + RCX] 
JNP .bb_main.2 
JMP .bb_main.exit 
.bb_main.2:
AND DL, 125 # instrumentation
AND RDI, 0b111111111111 # instrumentation
CMOVB SI, word ptr [R14 + RDI] 
AND RCX, 0b111111111111 # instrumentation
LOCK XOR byte ptr [R14 + RCX], -18 
AND RCX, 0b111111111111 # instrumentation
AND byte ptr [R14 + RCX], BL 
AND RDX, 0b111111111111 # instrumentation
CMOVNZ DI, word ptr [R14 + RDX] 
AND RAX, 0b111111111111 # instrumentation
OR dword ptr [R14 + RAX], 0b1000000000000000000000000000000 # instrumentation
BSR ECX, dword ptr [R14 + RAX] 
JMP .bb_main.3 
.bb_main.3:
AND RDX, 0b111111111111 # instrumentation
XOR RSI, qword ptr [R14 + RDX] 
AND RBX, 0b111111111111 # instrumentation
LOCK AND word ptr [R14 + RBX], SI 
AND RSI, 0b111111111111 # instrumentation
CMOVNS RAX, qword ptr [R14 + RSI] 
AND RAX, 0b111111111111 # instrumentation
LOCK XOR byte ptr [R14 + RAX], BL 
AND RBX, 0b111111111111 # instrumentation
OR word ptr [R14 + RBX], BX 
JMP .bb_main.4 
.bb_main.4:
AND CL, 61 # instrumentation
AND RCX, 0b111111111111 # instrumentation
CMOVNS EDI, dword ptr [R14 + RCX] 
AND RSI, 0b111111111111 # instrumentation
TEST dword ptr [R14 + RSI], ESI 
AND RDX, 0b111111111111 # instrumentation
LOCK XOR byte ptr [R14 + RDX], -24 
.bb_main.exit:
# linux kernel does lfence; rdtsc on real CPUs for perf reasons
# clobbers rax, rcx, rdx (also rbx iff CPUID)

MFENCE # Serializing call; Use CPUID if more delay needed
RDTSC # Returns the time in EDX:EAX
MOV EDI, EDX
MOV ECX, EAX # start_time in EDI:ECX

# All prev. loads/stores should have finished
MOV R11, qword ptr [R14 + RSI] # Target load, load HIT

MFENCE # To serialize stores
RDTSCP # All prev. insts exe, all prev loads visible

SUB EAX, ECX # final time - initial time
SBB EDX, EDI # subtract with borrow
SHL RDX, 32
OR RDX, RAX
MOV R10, RDX # Time taken held in R10

.test_case_exit:
MFENCE # instrumentation
LEA R14, [R14 - 4] # instrumentation
