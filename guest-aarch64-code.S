_start:
	mov	x8, #0x04
	mov	x9, #0x06
	mov	x10, #0x100000
	add	x11, x8, x9
	str	x11,[x10]
	dsb	nsh
_loop:
	wfi
	b	loop
