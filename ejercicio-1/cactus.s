.equ CACTUS_COLOR1, 0x00
.equ CACTUS_COLOR1, 0x8000


.globl doCactus
doCactus:
    // x1 -> x0
    // x2 -> y0
    // x10 -> Color

    sub 	sp,sp, #32    
	str 	x10, [sp, #24]   
	str 	x2, [sp, #16]   
	str 	x1, [sp, #8]   
	str 	x30, [sp, #0]   
	
    mov 	x8, x1
	mov 	x9, x2
	
    movz 	x10, CACTUS_COLOR1, lsl 16
	movk 	x10, CACTUS_COLOR1, lsl 00



	add 	x1, x8, #0
	add 	x2, x9, #36
	mov 	x3, #12
	mov 	x4, #36
	bl 		doRectangulo
	add 	x1, x8, #4
	add 	x2, x9, #32
	mov 	x3, #4
	mov 	x4, #4
	bl 		doRectangulo
	add 	x1, x8, #12
	add 	x2, x9, #68
	mov 	x3, #4
	mov 	x4, #4
	bl 		doRectangulo
	add 	x1, x8, #4
	add 	x2, x9, #72
	mov 	x3, #16
	mov 	x4, #4
	bl 		doRectangulo
	add 	x1, x8, #8
	add 	x2, x9, #76
	mov 	x3, #12
	mov 	x4, #4
	bl 		doRectangulo
	add 	x1, x8, #20
	add 	x2, x9, #4
	mov 	x3, #16
	mov 	x4, #104
	bl 		doRectangulo
	add 	x1, x8, #24
	add 	x2, x9, #0
	mov 	x3, #8
	mov 	x4, #4
	bl 		doRectangulo
    add 	x1, x8, #36
    add 	x2, x9, #68
	mov 	x3, #12
	mov 	x4, #8
	bl 		doRectangulo
	add 	x1, x8, #44
	add 	x2, x9, #28
	mov 	x3, #4
	mov 	x4, #40
	bl 		doRectangulo
	add 	x1, x8, #48
	add 	x2, x9, #24
	mov 	x3, #4
	mov 	x4, #48
	bl 		doRectangulo
    

	ldr 	x10, [sp, #24]   
	ldr 	x2, [sp, #16]   
	ldr 	x1,	[sp, #8]   
	ldr 	x30,[sp, #0] 
	add 	sp, sp, #32
	ret

