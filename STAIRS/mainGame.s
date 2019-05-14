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
	.file	"mainGame.c"
	.text
	.align	2
	.global	initMainGame
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initMainGame, %function
initMainGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L8
	ldr	r3, [r3]
	cmp	r3, #0
	movne	r2, #0
	ldrne	r3, .L8+4
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	strne	r2, [r3]
	mov	r3, #0
	mov	r0, #16
	mov	r4, #3
	mov	r10, #224
	mov	r9, #128
	mov	r8, #1
	mov	r7, #24
	mov	r6, #4
	ldr	r2, .L8+8
	mov	lr, #96
	str	r3, [r2]
	ldr	r2, .L8+12
	str	r3, [r2]
	ldr	r2, .L8+16
	mov	r5, #76
	str	r3, [r2]
	ldr	r2, .L8+20
	mov	r1, #32
	str	r3, [r2]
	mov	ip, #20
	ldr	r2, .L8+24
	str	r3, [r2]
	ldr	r2, .L8+28
	str	r3, [r2]
	ldr	r2, .L8+32
	str	r3, [r2]
	ldr	r2, .L8+36
	str	r3, [r2]
	ldr	r2, .L8+40
	str	r3, [r2]
	ldr	r2, .L8+44
	str	r3, [r2]
	ldr	r2, .L8+48
	str	r3, [r2]
	ldr	r2, .L8+52
	str	r3, [r2]
	ldr	r2, .L8+56
	str	r3, [r2]
	ldr	r2, .L8+60
	str	r3, [r2]
	ldr	r2, .L8+64
	str	r3, [r2]
	ldr	r2, .L8+68
	str	r9, [r2]
	str	r10, [r2, #8]
	str	r8, [r2, #16]
	str	r7, [r2, #28]
	str	r6, [r2, #36]
	str	r0, [r2, #12]
	str	r0, [r2, #4]
	str	r0, [r2, #24]
	str	r4, [r2, #20]
	str	r4, [r2, #48]
	str	r3, [r2, #32]
	str	r3, [r2, #44]
	ldr	r2, .L8+72
	str	lr, [r2]
	ldr	r2, .L8+76
	str	lr, [r2]
	ldr	r2, .L8+80
	ldr	r0, .L8+84
	str	r5, [r2]
	ldr	r2, .L8+88
	str	ip, [r0]
	str	ip, [r0, #4]
	str	r1, [r0, #24]
	str	r1, [r0, #28]
	str	r3, [r2, #8]
	str	r3, [r2, #12]
	str	r3, [r2]
	str	r3, [r2, #4]
	str	r1, [r2, #24]
	str	r1, [r2, #28]
	str	r3, [r2, #52]
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L9:
	.align	2
.L8:
	.word	isStartedGame
	.word	currentLevel
	.word	firstNum
	.word	secondNum
	.word	thirdNum
	.word	walkingSoundFlag
	.word	MG0_hOff
	.word	MG1_hOff
	.word	MG2_hOff
	.word	randSeed
	.word	diceNum
	.word	isRolling
	.word	isRolled
	.word	destRow
	.word	destCol
	.word	randGame
	.word	isAtDoor
	.word	player
	.word	MG0_vOff
	.word	MG2_vOff
	.word	MG1_vOff
	.word	dice
	.word	door
	.size	initMainGame, .-initMainGame
	.align	2
	.global	initMGPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	initMGPlayer, %function
initMGPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r2, #16
	mov	r6, #224
	mov	r5, #128
	mov	r4, #1
	mov	lr, #24
	mov	r0, #3
	mov	r1, #0
	mov	ip, #4
	ldr	r3, .L12
	str	r6, [r3, #8]
	str	r5, [r3]
	str	r4, [r3, #16]
	str	lr, [r3, #28]
	str	ip, [r3, #36]
	str	r2, [r3, #12]
	str	r2, [r3, #4]
	str	r2, [r3, #24]
	str	r0, [r3, #20]
	str	r0, [r3, #48]
	str	r1, [r3, #32]
	str	r1, [r3, #44]
	pop	{r4, r5, r6, lr}
	bx	lr
.L13:
	.align	2
.L12:
	.word	player
	.size	initMGPlayer, .-initMGPlayer
	.align	2
	.global	updateMGPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateMGPlayer, %function
updateMGPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #4
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r4, .L47
	ldr	r3, [r4, #32]
	add	r3, r3, #1
	cmp	r3, #10
	sub	sp, sp, #16
	str	r2, [r4, #36]
	strne	r3, [r4, #32]
	bne	.L16
	ldr	r3, [r4, #44]
	ldr	r2, [r4, #48]
	add	r3, r3, #1
	cmp	r3, r2
	moveq	r3, #0
	mov	r2, #0
	str	r3, [r4, #44]
	str	r2, [r4, #32]
.L16:
	ldr	r3, .L47+4
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L38
	ldr	r6, .L47+8
	ldr	r7, .L47+12
	ldr	r5, .L47+16
.L18:
	ldr	r3, [r7]
	ldr	r0, [r4, #8]
	ldr	r1, [r5, #8]
	ldr	ip, [r6]
	sub	r0, r0, r3
	sub	r1, r1, r3
	ldr	r2, [r4, #12]
	ldr	r3, [r5, #12]
	sub	r2, r2, ip
	sub	r3, r3, ip
	str	r0, [r4]
	str	r1, [r5]
	str	r2, [r4, #4]
	str	r3, [r5, #4]
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L38:
	ldr	r3, .L47+20
	ldrh	r2, [r3, #48]
	tst	r2, #32
	beq	.L19
	ldrh	r3, [r3, #48]
	tst	r3, #16
	bne	.L20
.L19:
	ldr	r3, .L47+20
	ldrh	r3, [r3, #48]
	ands	r3, r3, #32
	bne	.L43
	ldr	r1, [r4, #20]
	ldr	r2, [r4, #12]
	sub	r2, r2, r1
	cmp	r2, #15
	ble	.L23
	ldr	r0, .L47+24
	ldr	r3, [r0]
	cmp	r3, #0
	beq	.L45
.L24:
	mov	ip, #2
	ldr	r6, .L47+8
	ldr	r3, [r6]
	ldr	r0, [r4, #16]
	sub	r1, r3, r1
	ldr	r3, [r4, #8]
	cmp	r1, #0
	add	r3, r3, r0
	str	r2, [r4, #12]
	str	r3, [r4, #8]
	str	ip, [r4, #36]
	ble	.L42
	ldr	r3, [r4, #4]
	cmp	r3, #119
	ldr	r7, .L47+12
	bgt	.L22
	ldr	r3, [r7]
	ldr	lr, .L47+28
	ldr	ip, .L47+32
	add	r0, r3, r0
	ldr	r2, [lr]
	ldr	r3, [ip]
	sub	r2, r2, #2
	sub	r3, r3, #1
	str	r1, [r6]
	str	r0, [r7]
	str	r2, [lr]
	str	r3, [ip]
	b	.L22
.L23:
	ldr	r1, .L47+24
	ldr	r2, .L47+36
	str	r3, [r1]
	mov	lr, pc
	bx	r2
.L43:
	ldr	r6, .L47+8
.L42:
	ldr	r7, .L47+12
.L22:
	ldr	r3, .L47+20
	ldrh	r3, [r3, #48]
	ands	r3, r3, #16
	bne	.L44
	ldr	r1, .L47+40
	ldr	r0, [r4, #16]
	ldr	r2, [r4, #8]
	ldr	r1, [r1]
	sub	r2, r2, r0
	cmp	r2, r1
	ldr	r1, .L47+24
	blt	.L28
	ldr	r3, [r1]
	cmp	r3, #0
	beq	.L46
.L29:
	mov	lr, #1
	ldr	r3, [r4, #12]
	ldr	ip, [r4, #20]
	ldr	r1, [r4, #4]
	add	r3, r3, ip
	cmp	r1, #120
	str	r2, [r4, #8]
	str	r3, [r4, #12]
	str	lr, [r4, #36]
	ble	.L27
	ldr	r3, [r6]
	cmp	r3, #272
	bgt	.L27
	ldr	r5, .L47+28
	add	ip, ip, r3
	ldr	r3, [r5]
	ldr	lr, .L47+32
	add	r3, r3, #2
	ldr	r2, [lr]
	str	r3, [r5]
	ldr	r3, [r7]
	add	r2, r2, #1
	sub	r0, r3, r0
	str	ip, [r6]
	str	r2, [lr]
	str	r0, [r7]
	b	.L27
.L28:
	ldr	r2, .L47+36
	str	r3, [r1]
	mov	lr, pc
	bx	r2
.L44:
	ldr	r1, [r4, #4]
.L27:
	ldr	r5, .L47+16
	ldr	r0, [r5, #28]
	ldr	r2, [r5, #4]
	ldr	r3, [r5]
	ldr	ip, [r5, #24]
	ldr	r8, .L47+44
	str	r0, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	ldr	r2, [r4, #28]
	ldr	r3, [r4, #24]
	str	ip, [sp, #12]
	ldr	r0, [r4]
	mov	lr, pc
	bx	r8
	cmp	r0, #0
	movne	r2, #1
	ldrne	r3, .L47+48
	ldreq	r3, .L47+48
	strne	r2, [r3]
	streq	r0, [r3]
	b	.L18
.L20:
	ldr	r3, .L47+36
	mov	lr, pc
	bx	r3
	mov	r2, #0
	ldr	r3, .L47+24
	ldr	r1, [r4, #4]
	str	r2, [r3]
	ldr	r6, .L47+8
	ldr	r7, .L47+12
	b	.L27
.L45:
	mov	r5, #1
	ldr	r3, .L47+36
	str	r5, [r0]
	mov	lr, pc
	bx	r3
	mov	r3, r5
	ldr	r2, .L47+52
	ldr	r1, .L47+56
	ldr	r0, .L47+60
	ldr	r5, .L47+64
	mov	lr, pc
	bx	r5
	ldr	r1, [r4, #20]
	ldr	r2, [r4, #12]
	sub	r2, r2, r1
	b	.L24
.L46:
	mov	r5, #1
	ldr	r3, .L47+36
	str	r5, [r1]
	mov	lr, pc
	bx	r3
	mov	r3, r5
	ldr	r2, .L47+52
	ldr	r0, .L47+60
	ldr	r1, .L47+56
	ldr	r5, .L47+64
	mov	lr, pc
	bx	r5
	ldr	r0, [r4, #16]
	ldr	r2, [r4, #8]
	sub	r2, r2, r0
	b	.L29
.L48:
	.align	2
.L47:
	.word	player
	.word	isRolled
	.word	MG0_hOff
	.word	MG0_vOff
	.word	door
	.word	67109120
	.word	walkingSoundFlag
	.word	MG1_hOff
	.word	MG2_hOff
	.word	stopSoundB
	.word	destRow
	.word	collision
	.word	isAtDoor
	.word	11025
	.word	14663
	.word	walkingSound
	.word	playSoundB
	.size	updateMGPlayer, .-updateMGPlayer
	.align	2
	.global	drawMGPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawMGPlayer, %function
drawMGPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L51
	ldr	r3, [r2, #36]
	str	lr, [sp, #-4]!
	ldr	lr, [r2, #44]
	ldm	r2, {r0, r1}
	ldr	ip, .L51+4
	add	r3, r3, #2
	ldr	r2, .L51+8
	add	r3, r3, lr, lsl #6
	lsl	r3, r3, #1
	orr	r0, r0, ip
	orr	r1, r1, ip
	strh	r3, [r2, #52]	@ movhi
	strh	r0, [r2, #48]	@ movhi
	strh	r1, [r2, #50]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L52:
	.align	2
.L51:
	.word	player
	.word	-32768
	.word	shadowOAM
	.size	drawMGPlayer, .-drawMGPlayer
	.align	2
	.global	initDice
	.syntax unified
	.arm
	.fpu softvfp
	.type	initDice, %function
initDice:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r1, #20
	mov	r2, #32
	ldr	r3, .L54
	str	r1, [r3]
	str	r1, [r3, #4]
	str	r2, [r3, #24]
	str	r2, [r3, #28]
	bx	lr
.L55:
	.align	2
.L54:
	.word	dice
	.size	initDice, .-initDice
	.align	2
	.global	updateDice
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateDice, %function
updateDice:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r4, .L69
	ldr	r3, [r4]
	cmp	r3, #0
	bne	.L56
	ldr	r3, .L69+4
	ldrh	r3, [r3]
	tst	r3, #1
	beq	.L56
	ldr	r3, .L69+8
	ldrh	r3, [r3]
	ands	r5, r3, #1
	bne	.L56
	ldr	r6, .L69+12
	ldr	r7, [r6]
	cmp	r7, #0
	ldr	r3, .L69+16
	bne	.L58
	mov	lr, pc
	bx	r3
	ldr	r4, .L69+20
	mov	r3, r7
	ldr	r2, .L69+24
	mov	r1, #23040
	ldr	r0, .L69+28
	mov	lr, pc
	bx	r4
	mov	r3, #1
	str	r3, [r6]
.L56:
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L58:
	mov	lr, pc
	bx	r3
	mov	r3, r5
	ldr	r2, .L69+24
	mov	r1, #23040
	ldr	r0, .L69+28
	ldr	r5, .L69+20
	mov	lr, pc
	bx	r5
	ldr	r3, .L69+32
	ldr	r5, .L69+36
	ldr	r0, [r3]
	ldr	ip, [r5]
	ldr	r2, .L69+40
	add	r0, ip, r0
	smull	r3, r6, r0, r2
	ldr	r8, .L69+44
	mov	lr, #1
	smull	r2, r3, r8, r0
	asr	r1, r0, #31
	rsb	r2, r1, r6, asr #6
	rsb	r7, r2, r2, lsl #5
	add	r2, r2, r7, lsl #2
	ldr	r10, .L69+48
	sub	r2, r0, r2, lsl #3
	smull	r7, r6, r2, r8
	smull	r8, r7, r10, r0
	rsb	r3, r1, r3, asr #5
	add	r3, r3, r3, lsl #2
	add	r3, r3, r3, lsl #2
	sub	r3, r0, r3, lsl #2
	smull	r8, r9, r3, r10
	rsb	r1, r1, r7, asr #2
	ldr	r7, .L69+52
	add	r1, r1, r1, lsl #2
	sub	r1, r0, r1, lsl lr
	asr	r2, r2, #31
	add	r0, r7, #8
	rsb	r6, r2, r6, asr #5
	ldm	r0, {r0, r2}
	sub	r0, r0, ip, lsl #4
	add	ip, ip, ip, lsl lr
	add	ip, r2, ip, lsl #4
	asr	r3, r3, #31
	ldr	r2, .L69+56
	ldr	r8, .L69+60
	rsb	r3, r3, r9, asr #2
	str	r3, [r2]
	str	r6, [r8]
	ldr	r2, .L69+64
	ldr	r6, .L69+68
	ldr	r3, .L69+72
	ldr	r7, .L69+76
	str	ip, [r2]
	str	r1, [r6]
	sub	ip, ip, #8
	sub	r1, r0, #8
	ldr	r2, .L69+80
	str	ip, [r3, #12]
	str	r1, [r3, #8]
	str	lr, [r3, #52]
	str	r0, [r7]
	str	lr, [r4]
	mov	lr, pc
	bx	r2
	ldr	r3, [r5]
	ldr	r2, [r6]
	add	r3, r0, r3
	add	r3, r3, r2
	rsbs	r2, r3, #0
	and	r2, r2, #3
	and	r3, r3, #3
	rsbpl	r3, r2, #0
	cmp	r3, #3
	ldrls	pc, [pc, r3, asl #2]
	b	.L59
.L61:
	.word	.L64
	.word	.L63
	.word	.L62
	.word	.L60
.L60:
	mov	r2, #8
	ldr	r3, .L69+84
	str	r2, [r3]
	b	.L56
.L62:
	mov	r2, #7
	ldr	r3, .L69+84
	str	r2, [r3]
	b	.L56
.L63:
	mov	r2, #6
	ldr	r3, .L69+84
	str	r2, [r3]
	b	.L56
.L64:
	mov	r2, #5
	ldr	r3, .L69+84
	str	r2, [r3]
	b	.L56
.L59:
	ldr	r2, .L69+84
	str	r3, [r2]
	b	.L56
.L70:
	.align	2
.L69:
	.word	isRolled
	.word	oldButtons
	.word	buttons
	.word	isRolling
	.word	stopSoundB
	.word	playSoundB
	.word	11025
	.word	rollingDiceSound
	.word	currentLevel
	.word	diceNum
	.word	274877907
	.word	1374389535
	.word	1717986919
	.word	player
	.word	secondNum
	.word	firstNum
	.word	destCol
	.word	thirdNum
	.word	door
	.word	destRow
	.word	rand
	.word	randGame
	.size	updateDice, .-updateDice
	.align	2
	.global	updateMainGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateMainGame, %function
updateMainGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	bl	updateMGPlayer
	pop	{r4, lr}
	b	updateDice
	.size	updateMainGame, .-updateMainGame
	.align	2
	.global	drawDice
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawDice, %function
drawDice:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r1, .L87
	push	{r4, lr}
	ldr	lr, [r1, #4]
	mvn	r3, lr, lsl #17
	mvn	r3, r3, lsr #17
	ldr	r2, .L87+4
	ldr	r2, [r2]
	ldr	r0, .L87+8
	ldr	r4, .L87+12
	lsl	r3, r3, #16
	cmp	r2, #0
	lsr	r3, r3, #16
	ldrh	ip, [r1]
	ldr	r2, [r0]
	ldr	r4, [r4]
	beq	.L74
	cmp	r4, #0
	bne	.L75
	add	r2, r2, #1
	cmp	r2, #6
	bgt	.L86
	lsl	r4, r2, #23
	str	r2, [r0]
	add	r0, r4, #1835008
	lsr	r0, r0, #16
.L77:
	ldr	r2, .L87+16
	strh	ip, [r2, #64]	@ movhi
	strh	r3, [r2, #66]	@ movhi
	strh	r0, [r2, #68]	@ movhi
.L78:
	mov	r0, #924
	add	r2, r1, #24
	ldm	r2, {r2, r3}
	add	r3, r3, lr
	ldr	r1, .L87+20
	add	r3, r3, #3
	add	r2, ip, r2
	orr	r3, r3, #16384
	add	r2, r2, #2
	strh	r3, [r1, #2]	@ movhi
	strh	r2, [r1]	@ movhi
	strh	r0, [r1, #4]	@ movhi
.L73:
	pop	{r4, lr}
	bx	lr
.L74:
	ldr	r0, .L87+16
	lsl	r2, r2, #7
	add	r2, r2, #28
	cmp	r4, #0
	strh	r2, [r0, #68]	@ movhi
	strh	ip, [r0, #64]	@ movhi
	strh	r3, [r0, #66]	@ movhi
	beq	.L78
.L81:
	mov	r3, #512
	ldr	r2, .L87+24
	ldr	r2, [r2]
	ldr	r0, .L87+20
	cmp	r2, #0
	strh	r3, [r0]	@ movhi
	strheq	r3, [r0, #8]	@ movhi
	beq	.L73
	mov	r4, r0
	add	r2, r1, #24
	ldm	r2, {r2, r3}
	add	r2, ip, r2
	add	r2, r2, #2
	add	r3, r3, lr
	strh	r2, [r4, #8]!	@ movhi
	add	r3, r3, #3
	ldr	r2, .L87+28
	orr	r3, r3, #16384
	strh	r3, [r4, #2]	@ movhi
	strh	r2, [r0, #12]	@ movhi
	pop	{r4, lr}
	bx	lr
.L75:
	ldr	r0, .L87+16
	lsl	r2, r2, #7
	add	r2, r2, #28
	strh	r2, [r0, #68]	@ movhi
	strh	ip, [r0, #64]	@ movhi
	strh	r3, [r0, #66]	@ movhi
	b	.L81
.L86:
	mov	r2, #1
	str	r2, [r0]
	mov	r0, #156
	b	.L77
.L88:
	.align	2
.L87:
	.word	dice
	.word	isRolling
	.word	diceNum
	.word	isRolled
	.word	shadowOAM
	.word	shadowOAM+280
	.word	isAtDoor
	.word	926
	.size	drawDice, .-drawDice
	.align	2
	.global	initDoor
	.syntax unified
	.arm
	.fpu softvfp
	.type	initDoor, %function
initDoor:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #0
	mov	r1, #32
	ldr	r3, .L90
	str	r2, [r3, #8]
	str	r2, [r3, #12]
	str	r2, [r3]
	str	r2, [r3, #4]
	str	r2, [r3, #52]
	str	r1, [r3, #24]
	str	r1, [r3, #28]
	bx	lr
.L91:
	.align	2
.L90:
	.word	door
	.size	initDoor, .-initDoor
	.align	2
	.global	updateDoor
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateDoor, %function
updateDoor:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	bx	lr
	.size	updateDoor, .-updateDoor
	.align	2
	.global	drawDoor
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawDoor, %function
drawDoor:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L99
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L94
	ldr	r2, .L99+4
	ldr	r3, [r2]
	cmp	r3, #0
	blt	.L94
	ldr	r2, [r2, #4]
	cmp	r2, #240
	bgt	.L94
	mvn	r2, r2, lsl #17
	mov	r0, #916
	mvn	r2, r2, lsr #17
	ldr	r1, .L99+8
	add	r3, r3, #1
	strh	r2, [r1, #2]	@ movhi
	strh	r3, [r1]	@ movhi
	strh	r0, [r1, #4]	@ movhi
	bx	lr
.L94:
	mov	r2, #512
	ldr	r3, .L99+8
	strh	r2, [r3]	@ movhi
	bx	lr
.L100:
	.align	2
.L99:
	.word	isRolled
	.word	door
	.word	shadowOAM+296
	.size	drawDoor, .-drawDoor
	.global	__aeabi_idivmod
	.align	2
	.global	drawLevel
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawLevel, %function
drawLevel:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r0, .L116
	mov	r1, r0
	mov	r2, r0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	lr, .L116+4
	ldr	r3, [lr]
	add	r3, r3, #24
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	ldrh	ip, [lr, #4]
	ldr	lr, [lr, #8]
	strh	r3, [r1, #8]!	@ movhi
	strh	r3, [r2, #16]!	@ movhi
	add	r4, ip, #8
	strh	r3, [r0]	@ movhi
	cmp	lr, #209
	add	r3, ip, #16
	strh	ip, [r0, #2]	@ movhi
	strh	r4, [r1, #2]	@ movhi
	strh	r3, [r2, #2]	@ movhi
	ble	.L102
	ldr	r2, .L116+8
	ldr	r3, .L116+12
	ldr	ip, [r2]
	ldr	r7, .L116+16
	smull	r2, r1, ip, r3
	smull	r3, r2, r7, ip
	asr	lr, ip, #31
	rsb	r3, lr, r1, asr #6
	rsb	r1, r3, r3, lsl #5
	rsb	r2, lr, r2, asr #5
	add	r1, r3, r1, lsl #2
	ldr	r3, .L116+20
	add	r2, r2, r2, lsl #2
	smull	r4, r6, r3, ip
	add	r2, r2, r2, lsl #2
	sub	r2, ip, r2, lsl #2
	sub	r1, ip, r1, lsl #3
	smull	r5, r4, r1, r7
	smull	r7, r5, r3, r2
	rsb	lr, lr, r6, asr #2
	asr	r3, r2, #31
	asr	r1, r1, #31
	add	lr, lr, lr, lsl #2
	rsb	r2, r1, r4, asr #5
	rsb	r3, r3, r5, asr #2
	sub	ip, ip, lr, lsl #1
	lsl	r2, r2, #5
	lsl	r3, r3, #5
	lsl	ip, ip, #5
	add	r2, r2, #408
	add	r3, r3, #408
	add	ip, ip, #408
	add	r2, r2, #3
	add	r3, r3, #3
	add	ip, ip, #3
	strh	r2, [r0, #4]	@ movhi
	strh	r3, [r0, #12]	@ movhi
	strh	ip, [r0, #20]	@ movhi
.L101:
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L102:
	cmp	lr, #193
	ble	.L104
	ldr	r3, .L116+8
	ldr	r1, [r3]
	ldr	r2, .L116+12
	ldr	r6, .L116+16
	add	r1, r1, #1
.L113:
	smull	r3, lr, r1, r2
	smull	r2, r3, r6, r1
	asr	ip, r1, #31
	rsb	r2, ip, lr, asr #6
	ldr	r7, .L116+20
	rsb	r3, ip, r3, asr #5
	rsb	r4, r2, r2, lsl #5
	add	r3, r3, r3, lsl #2
	smull	lr, r5, r7, r1
	add	r2, r2, r4, lsl #2
	add	r3, r3, r3, lsl #2
	sub	r2, r1, r2, lsl #3
	sub	r3, r1, r3, lsl #2
	smull	r4, lr, r2, r6
	smull	r6, r4, r3, r7
	rsb	ip, ip, r5, asr #2
	asr	r2, r2, #31
	asr	r3, r3, #31
	add	ip, ip, ip, lsl #2
	rsb	r2, r2, lr, asr #5
	rsb	r3, r3, r4, asr #2
	sub	r1, r1, ip, lsl #1
	lsl	r2, r2, #5
	lsl	r3, r3, #5
	lsl	r1, r1, #5
	add	r2, r2, #408
	add	r3, r3, #408
	add	r1, r1, #408
	add	r2, r2, #3
	add	r3, r3, #3
	add	r1, r1, #3
	strh	r2, [r0, #4]	@ movhi
	strh	r3, [r0, #12]	@ movhi
	strh	r1, [r0, #20]	@ movhi
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L104:
	cmp	lr, #177
	bgt	.L114
	cmp	lr, #161
	ble	.L106
	ldr	r3, .L116+8
	ldr	r1, [r3]
	ldr	r2, .L116+12
	ldr	r6, .L116+16
	add	r1, r1, #3
	b	.L113
.L114:
	ldr	r3, .L116+8
	ldr	r1, [r3]
	ldr	r2, .L116+12
	ldr	r6, .L116+16
	add	r1, r1, #2
	b	.L113
.L106:
	cmp	lr, #145
	bgt	.L115
	cmp	lr, #129
	ble	.L108
	ldr	r3, .L116+8
	ldr	r1, [r3]
	ldr	r2, .L116+12
	ldr	r6, .L116+16
	add	r1, r1, #5
	b	.L113
.L115:
	ldr	r3, .L116+8
	ldr	r1, [r3]
	ldr	r2, .L116+12
	ldr	r6, .L116+16
	add	r1, r1, #4
	b	.L113
.L108:
	cmp	lr, #113
	ble	.L109
	ldr	r3, .L116+8
	ldr	r1, [r3]
	ldr	r2, .L116+12
	ldr	r6, .L116+16
	add	r1, r1, #6
	b	.L113
.L109:
	cmp	lr, #81
	ble	.L110
	ldr	r3, .L116+8
	ldr	r1, [r3]
	ldr	r2, .L116+12
	ldr	r6, .L116+16
	add	r1, r1, #8
	b	.L113
.L110:
	cmp	lr, #65
	ble	.L111
	ldr	r3, .L116+8
	ldr	r1, [r3]
	ldr	r2, .L116+12
	ldr	r6, .L116+16
	add	r1, r1, #9
	b	.L113
.L111:
	cmp	lr, #49
	ble	.L101
	ldr	r3, .L116+8
	ldr	r3, [r3]
	add	r4, r3, #10
	mov	r0, r4
	ldr	r3, .L116+24
	mov	r1, #1000
	mov	lr, pc
	bx	r3
	mov	r0, #100
	ldr	r5, .L116+16
	smull	r6, r7, r4, r5
	mov	r8, #10
	ldr	lr, .L116+20
	asr	r3, r4, #31
	rsb	ip, r3, r7, asr #5
	smull	r6, r7, r4, lr
	mul	r2, r0, ip
	ldr	ip, .L116+28
	mov	r0, ip
	rsb	r6, r3, r7, asr #2
	mul	r3, r8, r6
	smull	r8, r9, r1, r5
	sub	r2, r4, r2
	smull	r6, r7, r2, lr
	asr	r1, r1, #31
	rsb	r1, r1, r9, asr #5
	lsl	r1, r1, #5
	asr	r2, r2, #31
	sub	r3, r4, r3
	add	r1, r1, #408
	rsb	r2, r2, r7, asr #2
	lsl	r3, r3, #5
	add	r1, r1, #3
	lsl	r2, r2, #5
	add	r3, r3, #408
	strh	r1, [r0], #8	@ movhi
	add	r2, r2, #408
	add	r3, r3, #3
	add	r2, r2, #3
	strh	r3, [ip, #16]	@ movhi
	strh	r2, [r0]	@ movhi
	b	.L101
.L117:
	.align	2
.L116:
	.word	shadowOAM+304
	.word	player
	.word	currentLevel
	.word	274877907
	.word	1374389535
	.word	1717986919
	.word	__aeabi_idivmod
	.word	shadowOAM+308
	.size	drawLevel, .-drawLevel
	.align	2
	.global	drawMainGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawMainGame, %function
drawMainGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L126
	ldr	r3, [r2, #36]
	ldr	r0, [r2, #44]
	push	{r4, r5, r6, lr}
	ldm	r2, {r1, r2}
	ldr	r5, .L126+4
	add	r3, r3, #2
	ldr	r4, .L126+8
	add	r3, r3, r0, lsl #6
	lsl	r3, r3, #1
	orr	r1, r1, r5
	orr	r2, r2, r5
	strh	r3, [r4, #52]	@ movhi
	strh	r1, [r4, #48]	@ movhi
	strh	r2, [r4, #50]	@ movhi
	bl	drawDice
	ldr	r3, .L126+12
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L119
	ldr	r2, .L126+16
	ldr	r3, [r2]
	cmp	r3, #0
	blt	.L119
	ldr	r2, [r2, #4]
	cmp	r2, #240
	ble	.L125
.L119:
	mov	r2, #512
	ldr	r3, .L126+20
	strh	r2, [r3]	@ movhi
.L120:
	bl	drawLevel
	ldr	r3, .L126+24
	mov	lr, pc
	bx	r3
	ldr	r4, .L126+28
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L126+8
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	ldr	r2, .L126+32
	ldrh	r1, [r2]
	ldr	r2, .L126+36
	strh	r1, [r3, #16]	@ movhi
	ldrh	r1, [r2]
	ldr	r2, .L126+40
	strh	r1, [r3, #18]	@ movhi
	ldrh	r1, [r2]
	ldr	r2, .L126+44
	strh	r1, [r3, #20]	@ movhi
	ldrh	r1, [r2]
	ldr	r2, .L126+48
	strh	r1, [r3, #22]	@ movhi
	ldrh	r1, [r2]
	ldr	r2, .L126+52
	ldrh	r2, [r2]
	strh	r1, [r3, #24]	@ movhi
	pop	{r4, r5, r6, lr}
	strh	r2, [r3, #26]	@ movhi
	bx	lr
.L125:
	mov	r1, #916
	orr	r5, r2, r5
	add	r3, r3, #1
	add	r2, r4, #296
	add	r4, r4, #300
	strh	r3, [r2]	@ movhi
	strh	r5, [r2, #2]	@ movhi
	strh	r1, [r4]	@ movhi
	b	.L120
.L127:
	.align	2
.L126:
	.word	player
	.word	-32768
	.word	shadowOAM
	.word	isRolled
	.word	door
	.word	shadowOAM+296
	.word	waitForVBlank
	.word	DMANow
	.word	MG0_hOff
	.word	MG0_vOff
	.word	MG1_hOff
	.word	MG1_vOff
	.word	MG2_hOff
	.word	MG2_vOff
	.size	drawMainGame, .-drawMainGame
	.comm	butt3donB,64,4
	.comm	currentLevel,4,4
	.comm	isAtDoor,4,4
	.comm	randGame,4,4
	.comm	amountOfMove,4,4
	.comm	isRolled,4,4
	.comm	isRolling,4,4
	.comm	diceNum,4,4
	.comm	door,64,4
	.comm	buttonB,64,4
	.comm	buttonA,64,4
	.comm	dice,64,4
	.comm	player,64,4
	.comm	shadowOAM,1024,4
	.comm	walkingSoundFlag,4,4
	.comm	thirdNum,4,4
	.comm	secondNum,4,4
	.comm	firstNum,4,4
	.comm	destCol,4,4
	.comm	destRow,4,4
	.comm	randSeed,4,4
	.comm	MG2_vOff,4,4
	.comm	MG2_hOff,4,4
	.comm	MG1_vOff,4,4
	.comm	MG1_hOff,4,4
	.comm	MG0_vOff,4,4
	.comm	MG0_hOff,4,4
	.comm	soundB,32,4
	.comm	soundA,32,4
	.ident	"GCC: (devkitARM release 50) 8.2.0"
