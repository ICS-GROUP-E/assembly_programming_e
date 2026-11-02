# Macros and procedures — 32-bit programs

- **Execution date/time:** Saturday, 7 November 2026, 2:00 PM (Africa/Nairobi)

These NASM examples use 32-bit registers and Linux `int 0x80` system calls. They demonstrate print, arithmetic, conditional, repetition, and exit macros, plus procedures.

## Build

Run from this folder to assemble and link every program into `build32/`:

```bash
mkdir -p build32
for src in *.asm; do
    name=${src%.asm}
    nasm -f elf32 "$src" -o "build32/$name.o" &&
        ld -m elf_i386 -o "build32/$name" "build32/$name.o"
done
```
