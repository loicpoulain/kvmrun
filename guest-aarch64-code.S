b start

msg_hello_world: .asciz "Hello World, from guest!\r\n"

/* print_string - x0 is the string address, x1 is the console fifo address */
.align 4
print_string:
	ldrb	w8, [x0], #1
	cbz	w8, p1
	str     w8, [x1]
	dsb	nsh
	b	print_string
p1:	ret

/* Let's go ! */
.align 4
start:
	mov	x0, msg_hello_world
	mov	x1, #0x01000000
	bl print_string
s1:	wfi
	b	s1
