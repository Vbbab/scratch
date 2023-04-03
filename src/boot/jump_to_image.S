.align 2
.global _jump_to_image
_jump_to_image:
    mov x30, x30
    mov x0, x1
    isb
    dsb sy
    ic iallu
    dsb sy
    isb
    mov x1, xzr
    mov x2, xzr
    mov x3, xzr
    ret

.global _jump_to_image_extended
_jump_to_image_extended:
    mov x30, x0
    mov x0, x1
    mov x8, x2
    isb
    dsb sy
    ic iallu
    dsb sy
    isb
    mov x1, xzr
    mov x2, xzr
    mov x3, xzr
    ret

.global _tramp_hook
_tramp_hook:
    mov x8, x27
    mov x9, x29
    mov x27, #0x800000000
    movk x27, #0x1800, lsl#16
    add x29, x27, #0x4