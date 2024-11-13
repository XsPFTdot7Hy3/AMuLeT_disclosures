# UV3 - Speculative Store Not Cleaned Bug

**Scenario** - Execute a load-store micro-instruction

<img src="UV3/UV3-1.png" alt="ldst-trace" style="max-width:50%; height:auto;">
<!-- <br><br> -->

- [From gem5 documentation](https://www.gem5.org/documentation/general_docs/architecture_support/x86_microop_isa/#ldst):

<img src="UV3/UV3-2.png" alt="ldst-docs" style="max-width:50%; height:auto;">
<br><br>

- CleanupSpec Requires Information of L1/L2 Hit/Miss on Loads to Issue Cleanups

<img src="UV3/UV3-3.png" alt="cleanup_on_miss-gem5" style="max-width:50%; height:auto;">
<br><br>

- Ldst (Read as part of Read-Modify-Write) has a writeCallback() where the L2-Miss flags are not set

<img src="UV3/UV3-4.png" alt="writeCallback-trace" style="max-width:50%; height:auto;">
<br><br>

- CleanupSpec only updates status flags on readCallback()
- **BUT**: Ldst reads via a writeCallback()!

<img src="UV3/UV3-5.png" alt="readCallback-gem5" style="max-width:50%; height:auto;">
<br><br>


# UV4 - Split Requests Not Cleaned Bug

**Scenario** - An 8-byte memory request, or any memory request that crosses a cache-line boundary:

<img src="UV4/UV4-1.png" alt="splitreq-disasm" style="max-width:50%; height:auto;">
<!-- <br><br> -->

- For example: 0x401154 is a Spec. Store, **split** into 2 requests to adjacent cache lines

<img src="UV4/UV4-2.png" alt="splitreq-pktTrace" style="max-width:50%; height:auto;">
<br><br>

- **BUT**: Cleanup not implemented for split requests!

<img src="UV4/UV4-3.png" alt="splitreq-cleanup-gem5" style="max-width:50%; height:auto;">
<br><br>

Since these need to be cleaned up, but aren’t ==> Violation!

# UV5 - Too Much Cleaning Vulnerability

**Scenario** - A speculative request is made to address X. Then a **non**-speculative load request is made to the same address X.
- For our example, let X be 0x174c, with block address 0x1740
(Ignore the is* flags, they are legacy code unimplemented in our CleanupSpec testing)

<img src="UV5/UV5-1.png" alt="spec_nonspec-trace" style="max-width:50%; height:auto;">
<br><br>

Issue: The second, valid memory request will be cleaned up alongside the first request.
- CleanupSpec does not account for the valid memory request to 0x1740
- But the second request is non-speculative! ==> Violation!

