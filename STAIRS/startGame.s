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
	.file	"startGame.c"
	.text
	.align	2
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawHighlighter.part.1, %function
drawHighlighter.part.1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r1, #768
	ldr	r3, .L3
	ldm	r3, {r0, r2}
	ldr	r3, .L3+4
	orr	r2, r2, #16384
	strh	r2, [r3, #58]	@ movhi
	strh	r0, [r3, #56]	@ movhi
	strh	r1, [r3, #60]	@ movhi
	bx	lr
.L4:
	.align	2
.L3:
	.word	highlighter
	.word	shadowOAM
	.size	drawHighlighter.part.1, .-drawHighlighter.part.1
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawButtonB.part.2, %function
drawButtonB.part.2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r1, .L6
	ldr	r3, .L6+4
	ldr	r2, [r1, #4]
	ldr	ip, [r1]
	ldr	r0, .L6+8
	add	r1, r3, #280
	orr	r2, r2, #16384
	add	r3, r3, #284
	strh	r2, [r1, #2]	@ movhi
	strh	ip, [r1]	@ movhi
	strh	r0, [r3]	@ movhi
	bx	lr
.L7:
	.align	2
.L6:
	.word	buttonB
	.word	shadowOAM
	.word	926
	.size	drawButtonB.part.2, .-drawButtonB.part.2
	.align	2
	.global	initSGPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	initSGPlayer, %function
initSGPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	mov	r4, #115
	mov	r2, #0
	mov	r5, #16
	mov	lr, #24
	mov	r1, #1
	mov	ip, #4
	mov	r0, #3
	ldr	r3, .L10
	str	r4, [r3, #8]
	add	r4, r4, #255
	str	r5, [r3, #24]
	str	r4, [r3, #12]
	str	lr, [r3, #28]
	str	ip, [r3, #36]
	str	r0, [r3, #48]
	str	r2, [r3]
	str	r2, [r3, #4]
	str	r2, [r3, #32]
	str	r2, [r3, #44]
	str	r1, [r3, #16]
	str	r1, [r3, #20]
	pop	{r4, r5, lr}
	bx	lr
.L11:
	.align	2
.L10:
	.word	player
	.size	initSGPlayer, .-initSGPlayer
	.align	2
	.global	updateSGPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateSGPlayer, %function
updateSGPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #4
	ldr	r2, .L69
	ldr	r2, [r2]
	push	{r4, r5, r6, lr}
	ldr	r4, .L69+4
	cmp	r2, #0
	str	r3, [r4, #36]
	bne	.L13
	add	r1, r4, #8
	ldm	r1, {r1, r2}
.L14:
	ldr	r0, .L69+8
	ldr	r3, .L69+12
	ldr	r0, [r0]
	ldr	r3, [r3]
	sub	r1, r1, r0
	sub	r2, r2, r3
	stm	r4, {r1, r2}
	pop	{r4, r5, r6, lr}
	bx	lr
.L13:
	ldr	r3, .L69+16
	ldrh	r2, [r3, #48]
	tst	r2, #64
	beq	.L15
	ldrh	r2, [r3, #48]
	tst	r2, #128
	bne	.L62
.L15:
	ldr	r3, .L69+16
	ldrh	r2, [r3, #48]
	tst	r2, #64
	bne	.L17
	ldr	r3, [r4, #8]
	ldr	r2, [r4, #12]
	add	r3, r3, #11
	rsb	r3, r3, r3, lsl #4
	lsl	r3, r3, #5
	add	r2, r2, #10
	add	r0, r3, r2
	ldr	r1, .L69+20
	lsl	r0, r0, #1
	ldrh	r0, [r1, r0]
	cmp	r0, #0
	beq	.L18
	ldr	r0, [r4, #24]
	add	r3, r3, r0
	add	r3, r3, r2
	add	r3, r1, r3, lsl #1
	ldrh	r3, [r3, #-2]
	cmp	r3, #0
	beq	.L18
	ldr	r2, .L69+24
	ldr	r3, [r2]
	cmp	r3, #0
	beq	.L63
.L19:
	mov	r3, #3
	ldr	r1, [r4, #8]
	ldr	r2, [r4, #16]
	sub	r1, r1, r2
	str	r1, [r4, #8]
	str	r3, [r4, #36]
	ldr	r2, [r4, #12]
	b	.L20
.L17:
	ldrh	r2, [r3, #48]
	tst	r2, #128
	bne	.L21
	ldr	r3, [r4, #28]
	ldr	r2, [r4, #8]
	sub	r3, r3, #1
	add	r3, r3, r2
	cmp	r3, #158
	bgt	.L18
	ldr	r2, [r4, #12]
	rsb	r3, r3, r3, lsl #4
	lsl	r3, r3, #5
	add	r2, r2, #10
	add	r1, r3, r2
	ldr	r0, .L69+20
	lsl	r1, r1, #1
	ldrh	r1, [r0, r1]
	cmp	r1, #0
	bne	.L64
.L18:
	mov	r1, #0
	ldr	r2, .L69+24
	ldr	r3, .L69+28
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	add	r1, r4, #8
	ldm	r1, {r1, r2}
.L20:
	ldr	r0, [r4, #32]
	ldr	r3, .L69+32
	add	r0, r0, #1
	smull	lr, ip, r3, r0
	asr	r3, r0, #31
	rsb	r3, r3, ip, asr #2
	add	r3, r3, r3, lsl #2
	subs	r3, r0, r3, lsl #1
	str	r0, [r4, #32]
	bne	.L14
	add	r0, r4, #44
	ldm	r0, {r0, ip}
	add	r0, r0, #1
	cmp	r0, ip
	moveq	r0, r3
	str	r3, [r4, #32]
	str	r0, [r4, #44]
	b	.L14
.L62:
	ldrh	r2, [r3, #48]
	tst	r2, #16
	beq	.L15
	ldrh	r3, [r3, #48]
	tst	r3, #32
	beq	.L15
	ldr	r3, .L69+28
	mov	lr, pc
	bx	r3
	mov	r2, #0
	ldr	r3, .L69+24
	ldr	r1, [r4, #8]
	str	r2, [r3]
	ldr	r2, [r4, #12]
	b	.L20
.L21:
	ldrh	r2, [r3, #48]
	tst	r2, #32
	ldr	r2, [r4, #12]
	bne	.L23
	ldr	r1, [r4, #8]
	add	r3, r1, #12
	add	r2, r2, #9
	rsb	r3, r3, r3, lsl #4
	add	r3, r2, r3, lsl #5
	ldr	r0, .L69+20
	lsl	r3, r3, #1
	ldrh	r3, [r0, r3]
	cmp	r3, #0
	beq	.L18
	ldr	r3, [r4, #28]
	add	r1, r1, r3
	sub	r1, r1, #1
	rsb	r1, r1, r1, lsl #4
	add	r1, r2, r1, lsl #5
	lsl	r1, r1, #1
	ldrh	r3, [r0, r1]
	cmp	r3, #0
	beq	.L18
	ldr	r2, .L69+24
	ldr	r3, [r2]
	cmp	r3, #0
	beq	.L65
.L24:
	mov	r3, #2
	ldr	r1, [r4, #12]
	ldr	r2, [r4, #20]
	sub	r2, r1, r2
	str	r2, [r4, #12]
	str	r3, [r4, #36]
	ldr	r1, [r4, #8]
	b	.L20
.L23:
	ldrh	r3, [r3, #48]
	tst	r3, #16
	bne	.L66
	ldr	r3, [r4, #24]
	ldr	ip, [r4, #20]
	sub	r3, r3, #1
	add	r1, r3, r2
	add	r1, r1, ip
	cmp	r1, #480
	bge	.L18
	ldr	r1, [r4, #8]
	add	r0, r3, r2
	add	r3, r1, #12
	add	r0, r0, #11
	rsb	r3, r3, r3, lsl #4
	add	r3, r0, r3, lsl #5
	ldr	lr, .L69+20
	lsl	r3, r3, #1
	ldrh	r3, [lr, r3]
	cmp	r3, #0
	beq	.L18
	ldr	r3, [r4, #28]
	add	r3, r1, r3
	sub	r3, r3, #1
	rsb	r3, r3, r3, lsl #4
	add	r3, r0, r3, lsl #5
	lsl	r3, r3, #1
	ldrh	r3, [lr, r3]
	cmp	r3, #0
	beq	.L18
	ldr	r0, .L69+24
	ldr	r3, [r0]
	cmp	r3, #0
	beq	.L67
.L26:
	mov	r3, #1
	add	r2, r2, ip
	str	r2, [r4, #12]
	str	r3, [r4, #36]
	b	.L20
.L64:
	ldr	r1, [r4, #24]
	add	r3, r3, r1
	add	r3, r3, r2
	add	r3, r0, r3, lsl #1
	ldrh	r3, [r3, #-2]
	cmp	r3, #0
	beq	.L18
	ldr	r2, .L69+24
	ldr	r3, [r2]
	cmp	r3, #0
	beq	.L68
.L22:
	mov	r3, #0
	ldr	r1, [r4, #8]
	ldr	r2, [r4, #16]
	add	r1, r1, r2
	str	r1, [r4, #8]
	str	r3, [r4, #36]
	ldr	r2, [r4, #12]
	b	.L20
.L66:
	ldr	r1, [r4, #8]
	b	.L20
.L63:
	mov	r5, #1
	ldr	r3, .L69+28
	str	r5, [r2]
	mov	lr, pc
	bx	r3
	mov	r3, r5
	ldr	r2, .L69+36
	ldr	r1, .L69+40
	ldr	r0, .L69+44
	ldr	r5, .L69+48
	mov	lr, pc
	bx	r5
	b	.L19
.L68:
	mov	r5, #1
	ldr	r3, .L69+28
	str	r5, [r2]
	mov	lr, pc
	bx	r3
	mov	r3, r5
	ldr	r2, .L69+36
	ldr	r1, .L69+40
	ldr	r0, .L69+44
	ldr	r5, .L69+48
	mov	lr, pc
	bx	r5
	b	.L22
.L65:
	mov	r5, #1
	ldr	r3, .L69+28
	str	r5, [r2]
	mov	lr, pc
	bx	r3
	mov	r3, r5
	ldr	r2, .L69+36
	ldr	r1, .L69+40
	ldr	r0, .L69+44
	ldr	r5, .L69+48
	mov	lr, pc
	bx	r5
	b	.L24
.L67:
	mov	r5, #1
	ldr	r3, .L69+28
	str	r5, [r0]
	mov	lr, pc
	bx	r3
	mov	r3, r5
	ldr	r2, .L69+36
	ldr	r1, .L69+40
	ldr	r0, .L69+44
	ldr	r5, .L69+48
	mov	lr, pc
	bx	r5
	add	r1, r4, #8
	ldm	r1, {r1, r2}
	ldr	ip, [r4, #20]
	b	.L26
.L70:
	.align	2
.L69:
	.word	isOnMenu
	.word	player
	.word	SG_vOff
	.word	SG_hOff
	.word	67109120
	.word	startBGCollisionMapBitmap
	.word	walkingSoundFlag
	.word	stopSoundB
	.word	1717986919
	.word	11025
	.word	14663
	.word	walkingSound
	.word	playSoundB
	.size	updateSGPlayer, .-updateSGPlayer
	.align	2
	.global	drawSGPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawSGPlayer, %function
drawSGPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r1, .L77
	ldr	r2, [r1, #4]
	cmp	r2, #0
	bxle	lr
	ldr	r3, [r1, #36]
	str	lr, [sp, #-4]!
	ldr	lr, [r1, #44]
	ldr	r0, [r1]
	ldr	ip, .L77+4
	add	r3, r3, #2
	ldr	r1, .L77+8
	add	r3, r3, lr, lsl #6
	lsl	r3, r3, #1
	orr	r0, r0, ip
	orr	r2, r2, ip
	strh	r3, [r1, #52]	@ movhi
	strh	r0, [r1, #48]	@ movhi
	strh	r2, [r1, #50]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L78:
	.align	2
.L77:
	.word	player
	.word	-32768
	.word	shadowOAM
	.size	drawSGPlayer, .-drawSGPlayer
	.align	2
	.global	initHighlighter
	.syntax unified
	.arm
	.fpu softvfp
	.type	initHighlighter, %function
initHighlighter:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #0
	mov	r1, #16
	ldr	r3, .L80
	ldr	r0, .L80+4
	str	r2, [r3]
	str	r2, [r0]
	str	r2, [r3, #4]
	str	r2, [r3, #52]
	str	r1, [r3, #24]
	str	r1, [r3, #28]
	bx	lr
.L81:
	.align	2
.L80:
	.word	highlighter
	.word	menuOption
	.size	initHighlighter, .-initHighlighter
	.align	2
	.global	updateHighlighter
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateHighlighter, %function
updateHighlighter:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #0
	ldr	r0, .L91
	ldr	r3, [r0]
	str	lr, [sp, #-4]!
	ldr	r1, .L91+4
	sub	lr, r3, #81
	ldr	ip, .L91+8
	cmp	lr, #28
	str	r2, [r1, #52]
	str	r2, [ip, #52]
	bhi	.L83
	ldr	r3, [r0, #4]
	sub	r2, r3, #126
	cmp	r2, #28
	bls	.L89
.L84:
	sub	r3, r3, #196
	cmp	r3, #13
	bhi	.L82
	mov	r2, #10
	mov	lr, #175
	mov	r3, #1
	mov	r0, #2
	str	r2, [r1]
	ldr	r2, .L91+12
	str	lr, [r1, #4]
	str	r3, [r1, #52]
	str	r3, [ip, #52]
	str	r0, [r2]
	ldr	lr, [sp], #4
	bx	lr
.L83:
	sub	r3, r3, #71
	cmp	r3, #38
	bls	.L90
.L82:
	ldr	lr, [sp], #4
	bx	lr
.L89:
	mov	r3, #1
	mov	lr, #55
	mov	r0, #105
	ldr	r2, .L91+12
	str	lr, [r1]
	str	r0, [r1, #4]
	str	r3, [r1, #52]
	str	r3, [ip, #52]
	str	r3, [r2]
	ldr	lr, [sp], #4
	bx	lr
.L90:
	ldr	r3, [r0, #4]
	b	.L84
.L92:
	.align	2
.L91:
	.word	player
	.word	highlighter
	.word	buttonB
	.word	menuOption
	.size	updateHighlighter, .-updateHighlighter
	.align	2
	.global	updateStartGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateStartGame, %function
updateStartGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	bl	updateSGPlayer
	bl	updateHighlighter
	ldr	r2, .L95
	ldr	r3, [r2]
	ldr	r0, [r2, #28]
	ldr	r1, [r2, #4]
	add	r3, r3, r0
	ldr	r2, .L95+4
	add	r3, r3, #3
	str	r3, [r2]
	str	r1, [r2, #4]
	pop	{r4, lr}
	bx	lr
.L96:
	.align	2
.L95:
	.word	player
	.word	buttonB
	.size	updateStartGame, .-updateStartGame
	.align	2
	.global	drawHighlighter
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawHighlighter, %function
drawHighlighter:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L105
	ldr	r3, [r3, #52]
	cmp	r3, #0
	beq	.L98
	ldr	r3, .L105+4
	ldr	r3, [r3]
	cmp	r3, #0
	bne	drawHighlighter.part.1
.L98:
	mov	r2, #512
	ldr	r3, .L105+8
	strh	r2, [r3, #56]	@ movhi
	bx	lr
.L106:
	.align	2
.L105:
	.word	highlighter
	.word	isOnMenu
	.word	shadowOAM
	.size	drawHighlighter, .-drawHighlighter
	.align	2
	.global	initButtonB
	.syntax unified
	.arm
	.fpu softvfp
	.type	initButtonB, %function
initButtonB:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #0
	mov	r1, #8
	ldr	r3, .L108
	str	r2, [r3]
	str	r2, [r3, #4]
	str	r2, [r3, #52]
	str	r1, [r3, #24]
	str	r1, [r3, #28]
	bx	lr
.L109:
	.align	2
.L108:
	.word	buttonB
	.size	initButtonB, .-initButtonB
	.align	2
	.global	updateButtonB
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateButtonB, %function
updateButtonB:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L111
	ldr	r3, [r2]
	ldr	r0, [r2, #28]
	ldr	r1, [r2, #4]
	add	r3, r3, r0
	ldr	r2, .L111+4
	add	r3, r3, #3
	str	r3, [r2]
	str	r1, [r2, #4]
	bx	lr
.L112:
	.align	2
.L111:
	.word	player
	.word	buttonB
	.size	updateButtonB, .-updateButtonB
	.align	2
	.global	drawButtonB
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawButtonB, %function
drawButtonB:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L115
	ldr	r3, [r3, #52]
	cmp	r3, #0
	bne	drawButtonB.part.2
.L114:
	mov	r2, #512
	ldr	r3, .L115+4
	strh	r2, [r3]	@ movhi
	bx	lr
.L116:
	.align	2
.L115:
	.word	buttonB
	.word	shadowOAM+280
	.size	drawButtonB, .-drawButtonB
	.align	2
	.global	initTitle
	.syntax unified
	.arm
	.fpu softvfp
	.type	initTitle, %function
initTitle:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #80
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r3, #32
	mov	r2, #1
	mov	ip, #20
	mov	fp, #160
	mov	r10, #65
	mov	r9, #55
	mov	r8, #50
	mov	r7, #90
	mov	r6, #35
	mov	r5, #125
	mov	r4, #5
	mov	lr, #195
	ldr	r0, .L119
	str	r1, [r0, #8]
	ldr	r1, .L119+4
	str	ip, [r1, #8]
	str	fp, [r1, #12]
	str	r2, [r1, #16]
	str	r3, [r1, #24]
	str	r3, [r1, #28]
	ldr	r1, .L119+8
	str	r2, [r1, #16]
	str	r3, [r1, #24]
	str	r3, [r1, #28]
	str	r10, [r1, #8]
	str	r9, [r1, #12]
	ldr	r1, .L119+12
	str	r2, [r1, #16]
	str	r3, [r1, #24]
	str	r3, [r1, #28]
	str	r8, [r1, #8]
	str	r7, [r1, #12]
	ldr	r1, .L119+16
	str	r2, [r1, #16]
	str	r3, [r1, #24]
	str	r3, [r1, #28]
	str	r6, [r1, #8]
	str	r5, [r1, #12]
	ldr	r1, .L119+20
	str	ip, [r0, #12]
	str	r2, [r0, #16]
	str	r3, [r0, #24]
	str	r3, [r0, #28]
	str	r2, [r1, #16]
	str	r3, [r1, #24]
	str	r3, [r1, #28]
	str	r4, [r1, #8]
	str	lr, [r1, #12]
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L120:
	.align	2
.L119:
	.word	character_S1
	.word	character_R
	.word	character_T
	.word	character_A
	.word	character_I
	.word	character_S2
	.size	initTitle, .-initTitle
	.align	2
	.global	initStartGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	initStartGame, %function
initStartGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r4, #0
	mov	ip, #115
	mov	r2, #1
	mov	r5, #16
	mov	lr, #24
	mov	r0, #4
	mov	r1, #3
	ldr	r3, .L123
	str	r4, [r3]
	ldr	r3, .L123+4
	str	r4, [r3]
	ldr	r3, .L123+8
	str	r4, [r3]
	ldr	r3, .L123+12
	str	r4, [r3]
	ldr	r3, .L123+16
	str	r4, [r3]
	ldr	r3, .L123+20
	str	ip, [r3, #8]
	add	ip, ip, #255
	str	r4, [r3]
	str	r4, [r3, #4]
	str	r4, [r3, #32]
	str	r4, [r3, #44]
	str	lr, [r3, #28]
	str	r0, [r3, #36]
	str	r1, [r3, #48]
	str	r2, [r3, #16]
	str	r2, [r3, #20]
	str	r5, [r3, #24]
	str	ip, [r3, #12]
	bl	initTitle
	mov	r1, #8
	ldr	r2, .L123+24
	ldr	r3, .L123+28
	ldr	r0, .L123+32
	str	r4, [r2]
	str	r4, [r0]
	str	r4, [r2, #4]
	str	r5, [r2, #24]
	str	r5, [r2, #28]
	str	r4, [r2, #52]
	str	r4, [r3]
	str	r4, [r3, #4]
	str	r4, [r3, #52]
	str	r1, [r3, #24]
	str	r1, [r3, #28]
	pop	{r4, r5, r6, lr}
	bx	lr
.L124:
	.align	2
.L123:
	.word	SG_vOff
	.word	SG_hOff
	.word	isOnMenu
	.word	goingOnMenu
	.word	walkingSoundFlag
	.word	player
	.word	highlighter
	.word	buttonB
	.word	menuOption
	.size	initStartGame, .-initStartGame
	.align	2
	.global	updateTitle
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateTitle, %function
updateTitle:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	bx	lr
	.size	updateTitle, .-updateTitle
	.align	2
	.global	drawTitle
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawTitle, %function
drawTitle:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r1, .L139
	ldr	r3, [r1, #12]
	cmn	r3, #4
	blt	.L127
	mvn	r2, r3, lsl #17
	mov	r0, #0
	mvn	r2, r2, lsr #17
	ldr	r3, .L139+4
	ldr	r1, [r1, #8]
	strh	r2, [r3, #2]	@ movhi
	strh	r1, [r3]	@ movhi
	strh	r0, [r3, #4]	@ movhi
.L128:
	ldr	r1, .L139+8
	ldr	r2, [r1, #12]
	cmn	r2, #4
	mvnge	r2, r2, lsl #17
	movlt	r2, #512
	mvnge	r2, r2, lsr #17
	movge	r0, #128
	ldrge	r1, [r1, #8]
	strhge	r1, [r3, #8]	@ movhi
	ldr	r1, .L139+12
	strhge	r2, [r3, #10]	@ movhi
	strhlt	r2, [r3, #8]	@ movhi
	ldr	r2, [r1, #12]
	strhge	r0, [r3, #12]	@ movhi
	cmn	r2, #4
	mvnge	r2, r2, lsl #17
	movlt	r2, #512
	mvnge	r2, r2, lsr #17
	movge	r0, #256
	ldrge	r1, [r1, #8]
	strhge	r1, [r3, #16]	@ movhi
	ldr	r1, .L139+16
	strhge	r2, [r3, #18]	@ movhi
	strhlt	r2, [r3, #16]	@ movhi
	ldr	r2, [r1, #12]
	strhge	r0, [r3, #20]	@ movhi
	cmn	r2, #4
	mvnge	r2, r2, lsl #17
	movlt	r2, #512
	mvnge	r2, r2, lsr #17
	movge	r0, #384
	ldrge	r1, [r1, #8]
	strhge	r1, [r3, #24]	@ movhi
	ldr	r1, .L139+20
	strhge	r2, [r3, #26]	@ movhi
	strhlt	r2, [r3, #24]	@ movhi
	ldr	r2, [r1, #12]
	strhge	r0, [r3, #28]	@ movhi
	cmn	r2, #4
	mvnge	r2, r2, lsl #17
	movlt	r2, #512
	mvnge	r2, r2, lsr #17
	movge	r0, #512
	ldrge	r1, [r1, #8]
	strhge	r1, [r3, #32]	@ movhi
	ldr	r1, .L139+24
	strhge	r2, [r3, #34]	@ movhi
	strhlt	r2, [r3, #32]	@ movhi
	ldr	r2, [r1, #12]
	strhge	r0, [r3, #36]	@ movhi
	cmn	r2, #4
	mvnge	r2, r2, lsl #17
	movge	r0, #640
	mvnge	r2, r2, lsr #17
	movlt	r2, #512
	ldrge	r1, [r1, #8]
	strhge	r2, [r3, #42]	@ movhi
	strhge	r1, [r3, #40]	@ movhi
	strhge	r0, [r3, #44]	@ movhi
	strhlt	r2, [r3, #40]	@ movhi
	bx	lr
.L127:
	mov	r2, #512
	ldr	r3, .L139+4
	strh	r2, [r3]	@ movhi
	b	.L128
.L140:
	.align	2
.L139:
	.word	character_S1
	.word	shadowOAM
	.word	character_T
	.word	character_A
	.word	character_I
	.word	character_R
	.word	character_S2
	.size	drawTitle, .-drawTitle
	.align	2
	.global	drawStartGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawStartGame, %function
drawStartGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r1, .L155
	ldr	r2, [r1, #4]
	cmp	r2, #0
	push	{r4, lr}
	ble	.L142
	ldr	r3, [r1, #36]
	ldr	lr, [r1, #44]
	ldr	r0, [r1]
	ldr	ip, .L155+4
	add	r3, r3, #2
	ldr	r1, .L155+8
	add	r3, r3, lr, lsl #6
	lsl	r3, r3, #1
	orr	r0, r0, ip
	orr	r2, r2, ip
	strh	r3, [r1, #52]	@ movhi
	strh	r0, [r1, #48]	@ movhi
	strh	r2, [r1, #50]	@ movhi
.L142:
	bl	drawTitle
	ldr	r3, .L155+12
	ldr	r3, [r3, #52]
	cmp	r3, #0
	beq	.L143
	ldr	r3, .L155+16
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L143
	bl	drawHighlighter.part.1
	ldr	r3, .L155+20
	ldr	r3, [r3, #52]
	cmp	r3, #0
	bne	.L154
.L145:
	mov	r2, #512
	ldr	r3, .L155+24
	strh	r2, [r3]	@ movhi
.L146:
	ldr	r3, .L155+28
	mov	lr, pc
	bx	r3
	ldr	r4, .L155+32
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L155+8
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	ldr	r2, .L155+36
	ldrh	r1, [r2]
	ldr	r2, .L155+40
	ldrh	r2, [r2]
	strh	r1, [r3, #16]	@ movhi
	pop	{r4, lr}
	strh	r2, [r3, #18]	@ movhi
	bx	lr
.L143:
	mov	r2, #512
	ldr	r3, .L155+8
	strh	r2, [r3, #56]	@ movhi
	ldr	r3, .L155+20
	ldr	r3, [r3, #52]
	cmp	r3, #0
	beq	.L145
.L154:
	bl	drawButtonB.part.2
	b	.L146
.L156:
	.align	2
.L155:
	.word	player
	.word	-32768
	.word	shadowOAM
	.word	highlighter
	.word	isOnMenu
	.word	buttonB
	.word	shadowOAM+280
	.word	waitForVBlank
	.word	DMANow
	.word	SG_hOff
	.word	SG_vOff
	.size	drawStartGame, .-drawStartGame
	.align	2
	.global	movingScreen
	.syntax unified
	.arm
	.fpu softvfp
	.type	movingScreen, %function
movingScreen:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r1, .L163
	ldr	r0, [r1]
	ldr	r2, .L163+4
	cmp	r0, #0
	push	{r4, r5, lr}
	ldr	r3, [r2]
	beq	.L158
	mov	ip, #1
	ldr	r0, .L163+8
	cmp	r3, #0
	str	ip, [r0]
	ble	.L159
	ldr	r5, .L163+12
	sub	r3, r3, #5
	str	r3, [r2]
	ldr	r3, [r5, #12]
	ldr	r1, .L163+16
	ldr	r4, .L163+20
	add	r3, r3, #5
	ldr	r2, [r1, #12]
	str	r3, [r5, #12]
	ldr	r3, [r4, #12]
	ldr	lr, .L163+24
	ldr	ip, .L163+28
	ldr	r0, .L163+32
	add	r2, r2, #5
	add	r3, r3, #5
	str	r2, [r1, #12]
	str	r3, [r4, #12]
	ldr	r1, [lr, #12]
	ldr	r2, [ip, #12]
	ldr	r3, [r0, #12]
	add	r1, r1, #5
	add	r2, r2, #5
	add	r3, r3, #5
	str	r1, [lr, #12]
	str	r2, [ip, #12]
	str	r3, [r0, #12]
.L157:
	pop	{r4, r5, lr}
	bx	lr
.L159:
	mov	r3, #0
	pop	{r4, r5, lr}
	str	r3, [r1]
	str	r3, [r0]
	bx	lr
.L158:
	mov	lr, #1
	ldr	ip, .L163+8
	cmp	r3, #239
	str	lr, [ip]
	strgt	lr, [r1]
	strgt	r0, [ip]
	bgt	.L157
	ldr	r5, .L163+12
	add	r3, r3, #5
	str	r3, [r2]
	ldr	r3, [r5, #12]
	ldr	r1, .L163+16
	ldr	r4, .L163+20
	sub	r3, r3, #5
	ldr	r2, [r1, #12]
	str	r3, [r5, #12]
	ldr	r3, [r4, #12]
	ldr	lr, .L163+24
	ldr	ip, .L163+28
	ldr	r0, .L163+32
	sub	r2, r2, #5
	sub	r3, r3, #5
	str	r2, [r1, #12]
	str	r3, [r4, #12]
	ldr	r1, [lr, #12]
	ldr	r2, [ip, #12]
	ldr	r3, [r0, #12]
	sub	r1, r1, #5
	sub	r2, r2, #5
	sub	r3, r3, #5
	str	r1, [lr, #12]
	str	r2, [ip, #12]
	str	r3, [r0, #12]
	pop	{r4, r5, lr}
	bx	lr
.L164:
	.align	2
.L163:
	.word	isOnMenu
	.word	SG_hOff
	.word	goingOnMenu
	.word	character_S1
	.word	character_T
	.word	character_A
	.word	character_I
	.word	character_R
	.word	character_S2
	.size	movingScreen, .-movingScreen
	.comm	shadowOAM,1024,4
	.comm	menuOption,4,4
	.comm	goingOnMenu,4,4
	.comm	isOnMenu,4,4
	.comm	SG_hOff,4,4
	.comm	SG_vOff,4,4
	.comm	walkingSoundFlag,4,4
	.comm	buttonB,64,4
	.comm	highlighter,64,4
	.comm	character_S2,64,4
	.comm	character_R,64,4
	.comm	character_I,64,4
	.comm	character_A,64,4
	.comm	character_T,64,4
	.comm	character_S1,64,4
	.comm	player,64,4
	.comm	soundB,32,4
	.comm	soundA,32,4
	.ident	"GCC: (devkitARM release 50) 8.2.0"
