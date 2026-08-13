# assembly-why-not

A hands-on learning repository for x86 and x86-64 assembly on Linux.

This repository is my assembly journey: practical examples, notes, and small projects that demonstrate assembly programming on Linux for both 32-bit (x86) and 64-bit (x86-64) environments. The goal is to learn how programs are built at the instruction level, how calling conventions work, how the system interface is used, and how to debug and optimize low-level code.

Table of contents
- About
- Goals
- Prerequisites
- Tooling
- Build & run examples
  - x86 (32-bit)
  - x86-64 (64-bit)
- Project structure
- Contributing
- Resources
- License

About

This repo collects small, focused examples and notes to help me (and others) learn assembly programming on Linux. Examples range from "hello world" and syscalls to function calls, stack frames, string processing, and simple algorithms implemented in assembly.

Goals
- Learn the basics of x86 and x86-64 instruction sets.
- Understand calling conventions (cdecl, System V AMD64).
- Practice assembling, linking, and debugging assembly programs on Linux.
- Explore interactions between C and assembly (inline assembly, linking object files).
- Build small projects that demonstrate optimization and low-level programming techniques.

Prerequisites
- A Linux distribution (Ubuntu, Fedora, Arch, etc.).
- Basic familiarity with C and the command line.
- Tools: nasm or yasm (assembler), gcc (linker), ld (linker), gdb (debugger), strace (optional).

Tooling
- nasm — popular assembler: sudo apt install nasm
- yasm — alternative assembler: sudo apt install yasm
- gcc / binutils — for linking and creating executables: sudo apt install build-essential
- gdb / gdb-multiarch — debugger for stepping through assembly: sudo apt install gdb
- objdump / readelf — for inspecting binaries and object files: sudo apt install binutils

Build & run examples

x86 (32-bit) example using nasm + gcc:

1. Write assembly in NASM syntax, e.g. examples/x86/hello.asm
2. Assemble to object file (32-bit):

   nasm -f elf32 -o hello.o hello.asm

3. Link with gcc (or ld) to produce an executable:

   gcc -m32 -nostartfiles -o hello hello.o

4. Run:

   ./hello

Notes:
- The -m32 flag tells gcc to produce a 32-bit binary. You may need multilib packages installed on your system.
- For direct syscall usage in 32-bit, use int 0x80 or the appropriate syscall instruction depending on the ABI.

x86-64 (64-bit) example using nasm + gcc (System V AMD64):

1. Write assembly in NASM syntax, e.g. examples/x86_64/hello.asm
2. Assemble to object file (64-bit):

   nasm -f elf64 -o hello.o hello.asm

3. Link with gcc:

   gcc -nostartfiles -no-pie -o hello hello.o

4. Run:

   ./hello

Notes:
- On x86-64, the System V AMD64 calling convention is used on most Linux distributions (first integer/pointer args in RDI, RSI, RDX, RCX, R8, R9; return value in RAX).
- Use -no-pie if you want a traditional non-PIE binary for easier addresses in examples.

Debugging
- Use gdb to inspect registers, step instructions, and examine memory:

   gdb ./hello

- Use objdump -d hello.o or objdump -d hello to disassemble and inspect the generated code.

Project structure (suggested)

- README.md — this file
- examples/
  - x86/ — 32-bit examples
  - x86_64/ — 64-bit examples
  - notes/ — short writeups and explanations
- scripts/ — helper scripts to build or run examples
- experiments/ — longer experiments or small projects

Contributing
- This repository is primarily for my personal learning, but contributions or suggestions are welcome.
- If you add an example, please include:
  - A short description of what it demonstrates.
  - Build and run instructions (commands used to assemble and link).
  - Any special notes about platform or dependencies.

Resources
- Intel/AMD manuals for instruction set reference
- "Programming from the Ground Up" — beginner-friendly assembly book (Linux/x86-centric)
- Linux man pages (syscall, asm)
- NASM documentation: https://www.nasm.us/
- GNU Binutils documentation and objdump/readelf

License
MIT — see LICENSE file for details.

----

Happy hacking! If you'd like, I can also:
- Populate the repository with a few starter examples (hello world, simple syscall, function call),
- Add build scripts and a small CONTRIBUTING.md, or
- Create a quick cheatsheet for common instructions and calling convention notes.

Tell me which of the above you'd like next and I'll add it directly to the repo.