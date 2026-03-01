set breakpoint pending on
set debuginfod enabled off
set disassembly-flavor intel
tui new-layout asm-debug {-horizontal src 1 regs 1} 2 status 0 cmd 1
#layout asm-debug
#b _start
add-auto-load-safe-path /usr/lib/go/src/runtime/runtime-gdb.py
source /home/alex/.gdbinit-gef.py
