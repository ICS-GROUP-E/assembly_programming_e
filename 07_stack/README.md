# Stack examples — 32-bit programs

- **Tested:** Monday, 9 November 2026 (Africa/Nairobi)

These examples demonstrate stack operations, function calls, and stack-frame local
variables using 32-bit registers and Linux `int 0x80` exit calls. Each source file
has its own README with a step-by-step stack trace from `_start` to exit.

| Source | README | Topic |
|--------|--------|-------|
| [`01.asm`](01.asm) | [`01.README.md`](01.README.md) | Two pushes and two pops; LIFO basics |
| [`02.asm`](02.asm) | [`02.README.md`](02.README.md) | `call`/`ret` plus a stack frame with two locals |
| [`03.asm`](03.asm) | [`03.README.md`](03.README.md) | `call`/`ret` with no frame; value returned in EAX |
| [`04.asm`](04.asm) | [`04.README.md`](04.README.md) | Stack frame for two locals (same flow as 02) |
| [`05.asm`](05.asm) | [`05.README.md`](05.README.md) | Push/pop round trip and pop order |
| [`06.asm`](06.asm) | [`06.README.md`](06.README.md) | Push/pop round trip (same code as 05) |

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

## Run and inspect

```bash
for prg in build32/0?; do ./"$prg"; echo "$prg -> $?"; done
```

All six programs are silent and request `exit(0)`. In the sandbox used for testing,
the shell reported status **159** because its seccomp filter kills the 32-bit
`int 0x80` exit syscall with `SIGSYS`; `strace` confirmed the programs asked for
`exit(0)`. This does not affect the stack behaviour before the exit.

To watch the stack directly, run a program under GDB and break at the labels or at
instruction addresses from `objdump -d -Mintel build32/<name>`, for example:

```bash
gdb -q build32/01
(gdb) break _start
(gdb) run
(gdb) info registers esp ebp
(gdb) x/8wx $esp
(gdb) stepi            # repeat to walk through pushes/pops
```

The absolute addresses in the READMEs (`0xffffc410` for the initial `ESP`) were
observed in these runs and can differ between machines or when ASLR/environment
changes; the changes in `ESP` and the stack contents are the stable results.
