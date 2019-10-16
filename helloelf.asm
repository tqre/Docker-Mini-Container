; Constructing an ELF header and a 'Hello, World!' in assembly for Linux x86_64
; (C) Tuomo Kuure 2019
; Original ELF header 32-bit code was written by Brian Raiter:
; http://www.muppetlabs.com/~breadbox/software/tiny/teensy.html
;
; Compile with nasm: 
; nasm -f bin -o helloelf helloelf.nasm

BITS 64
org	0x400000					; executable entry point

ehdr:							; elf64_hdr
		db	0x7F, "ELF", 2, 1, 1, 0		; ELF magic number
	times 8 db	0
		dw	2				; e_type
		dw	0x3E				; e_machine
		dd	1				; e_version
		dq	_start				; e_entry
		dq	phdr - $$			; e_phoff
		dq	0				; e_shoff
		dd	0				; e_flags
		dw 	ehdrsize			; e_ehsize
		dw	phdrsize			; e_phentsize
		dw	1				; e_phnum
		dw	0				; e_shentsize
		dw	0				; e_shnum
		dw	0				; e_shstrndx

ehdrsize	equ	$ - ehdr

phdr:							; elf64_phdr
		dd	1				; p_type
		dd	1				; p_flags
		dq 	0				; p_offset
		dq	$$				; p_vaddr
		dq	$$				; p_paddr
		dq	filesize			; p_filesz
		dq	filesize			; p_memsz
		dq	0x1000				; p_align

phdrsize	equ	$ - phdr

_start:

	mov	rdx,len
	mov	rsi,msg
	mov 	rdi,1					; file desc (stdout)
	mov	rax,1					; sys_write
	syscall

	mov	rax,60					; sys_exit
	mov	rdi,0					; exit value
	syscall


msg		db	'Hello, World!', 0xa
len		equ	$ - msg
filesize	equ	$ - $$
