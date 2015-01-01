r2-ropstats
===========

A set of tools based on radare2 for analysis of ROP gadgets and payloads.

## Requirements

Python 2.7

[radare2](https://github.com/radare/radare2) + [python bindings](https://github.com/radare/radare2-bindings)

## Overview

`gadget-stats [--gadget-file file] file` - Analyzes the provided binary and searches its executable sections for ROP gadgets, then computes statistics about the gadgets and the ratio of implicit/explicit ones. If the optional argument `--gadget-file` is supplied then that file is used as source of gadgets, the expected format is that of `ROPgadget`'s output.

## Example usage

First example counts the statistics of the `libc`.

```
c0da206026cffea80b6effe2be03a68e573eb1b090a72dfdeaa4f6a958a929e9  /lib64/libc-2.18.so
```

```bash
./gadget-stats /lib64/libc-2.18.so

[-] Opening file:       "/lib64/libc-2.18.so"
   ✓ Analyzing ...
   ➙ ----------------------------------------------------------------------
   ➙ Entrypoint:        0x3c1e621e70
   ➙ Gadgets:           21749
   ➙ ----------------------------------------------------------------------
   ➙ Implicit:          11608
   ➙ Explicit:          3903
   ➙ Total:             15511
   » Ratio:             2.97:1
```

In second example the binary is first sifted through with `ROPgadget` piping the output to the file `libc-gadgets`. Using the `--gadget-file` switch we then inspect the gadgets in the file. 

```bash
python ROPgadget.py --binary /lib64/libc-2.18.so > libc-gadgets
./gadget-stats --gadget-file libc-gadgets /lib64/libc-2.18.so
```
