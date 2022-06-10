.equ SCREEN_WIDTH, 		640
.equ SCREEN_HEIGH, 		480
.equ BITS_PER_PIXEL,  	32


.globl doRectangulo
doRectangulo:  
// x1 -> x0
// x2 -> y0
// x3 -> ancho
// x4 -> alto
// x10 -> color

// MODIFICA X3 PARA QUE NO SE PASE
// MODIFICA X3 PARA QUE NO SE PASE
// MODIFICA X3 PARA QUE NO SE PASE
// MODIFICA X3 PARA QUE NO SE PASE
// MODIFICA X3 PARA QUE NO SE PASE
// MODIFICA X3 PARA QUE NO SE PASE


drawRow: 
	mov x5, #SCREEN_WIDTH
	mul x5, x2, x5
	add x5, x5, x1
	lsl x5, x5, #2
	add x5, x5, x20				// x5 += x20
	mov x6, x3

drawCol:
	stur w10, [x5]				// xn -> Registro de 64bits, wn-> Registro de 32bits
	add x5, x5, #4	
	sub x6, x6, #1
	cbnz x6, drawCol
	add x2, x2, #1
	sub x4, x4, #1
	cbnz x4, drawRow
	
	ret

// Example function call
//		x10 	-> color
// 		mov 	x1, #0
// 		mov 	x2, #0
// 		mov 	x3, #50	
// 		mov 	x4, #50
// 		bl 		doRectangulo
