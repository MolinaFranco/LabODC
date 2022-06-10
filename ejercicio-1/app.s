
.equ SCREEN_WIDTH, 		640
.equ SCREEN_HEIGH, 		480
.equ BITS_PER_PIXEL,  	32


.globl main
main:
	// X0 contiene la direccion base del framebuffer
 	mov x20, x0	// Save framebuffer base address to x20
	//---------------- CODE HERE ------------------------------------
	movz 	x10, 0x00, lsl 16
	movk 	x10, 0x0000, lsl 00
	mov x1, #0
	mov x2, #0
	mov x3, SCREEN_WIDTH
	mov x4, SCREEN_HEIGH
	bl doRectangulo


	mov x1, #0
	mov x2, #0
	mov x19, #1
	bl doDinoT

	//---------------------------------------------------------------
	// Infinite Loop

EndLopp:
	b EndLopp

