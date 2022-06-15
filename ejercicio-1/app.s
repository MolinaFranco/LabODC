
.equ SCREEN_WIDTH, 		640
.equ SCREEN_HEIGH, 		480
.equ BITS_PER_PIXEL,  	32


.globl main
main:
	// X0 contiene la direccion base del framebuffer
 	mov x20, x0	// Save framebuffer base address to x20
	//---------------- CODE HERE ------------------------------------
	movz 	x10, 0xff, lsl 16
	movk 	x10, 0xffff, lsl 00
	mov x1, #0
	mov x2, #0
	mov x3, #640
	mov x4, #480
	bl doRectangulo

	mov x1, #100
	mov x2, #220
	mov x19, #1
	bl doDinoT
	
	mov x1, #400
	mov x2, #200
	bl doCactus


	//---------------------------------------------------------------
	// Infinite Loop

EndLopp:
	b EndLopp

