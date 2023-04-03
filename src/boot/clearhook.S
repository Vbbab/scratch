.globl _clear_hook
.globl _clear_hook_end
.globl _clear_hook_orig_backing


.align 4

_clear_hook:
mov x16, x30
mov x30, x5
mov x3, #0x800000000
movk x3, #0x1800, lsl#16
cmp x0, x3
b.hi _clear_hook_orig_backing
add x2, x1, x0
cmp x2, x3
b.lo _clear_hook_orig_backing
mov x3, #0x800000000
movk x3, #0x18e0, lsl#16
cmp x0, x3
b.hi _clear_hook_orig_backing
add x2, x1, x0
cmp x2, x3
b.lo _clear_hook_orig_backing
mov x1, #0

_clear_hook_orig_backing:
nop
nop // Yea nice nopslide we got here
br x16

_clear_hook_end: