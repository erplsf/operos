OUTPUT_ARCH(riscv)
MEMORY {
  RAM (rwx) : ORIGIN = 0x80000000, LENGTH = 128M
}
ENTRY(_start)
SECTIONS {
  .text : ALIGN(4K) {
    *(.text);
  }
  .bss : ALIGN(4K) {
    PROVIDE(bss_start = .);
    *(.bss);
    . += 4096;
    PROVIDE(_stack_top = .);
    PROVIDE(bss_end = .);
  }
}
