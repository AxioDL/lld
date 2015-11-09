// REQUIRES: x86
// RUN: llvm-mc -filetype=obj -triple=x86_64-pc-linux %s -o %t.o
// RUN: not ld.lld2 %t.o -o %t.so -shared 2>&1 | FileCheck %s

        .section	.rodata.str1.1,"aMS",@progbits,1
	.asciz	"abc"

        .text
        .long .rodata.str1.1 + 4

// CHECK: Entry is past the end of the section