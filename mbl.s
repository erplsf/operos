.option norvc

.global _start

_start:
    csrw satp, zero /* TODO: explain later */
    la sp, _stack_top /* store address to top of our stack */
    /* clear BSS section */
    la t1, bss_start
    la t2, bss_end
bss_clear:
    sd zero, (t1)
    addi t1, t1, 8
    bgeu t1, t2, bss_clear
init_end:
    j init_end
    
