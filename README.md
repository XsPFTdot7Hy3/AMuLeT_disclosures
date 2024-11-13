This repository contains disclosures and/or proof of findings for the security vulnerabilties found by AMuLeT.

Please take a look at the respective `$DEFENSE/$DEFENSE_disclosure.md` for an explanation of the leakages found

In particular, we disclose test kernels that will cause novel leakage on InvisiSpec, CleanupSpec, and SpecLFB.
We also disclose a test kernel that will cause known leakage on STT.

## Violation Analysis Example

Here we will go over an example of a violation which AMuLeT found
on the Baseline Out-of-Order CPU in gem5 to demonstrate how we analyse violations.

AMuLeT outputs the program (`Baseline/program.asm`) and the two inputs that caused the violation
and their differing μtraces.

First, we run Revizor's minimizer on the
outputted program to reduce its complexity as much as possible while still preserving the violation (see `Baseline/program_minimized.asm`).

Next, we run our analysis script on the violation, which runs the inputs through gem5 again with extra debug flags to obtain
more detailed information about the program's execution. This script automatically parses the debug log and produces
a detailed comparison of the execution of the two inputs (called the “Reference” and “Primer” inputs):

![A side-by-side view of the key events during the execution of the two inputs. Notably a JRCXZ branch is
mispredicted, which causes a load to be squashed whose address is different between the two test cases.](Baseline/analysis_output.png)

This output indicates that this violation is an instance of Spectre v1:
the load at tick 170433500 of `r14+rdi` was later squashed at tick 170434000
due to the branch `jrcxz  0x4021d6` being mispredicted,
so information about the value of `rdi` was leaked through the cache during speculative execution.
