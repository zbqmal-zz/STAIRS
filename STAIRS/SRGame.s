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
	.file	"SRGame.c"
	.text
	.align	2
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateSRPlayer.part.0, %function
updateSRPlayer.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L16
	ldrh	r1, [r3]
	push	{r4, r5, r6, lr}
	ldr	r3, .L16+4
	ldr	lr, .L16+8
	tst	r1, #1
	ldr	r2, [r3, #12]
	ldr	ip, [lr]
	beq	.L2
	ldr	r0, .L16+12
	ldrh	r0, [r0]
	ands	r0, r0, #1
	beq	.L15
.L2:
	tst	r1, #512
	beq	.L6
	ldr	r1, .L16+12
	ldrh	r1, [r1]
	tst	r1, #512
	moveq	r1, #10
	streq	r1, [r3, #20]
.L6:
	ldr	r0, .L16+16
	ldr	r1, [r3, #8]
	ldr	r0, [r0]
	sub	r2, r2, ip
	sub	r1, r1, r0
	stm	r3, {r1, r2}
	pop	{r4, r5, r6, lr}
	bx	lr
.L15:
	ldr	r4, [r3, #36]
	add	r4, r4, #1
	cmp	r4, #3
	movgt	r4, r0
	ldr	r0, [r3, #24]
	ldr	r5, [r3, #4]
	add	r0, r0, r0, lsr #31
	asr	r0, r0, #1
	ldr	r6, [r3, #20]
	add	r5, r0, r5
	add	r2, r2, r6
	cmp	r5, #119
	str	r4, [r3, #36]
	str	r2, [r3, #12]
	ble	.L5
	ldr	r4, .L16+20
	cmp	ip, r4
	addle	ip, ip, r6
	strle	ip, [lr]
.L5:
	add	r0, r2, r0
	cmp	r0, #512
	movgt	r0, #1
	ldrgt	r4, .L16+24
	ldrgt	lr, .L16+28
	strgt	r0, [r4]
	strgt	r0, [lr]
	b	.L2
.L17:
	.align	2
.L16:
	.word	oldButtons
	.word	player
	.word	SR_hOff
	.word	buttons
	.word	SR_vOff
	.word	273
	.word	SRGameState
	.word	isSRPlayerWin
	.size	updateSRPlayer.part.0, .-updateSRPlayer.part.0
	.align	2
	.global	initSRPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	initSRPlayer, %function
initSRPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	mov	r2, #0
	mov	lr, #64
	mov	ip, #32
	mov	r0, #16
	mov	r1, #4
	ldr	r3, .L20
	str	lr, [r3, #8]
	str	ip, [r3, #24]
	str	r0, [r3, #28]
	str	r1, [r3, #20]
	str	r2, [r3, #12]
	str	r2, [r3]
	str	r2, [r3, #4]
	str	r2, [r3, #36]
	ldr	lr, [sp], #4
	bx	lr
.L21:
	.align	2
.L20:
	.word	player
	.size	initSRPlayer, .-initSRPlayer
	.align	2
	.global	updateSRPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateSRPlayer, %function
updateSRPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L24
	ldr	r3, [r3]
	cmp	r3, #0
	bxne	lr
	b	updateSRPlayer.part.0
.L25:
	.align	2
.L24:
	.word	SRGameState
	.size	updateSRPlayer, .-updateSRPlayer
	.align	2
	.global	drawSRPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawSRPlayer, %function
drawSRPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r0, .L27
	ldr	r2, [r0, #4]
	mvn	r2, r2, lsl #17
	mvn	r2, r2, lsr #17
	ldr	r3, [r0, #36]
	ldr	r1, .L27+4
	ldr	r0, [r0]
	add	r3, r3, #179
	add	ip, r1, #376
	orr	r0, r0, #16384
	add	r1, r1, #380
	lsl	r3, r3, #2
	strh	r2, [ip, #2]	@ movhi
	strh	r0, [ip]	@ movhi
	strh	r3, [r1]	@ movhi
	bx	lr
.L28:
	.align	2
.L27:
	.word	player
	.word	shadowOAM
	.size	drawSRPlayer, .-drawSRPlayer
	.align	2
	.global	initSRComputers
	.syntax unified
	.arm
	.fpu softvfp
	.type	initSRComputers, %function
initSRComputers:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r3, #20
	mov	r5, #0
	mov	r9, #32
	mov	r8, #16
	ldr	r4, .L31
	ldr	r7, .L31+4
	str	r3, [r4, #8]
	str	r5, [r4, #56]
	str	r5, [r4, #12]
	str	r5, [r4]
	str	r5, [r4, #4]
	str	r9, [r4, #24]
	str	r8, [r4, #28]
	mov	lr, pc
	bx	r7
	ldr	r10, .L31+8
	smull	r3, r2, r10, r0
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #2
	add	r3, r3, r3, lsl #2
	sub	r0, r0, r3, lsl #1
	add	r0, r0, #1
	str	r0, [r4, #20]
	mov	lr, pc
	bx	r7
	mov	r1, #1
	mov	r2, #120
	smull	r3, ip, r10, r0
	asr	r3, r0, #31
	rsb	r3, r3, ip, asr #3
	add	r3, r3, r3, lsl #2
	sub	r0, r0, r3, lsl #2
	add	r0, r0, r1
	str	r1, [r4, #120]
	str	r2, [r4, #72]
	str	r5, [r4, #36]
	str	r5, [r4, #76]
	str	r5, [r4, #64]
	str	r5, [r4, #68]
	str	r9, [r4, #88]
	str	r8, [r4, #92]
	str	r0, [r4, #32]
	mov	lr, pc
	bx	r7
	smull	r3, r2, r10, r0
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #2
	add	r3, r3, r3, lsl #2
	sub	r0, r0, r3, lsl #1
	add	r0, r0, #1
	str	r0, [r4, #84]
	mov	lr, pc
	bx	r7
	smull	r3, r6, r0, r10
	asr	r3, r0, #31
	rsb	r6, r3, r6, asr #3
	add	r6, r6, r6, lsl #2
	sub	r0, r0, r6, lsl #2
	add	r0, r0, #1
	str	r5, [r4, #100]
	str	r0, [r4, #96]
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L32:
	.align	2
.L31:
	.word	SRComputers
	.word	rand
	.word	1717986919
	.size	initSRComputers, .-initSRComputers
	.align	2
	.global	initSRGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	initSRGame, %function
initSRGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #0
	str	lr, [sp, #-4]!
	mov	lr, #64
	mov	ip, #32
	mov	r0, #16
	mov	r1, #4
	ldr	r3, .L35
	str	r2, [r3]
	ldr	r3, .L35+4
	str	r2, [r3]
	ldr	r3, .L35+8
	str	r2, [r3]
	ldr	r3, .L35+12
	str	r2, [r3]
	ldr	r3, .L35+16
	str	lr, [r3, #8]
	ldr	lr, [sp], #4
	str	r2, [r3, #12]
	str	r2, [r3]
	str	r2, [r3, #4]
	str	r2, [r3, #36]
	str	ip, [r3, #24]
	str	r0, [r3, #28]
	str	r1, [r3, #20]
	b	initSRComputers
.L36:
	.align	2
.L35:
	.word	SR_vOff
	.word	SR_hOff
	.word	isSRPlayerWin
	.word	SRGameState
	.word	player
	.size	initSRGame, .-initSRGame
	.align	2
	.global	updateSRComputer
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateSRComputer, %function
updateSRComputer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r1, .L47
	ldr	r3, [r1]
	cmp	r3, #0
	bxne	lr
	ldr	r2, [r0, #32]
	add	r2, r2, #1
	cmp	r2, #20
	str	r2, [r0, #32]
	str	lr, [sp, #-4]!
	ldr	r2, [r0, #12]
	ble	.L39
	ldr	ip, [r0, #36]
	add	ip, ip, #1
	cmp	ip, #3
	movgt	ip, r3
	ldr	lr, [r0, #20]
	add	r2, r2, lr
	str	r3, [r0, #32]
	str	ip, [r0, #36]
	str	r2, [r0, #12]
.L39:
	ldr	r3, [r0, #24]
	add	r3, r3, r3, lsr #31
	add	r3, r2, r3, asr #1
	cmp	r3, #512
	movge	lr, #1
	movge	ip, #0
	ldrge	r3, .L47+4
	strge	lr, [r1]
	strge	ip, [r3]
	ldr	r1, .L47+8
	ldr	r3, .L47+12
	ldr	r1, [r1]
	ldr	ip, [r3]
	ldr	r3, [r0, #8]
	sub	r2, r2, r1
	sub	r3, r3, ip
	str	r3, [r0]
	str	r2, [r0, #4]
	ldr	lr, [sp], #4
	bx	lr
.L48:
	.align	2
.L47:
	.word	SRGameState
	.word	isSRPlayerWin
	.word	SR_hOff
	.word	SR_vOff
	.size	updateSRComputer, .-updateSRComputer
	.align	2
	.global	updateSRGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateSRGame, %function
updateSRGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L54
	ldr	r3, [r3]
	cmp	r3, #0
	bxne	lr
	push	{r4, lr}
	bl	updateSRPlayer.part.0
	ldr	r0, .L54+4
	bl	updateSRComputer
	ldr	r0, .L54+8
	pop	{r4, lr}
	b	updateSRComputer
.L55:
	.align	2
.L54:
	.word	SRGameState
	.word	SRComputers
	.word	SRComputers+64
	.size	updateSRGame, .-updateSRGame
	.align	2
	.global	drawSRComputer
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawSRComputer, %function
drawSRComputer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L63
	ldr	r1, [r0, #12]
	ldr	r2, [r3]
	ldr	ip, [r0, #56]
	cmp	r1, r2
	add	r3, ip, #48
	blt	.L57
	add	r2, r2, #239
	cmp	r1, r2
	bgt	.L57
	ldr	r1, [r0, #4]
	mvn	r1, r1, lsl #17
	mvn	r1, r1, lsr #17
	ldr	r2, [r0, #36]
	str	lr, [sp, #-4]!
	ldr	r0, [r0]
	ldr	lr, .L63+4
	add	r2, r2, ip, lsl #4
	lsl	r3, r3, #3
	add	r2, r2, #195
	add	ip, lr, r3
	orr	r0, r0, #16384
	lsl	r2, r2, #2
	strh	r0, [lr, r3]	@ movhi
	strh	r1, [ip, #2]	@ movhi
	strh	r2, [ip, #4]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L57:
	mov	r1, #512
	ldr	r2, .L63+4
	lsl	r3, r3, #3
	strh	r1, [r2, r3]	@ movhi
	bx	lr
.L64:
	.align	2
.L63:
	.word	SR_hOff
	.word	shadowOAM
	.size	drawSRComputer, .-drawSRComputer
	.align	2
	.global	drawSRGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawSRGame, %function
drawSRGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L72
	ldr	r3, [r3]
	cmp	r3, #0
	push	{r4, lr}
	beq	.L66
	cmp	r3, #1
	bne	.L68
	ldr	r3, .L72+4
	ldr	r3, [r3]
	cmp	r3, #0
	movne	ip, #976
	moveq	ip, #912
	ldr	r1, .L72+8
	ldr	r3, .L72+12
	ldr	r2, [r1, #4]
	ldr	r0, .L72+16
	ldr	r1, [r1]
	ldr	lr, .L72+20
	strh	ip, [r3, #124]	@ movhi
	sub	r2, r2, #16
	ldr	ip, .L72+24
	strh	r0, [r3, #120]	@ movhi
	strh	lr, [r3, #122]	@ movhi
	add	r0, r3, #288
	orr	r2, r2, #16384
	sub	r1, r1, #16
	add	r3, r3, #292
	strh	r2, [r0, #2]	@ movhi
	strh	r1, [r0]	@ movhi
	strh	ip, [r3]	@ movhi
.L68:
	ldr	r3, .L72+28
	mov	lr, pc
	bx	r3
	ldr	r4, .L72+32
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L72+12
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	ldr	r2, .L72+36
	ldrh	r1, [r2]
	ldr	r2, .L72+40
	ldrh	r2, [r2]
	strh	r1, [r3, #16]	@ movhi
	pop	{r4, lr}
	strh	r2, [r3, #18]	@ movhi
	bx	lr
.L66:
	ldr	r1, .L72+8
	ldr	r2, [r1, #4]
	mvn	r2, r2, lsl #17
	mvn	r2, r2, lsr #17
	ldr	r3, [r1, #36]
	ldr	ip, [r1]
	add	r3, r3, #179
	ldr	r1, .L72+44
	orr	ip, ip, #16384
	lsl	r3, r3, #2
	ldr	r0, .L72+48
	strh	r2, [r1, #2]	@ movhi
	strh	ip, [r1]	@ movhi
	strh	r3, [r1, #4]	@ movhi
	bl	drawSRComputer
	ldr	r0, .L72+52
	bl	drawSRComputer
	b	.L68
.L73:
	.align	2
.L72:
	.word	SRGameState
	.word	isSRPlayerWin
	.word	player
	.word	shadowOAM
	.word	16404
	.word	-32664
	.word	926
	.word	waitForVBlank
	.word	DMANow
	.word	SR_hOff
	.word	SR_vOff
	.word	shadowOAM+376
	.word	SRComputers
	.word	SRComputers+64
	.size	drawSRGame, .-drawSRGame
	.align	2
	.global	drawSRGameSet
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawSRGameSet, %function
drawSRGameSet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L78
	ldr	r3, [r3]
	cmp	r3, #0
	movne	ip, #976
	moveq	ip, #912
	ldr	r1, .L78+4
	ldr	r3, .L78+8
	ldr	r2, [r1, #4]
	str	lr, [sp, #-4]!
	ldr	r0, .L78+12
	ldr	lr, .L78+16
	ldr	r1, [r1]
	strh	ip, [r3, #124]	@ movhi
	sub	r2, r2, #16
	ldr	ip, .L78+20
	strh	r0, [r3, #120]	@ movhi
	strh	lr, [r3, #122]	@ movhi
	add	r0, r3, #288
	orr	r2, r2, #16384
	sub	r1, r1, #16
	add	r3, r3, #292
	strh	r2, [r0, #2]	@ movhi
	strh	r1, [r0]	@ movhi
	strh	ip, [r3]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L79:
	.align	2
.L78:
	.word	isSRPlayerWin
	.word	player
	.word	shadowOAM
	.word	16404
	.word	-32664
	.word	926
	.size	drawSRGameSet, .-drawSRGameSet
	.comm	SRComputers,128,4
	.comm	shadowOAM,1024,4
	.comm	isSRPlayerWin,4,4
	.comm	SRGameState,4,4
	.comm	SRComputer,128,4
	.comm	player,64,4
	.comm	SR_vOff,4,4
	.comm	SR_hOff,4,4
	.ident	"GCC: (devkitARM release 50) 8.2.0"
