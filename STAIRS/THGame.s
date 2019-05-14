	.cpu arm7tdmi
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"THGame.c"
	.text
	.align	2
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateSelect.part.1, %function
updateSelect.part.1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L42
	ldrh	r2, [r4]
	tst	r2, #512
	beq	.L2
	ldr	r3, .L42+4
	ldrh	r3, [r3]
	tst	r3, #512
	beq	.L36
.L2:
	tst	r2, #64
	beq	.L3
	ldr	r3, .L42+4
	ldrh	r3, [r3]
	ands	r5, r3, #64
	beq	.L37
.L3:
	tst	r2, #128
	beq	.L4
	ldr	r3, .L42+4
	ldrh	r3, [r3]
	ands	r5, r3, #128
	beq	.L38
.L4:
	tst	r2, #32
	beq	.L5
	ldr	r3, .L42+4
	ldrh	r3, [r3]
	ands	r5, r3, #32
	beq	.L39
.L5:
	tst	r2, #16
	beq	.L6
	ldr	r3, .L42+4
	ldrh	r3, [r3]
	ands	r5, r3, #16
	beq	.L40
.L6:
	tst	r2, #1
	beq	.L1
	ldr	r3, .L42+4
	ldrh	r3, [r3]
	ands	r4, r3, #1
	bne	.L1
	ldr	r2, .L42+8
	ldr	r3, .L42+12
	ldr	r2, [r2, #56]
	add	r3, r3, r2, lsl #6
	ldr	r1, [r3, #52]
	cmp	r1, #0
	beq	.L1
	ldr	r5, .L42+16
	ldr	r1, .L42+20
	ldr	r0, [r1, #56]
	ldr	r1, [r5]
	cmp	r2, r0
	sub	r2, r1, #1
	str	r4, [r3, #52]
	str	r2, [r5]
	beq	.L41
	ldr	r6, .L42+24
	mov	lr, pc
	bx	r6
	mov	r3, r4
	ldr	r2, .L42+28
	ldr	r1, .L42+32
	ldr	r0, .L42+36
	ldr	r4, .L42+40
	mov	lr, pc
	bx	r4
	ldr	r3, [r5]
	cmp	r3, #0
	bne	.L1
	ldr	r3, .L42+44
	ldr	r5, [r3]
	cmp	r5, #0
	bne	.L34
	mov	lr, pc
	bx	r6
	mov	r3, r5
	ldr	r2, .L42+28
	ldr	r1, .L42+48
	ldr	r0, .L42+52
	mov	lr, pc
	bx	r4
.L34:
	ldr	r3, .L42+56
.L11:
	mov	r2, #1
	str	r2, [r3]
.L1:
	pop	{r4, r5, r6, lr}
	bx	lr
.L40:
	ldr	r6, .L42+8
	ldr	r3, [r6, #4]
	cmp	r3, #135
	bgt	.L6
	ldr	r3, .L42+24
	mov	lr, pc
	bx	r3
	mov	r3, r5
	ldr	r2, .L42+28
	ldr	r1, .L42+60
	ldr	r0, .L42+64
	ldr	r5, .L42+40
	mov	lr, pc
	bx	r5
	ldr	r1, [r6, #4]
	ldr	r3, [r6, #56]
	add	r1, r1, #33
	add	r3, r3, #1
	ldrh	r2, [r4]
	str	r1, [r6, #4]
	str	r3, [r6, #56]
	b	.L6
.L39:
	ldr	r6, .L42+8
	ldr	r3, [r6, #4]
	cmp	r3, #70
	ble	.L5
	ldr	r3, .L42+24
	mov	lr, pc
	bx	r3
	mov	r3, r5
	ldr	r2, .L42+28
	ldr	r1, .L42+60
	ldr	r0, .L42+64
	ldr	r5, .L42+40
	mov	lr, pc
	bx	r5
	ldr	r2, [r6, #4]
	ldr	r3, [r6, #56]
	sub	r2, r2, #33
	sub	r3, r3, #1
	str	r2, [r6, #4]
	str	r3, [r6, #56]
	ldrh	r2, [r4]
	b	.L5
.L38:
	ldr	r6, .L42+8
	ldr	r3, [r6]
	cmp	r3, #95
	bgt	.L4
	ldr	r3, .L42+24
	mov	lr, pc
	bx	r3
	mov	r3, r5
	ldr	r2, .L42+28
	ldr	r1, .L42+60
	ldr	r0, .L42+64
	ldr	r5, .L42+40
	mov	lr, pc
	bx	r5
	ldr	r2, [r6]
	ldr	r3, [r6, #56]
	add	r2, r2, #33
	add	r3, r3, #3
	str	r2, [r6]
	str	r3, [r6, #56]
	ldrh	r2, [r4]
	b	.L4
.L37:
	ldr	r6, .L42+8
	ldr	r3, [r6]
	cmp	r3, #30
	ble	.L3
	ldr	r3, .L42+24
	mov	lr, pc
	bx	r3
	mov	r3, r5
	ldr	r2, .L42+28
	ldr	r1, .L42+60
	ldr	r0, .L42+64
	ldr	r5, .L42+40
	mov	lr, pc
	bx	r5
	ldr	r2, [r6]
	ldr	r3, [r6, #56]
	sub	r2, r2, #33
	sub	r3, r3, #3
	str	r2, [r6]
	str	r3, [r6, #56]
	ldrh	r2, [r4]
	b	.L3
.L36:
	ldr	r3, .L42+16
	ldr	r1, [r3]
	cmp	r1, #5
	moveq	r1, #8
	streq	r1, [r3]
	b	.L2
.L41:
	ldr	r3, .L42+24
	mov	lr, pc
	bx	r3
	mov	r3, r4
	ldr	r2, .L42+28
	ldr	r1, .L42+68
	ldr	r0, .L42+72
	ldr	r4, .L42+40
	mov	lr, pc
	bx	r4
	mov	r2, #1
	ldr	r0, [r5]
	ldr	r1, .L42+44
	ldr	r3, .L42+56
	cmp	r0, #0
	str	r2, [r1]
	str	r2, [r3]
	bne	.L1
	b	.L11
.L43:
	.align	2
.L42:
	.word	oldButtons
	.word	buttons
	.word	playerSelect
	.word	bushes
	.word	playerLives
	.word	treasure
	.word	stopSoundB
	.word	11025
	.word	4320
	.word	THFailSound
	.word	playSoundB
	.word	isFound
	.word	46368
	.word	THLoseSound
	.word	THGameState
	.word	1314
	.word	choosingSound
	.word	22464
	.word	RPSWinSound
	.size	updateSelect.part.1, .-updateSelect.part.1
	.align	2
	.global	updateTHGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateTHGame, %function
updateTHGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L46
	ldr	r3, [r3]
	cmp	r3, #0
	bxne	lr
	b	updateSelect.part.1
.L47:
	.align	2
.L46:
	.word	THGameState
	.size	updateTHGame, .-updateTHGame
	.align	2
	.global	drawTHGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawTHGame, %function
drawTHGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r0, #280
	push	{r4, r5, r6, r7, r8, lr}
	mov	r5, #512
	mov	r4, #152
	ldr	r1, .L55
	ldr	r3, .L55+4
	ldr	r2, [r1, #4]
	ldr	ip, [r1]
	ldr	r1, .L55+8
	orr	r2, r2, r3
	mov	r6, r3
	ldr	r3, .L55+12
	strh	ip, [r1, #200]	@ movhi
	strh	r2, [r1, #202]	@ movhi
	strh	r0, [r1, #204]	@ movhi
	add	lr, r3, #576
.L51:
	add	r0, r3, #52
	ldm	r0, {r0, r2}
	cmp	r0, #0
	add	r2, r2, #16
	lsl	r0, r2, #3
	ldrne	r2, [r3, #4]
	ldrne	r7, [r3]
	add	ip, r1, r0
	orrne	r2, r2, r6
	lsleq	r2, r2, #3
	add	r3, r3, #64
	strhne	r4, [ip, #4]	@ movhi
	strhne	r2, [ip, #2]	@ movhi
	strhne	r7, [r1, r0]	@ movhi
	strheq	r5, [r1, r2]	@ movhi
	cmp	r3, lr
	bne	.L51
	ldr	r2, .L55+16
	ldr	r3, [r2, #4]
	mvn	r3, r3, lsl #17
	mov	r0, #908
	mvn	r3, r3, lsr #17
	ldr	ip, .L55+20
	ldr	ip, [ip]
	ldr	r2, [r2]
	cmp	ip, #1
	strh	r3, [r1, #210]	@ movhi
	strh	r2, [r1, #208]	@ movhi
	strh	r0, [r1, #212]	@ movhi
	bne	.L52
	mov	r4, #30
	ldr	r3, .L55+24
	ldr	r3, [r3]
	lsl	r3, r3, #6
	add	r3, r3, #912
	ldr	r2, .L55+28
	ldr	lr, .L55+32
	ldr	ip, .L55+36
	strh	r3, [r1, #124]	@ movhi
	ldr	r0, .L55+40
	ldr	r3, .L55+44
	strh	r4, [r2]	@ movhi
	strh	lr, [r2, #2]	@ movhi
	strh	ip, [r2, #4]	@ movhi
	strh	r0, [r1, #120]	@ movhi
	strh	r3, [r1, #122]	@ movhi
.L52:
	ldr	r3, .L55+48
	mov	lr, pc
	bx	r3
	ldr	r4, .L55+52
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L55+8
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	ldr	r2, .L55+56
	ldrh	r1, [r2]
	ldr	r2, .L55+60
	ldrh	r2, [r2]
	strh	r1, [r3, #16]	@ movhi
	pop	{r4, r5, r6, r7, r8, lr}
	strh	r2, [r3, #18]	@ movhi
	bx	lr
.L56:
	.align	2
.L55:
	.word	treasure
	.word	-32768
	.word	shadowOAM
	.word	bushes
	.word	playerSelect
	.word	THGameState
	.word	isFound
	.word	shadowOAM+288
	.word	16414
	.word	926
	.word	16394
	.word	-32758
	.word	waitForVBlank
	.word	DMANow
	.word	TH_hOff
	.word	TH_vOff
	.size	drawTHGame, .-drawTHGame
	.align	2
	.global	initBush
	.syntax unified
	.arm
	.fpu softvfp
	.type	initBush, %function
initBush:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	mov	ip, #30
	mov	lr, #0
	mov	r0, #32
	mov	r4, #1
	ldr	r5, .L63
.L58:
	mov	r3, r5
	mov	r1, lr
	mov	r2, #70
.L59:
	str	r2, [r3, #4]
	add	r2, r2, #33
	cmp	r2, #169
	str	r1, [r3, #56]
	str	r0, [r3, #24]
	str	r0, [r3, #28]
	str	ip, [r3]
	str	r4, [r3, #52]
	add	r1, r1, #1
	add	r3, r3, #64
	bne	.L59
	add	lr, lr, #3
	cmp	lr, #9
	add	r5, r5, #192
	add	ip, ip, #33
	bne	.L58
	pop	{r4, r5, lr}
	bx	lr
.L64:
	.align	2
.L63:
	.word	bushes
	.size	initBush, .-initBush
	.align	2
	.global	updateBush
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBush, %function
updateBush:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	bx	lr
	.size	updateBush, .-updateBush
	.align	2
	.global	drawBush
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBush, %function
drawBush:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	add	r2, r0, #52
	ldm	r2, {r2, r3}
	cmp	r2, #0
	add	r3, r3, #16
	beq	.L67
	ldr	r2, [r0, #4]
	mvn	r2, r2, lsl #17
	str	lr, [sp, #-4]!
	mvn	r2, r2, lsr #17
	mov	lr, #152
	ldr	ip, .L73
	ldr	r0, [r0]
	lsl	r3, r3, #3
	add	r1, ip, r3
	strh	lr, [r1, #4]	@ movhi
	strh	r0, [ip, r3]	@ movhi
	strh	r2, [r1, #2]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L67:
	mov	r1, #512
	ldr	r2, .L73
	lsl	r3, r3, #3
	strh	r1, [r2, r3]	@ movhi
	bx	lr
.L74:
	.align	2
.L73:
	.word	shadowOAM
	.size	drawBush, .-drawBush
	.align	2
	.global	initTreasure
	.syntax unified
	.arm
	.fpu softvfp
	.type	initTreasure, %function
initTreasure:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L77
	mov	lr, pc
	bx	r3
	mov	r1, #32
	ldr	r3, .L77+4
	smull	ip, r2, r3, r0
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #1
	add	r3, r3, r3, lsl #3
	ldr	r2, .L77+8
	sub	r3, r0, r3
	add	r0, r2, r3, lsl #6
	ldr	ip, [r0, #4]
	ldr	r0, [r2, r3, lsl #6]
	ldr	r2, .L77+12
	pop	{r4, lr}
	stm	r2, {r0, ip}
	str	r3, [r2, #56]
	str	r1, [r2, #24]
	str	r1, [r2, #28]
	bx	lr
.L78:
	.align	2
.L77:
	.word	rand
	.word	954437177
	.word	bushes
	.word	treasure
	.size	initTreasure, .-initTreasure
	.align	2
	.global	initTHGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	initTHGame, %function
initTHGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r4, #0
	mov	r2, #5
	ldr	r3, .L81
	ldr	r0, .L81+4
	ldr	r1, .L81+8
	str	r4, [r3]
	ldr	ip, .L81+12
	ldr	r3, .L81+16
	str	r4, [r0]
	str	r4, [r1]
	str	r2, [r3]
	str	r4, [ip]
	bl	initBush
	bl	initTreasure
	mov	r2, #32
	ldr	r1, .L81+20
	ldr	r3, .L81+24
	ldm	r1, {r0, r1}
	str	r4, [r3, #56]
	stm	r3, {r0, r1}
	str	r2, [r3, #24]
	str	r2, [r3, #28]
	pop	{r4, lr}
	bx	lr
.L82:
	.align	2
.L81:
	.word	TH_vOff
	.word	isFound
	.word	THGameState
	.word	TH_hOff
	.word	playerLives
	.word	bushes
	.word	playerSelect
	.size	initTHGame, .-initTHGame
	.align	2
	.global	updateTreasure
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateTreasure, %function
updateTreasure:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	bx	lr
	.size	updateTreasure, .-updateTreasure
	.align	2
	.global	drawTreasure
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawTreasure, %function
drawTreasure:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L85
	ldr	r3, [r2, #4]
	mvn	r3, r3, lsl #17
	mov	r1, #280
	mvn	r3, r3, lsr #17
	ldr	r0, [r2]
	ldr	r2, .L85+4
	strh	r3, [r2, #202]	@ movhi
	strh	r0, [r2, #200]	@ movhi
	strh	r1, [r2, #204]	@ movhi
	bx	lr
.L86:
	.align	2
.L85:
	.word	treasure
	.word	shadowOAM
	.size	drawTreasure, .-drawTreasure
	.align	2
	.global	initSelect
	.syntax unified
	.arm
	.fpu softvfp
	.type	initSelect, %function
initSelect:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #32
	mov	r0, #0
	ldr	r1, .L88
	ldr	r3, .L88+4
	ldr	ip, [r1]
	ldr	r1, [r1, #4]
	str	ip, [r3]
	str	r1, [r3, #4]
	str	r0, [r3, #56]
	str	r2, [r3, #24]
	str	r2, [r3, #28]
	bx	lr
.L89:
	.align	2
.L88:
	.word	bushes
	.word	playerSelect
	.size	initSelect, .-initSelect
	.align	2
	.global	updateSelect
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateSelect, %function
updateSelect:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L92
	ldr	r3, [r3]
	cmp	r3, #0
	bxne	lr
	b	updateSelect.part.1
.L93:
	.align	2
.L92:
	.word	THGameState
	.size	updateSelect, .-updateSelect
	.align	2
	.global	drawSelect
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawSelect, %function
drawSelect:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L95
	ldr	r3, [r2, #4]
	mvn	r3, r3, lsl #17
	mov	r1, #908
	mvn	r3, r3, lsr #17
	ldr	r0, [r2]
	ldr	r2, .L95+4
	strh	r3, [r2, #210]	@ movhi
	strh	r0, [r2, #208]	@ movhi
	strh	r1, [r2, #212]	@ movhi
	bx	lr
.L96:
	.align	2
.L95:
	.word	playerSelect
	.word	shadowOAM
	.size	drawSelect, .-drawSelect
	.align	2
	.global	drawTHGameSet
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawTHGameSet, %function
drawTHGameSet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, #30
	ldr	r3, .L99
	push	{r4, lr}
	ldr	r2, [r3]
	ldr	r4, .L99+4
	ldr	r3, .L99+8
	ldr	lr, .L99+12
	lsl	r2, r2, #6
	add	r2, r2, #912
	ldr	r0, .L99+16
	ldr	r1, .L99+20
	strh	r2, [r3, #124]	@ movhi
	strh	r4, [r3, #120]	@ movhi
	add	r2, r3, #288
	strh	lr, [r3, #122]	@ movhi
	add	r3, r3, #292
	strh	ip, [r2]	@ movhi
	strh	r0, [r2, #2]	@ movhi
	strh	r1, [r3]	@ movhi
	pop	{r4, lr}
	bx	lr
.L100:
	.align	2
.L99:
	.word	isFound
	.word	16394
	.word	shadowOAM
	.word	-32758
	.word	16414
	.word	926
	.size	drawTHGameSet, .-drawTHGameSet
	.comm	treasure,64,4
	.comm	bushes,576,4
	.comm	playerSelect,64,4
	.comm	shadowOAM,1024,4
	.comm	isFound,4,4
	.comm	playerLives,4,4
	.comm	THGameState,4,4
	.comm	TH_vOff,4,4
	.comm	TH_hOff,4,4
	.comm	soundB,32,4
	.comm	soundA,32,4
	.ident	"GCC: (devkitARM release 50) 8.2.0"
