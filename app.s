
.equ SCREEN_WIDTH, 		640
.equ SCREEN_HEIGH, 		480
.equ BITS_PER_PIXEL,  	32


.globl main
main:
	// X0 contiene la direccion base del framebuffer
 	mov x20, x0	// Save framebuffer base address to x20
	//---------------- CODE HERE ------------------------------------

	// CIELO
	movz x10, 0x80, lsl 16
	movk x10, 0xe6ff, lsl 00
	mov x1, #0			// x0
	mov x2, #0			// y0
	mov x3, #640		// ancho
	mov x4, #380		// alto
	bl doRectangulo

	// PISO
	movz x10, 0xde, lsl 16
	movk x10, 0xcd87, lsl 00
	mov x1, #0	
	mov x2, #380	
	mov x3, #640	
	mov x4, #100	
	bl doRectangulo

	// DINOSAURIO
	mov x1, #50		
	mov x2, #50
	mov x19, #1
	bl doDinoT
	mov x1, #150		
	mov x2, #50
	mov x19, #2
	bl doDinoT
	mov x1, #250		
	mov x2, #50
	mov x19, #3
	bl doDinoT
	mov x1, #350		
	mov x2, #50
	mov x19, #4
	bl doDinoT
	mov x1, #150		
	mov x2, #200
	mov x19, #5
	bl doDinoT





	movz x10, 0xff, lsl 16
	movk x10, 0x0000, lsl 00
	mov x1, #0	
	mov x2, #0
	mov x3, #25	
	mov x4, #25	
	bl doRectangulo


	//---------------------------------------------------------------
	// Infinite Loop

InfLoop:
	b InfLoop

// -----------------------------------------------------------------
// TODAS LAS FUNCIONES

