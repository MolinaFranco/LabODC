
.equ SCREEN_WIDTH, 		640
.equ SCREEN_HEIGH, 		480
.equ BITS_PER_PIXEL,  	32


.globl main
main:
	mov		x19, 1
	mov 	x25, 610 //posicion del cactus x0
	mov 	x26, 200 //posicion del dino y0
mainpostinit:

// dibujo fondo
	// X0 contiene la direccion base del framebuffer
 	mov 	x20, x0	// Save framebuffer base address to x20
	//---------------- CODE HERE ------------------------------------

	movz 	x10, 0x76, lsl 16
	movk 	x10, 0xadd0, lsl 00
	mov 	x1, #0
	mov 	x2, #0
	mov 	x3, SCREEN_WIDTH
	mov 	x4, SCREEN_HEIGH
	bl 		doRectangulo


	movz 	x10, 0xf3, lsl 16
	movk 	x10, 0xe2c6, lsl 00
	mov 	x1, #0
	mov 	x2, #330
	mov 	x3, #640
	mov 	x4, #150
	bl 		doGradiente
	

// cactus

	movz 	x10, 0x00, lsl 16
	movk 	x10, 0xbb2d, lsl 00
	
	sub 	x25, x25, 5	//muevo el cuadrado proximamente cactus -velocity-
	cmp		x25, xzr 
	b.le	resetcactus

	mov 	x1, x25
	mov 	x2, #200
	mov 	x3, 30
	mov 	x4, 100
	bl 		doRectangulo


// movimiento dino
	
	cmp		x25, 200
	b.lt	bajardino
	cmp		x25, 300
	b.lt	subirdino

endydino:
	

// dibujar dino

	mov 	x1, #200
	mov 	x2, x26
	add 	x19, x19, 1
	cmp 	x19, #4
	b.eq 	resetdino

	bl doDinoT


	movz 	x10, 0xff, lsl 16
	movk 	x10, 0x0000, lsl 00
	mov 	x1, #0
	mov 	x2, #0
	mov 	x3, 50
	mov 	x4, 50
	bl 		doRectangulo

	//---------------------------------------------------------------
	// Infinite Loop

	mov 	x28, 1
	lsl 	x28,x28,22	//velocity
	b 		delay

	//b		main

EndLopp:
	b EndLopp

resetdino:
	mov		x19, 1
	ret

delay:
	add 	xzr,xzr,xzr
	subs 	x28, x28, 1
	cbnz 	x28, delay
	b 		mainpostinit

subirdino:
	sub		x26, x26, 5
	b		endydino

bajardino:
	cmp		x26, 200
	b.lt	bajardinoreal
	b		endydino

bajardinoreal:
	add		x26, x26, 5
	b		endydino

resetcactus:
	mov x25, 610
	ret
