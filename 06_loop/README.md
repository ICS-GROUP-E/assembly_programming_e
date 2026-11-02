# Loops — 32-bit programs

- **Execution date/time:** Saturday, 7 November 2026, 2:00 PM (Africa/Nairobi)

These examples use NASM's ELF32 format and Linux `int 0x80` system calls.

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

## Programs

| Program | Intended behavior |
| --- | --- |
| `01_loop_instruction.asm` | Prints `Hello, Assembly!` five times with `loop`, preserving `ECX` while setting up `write`. |
| `02_dec_jnz.asm` | Prints `Hello, Assembly!` five times with `dec` and `jnz`. |
| `03_cmp_jl.asm` | Prints the numbers 1 through 5 with `cmp` and `jl`. |
| `04_while_loop.asm` | Prints the numbers 1 through 5. |
| `05_do_while.asm` | Prints the numbers 1 through 5 with a do-while style loop. |
| `06_push_pop.asm` | Prints two asterisks on each of three lines, using the stack to save nested loop counters. |
| `07_sum_loop.asm` | Prints `Sum = 15`. |
| `08_infinite_loop.asm` | Prints `Running...` continuously. |
| `09_loop_syscall.asm` | Prints `Hello, Assembly!` five times, saving and restoring `ECX` around the write syscall. |

The finite programs can be run from this folder as `./build32/<program-name>`; the infinite loop should be stopped manually.
