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
	.file	"RPSGame.c"
	.text
	.align	2
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateRPSEnemy.part.0, %function
updateRPSEnemy.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r1, #0
	ldr	r2, .L4
	ldr	r3, [r2, #44]
	ldr	r0, [r2, #48]
	add	r3, r3, #1
	cmp	r3, r0
	moveq	r3, r1
	str	r1, [r2, #32]
	str	r3, [r2, #44]
	bx	lr
.L5:
	.align	2
.L4:
	.word	enemy
	.size	updateRPSEnemy.part.0, .-updateRPSEnemy.part.0
	.align	2
	.global	initRPSPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	initRPSPlayer, %function
initRPSPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r0, #100
	mov	r6, #2
	mov	r5, #16
	mov	r4, #24
	mov	lr, #4
	mov	r1, #20
	mov	r2, #0
	mov	ip, #3
	ldr	r3, .L8
	str	r6, [r3, #20]
	str	r5, [r3, #24]
	str	r4, [r3, #28]
	str	lr, [r3, #36]
	str	r0, [r3, #8]
	str	r0, [r3]
	str	ip, [r3, #48]
	str	r1, [r3, #12]
	str	r1, [r3, #4]
	str	r2, [r3, #32]
	str	r2, [r3, #44]
	pop	{r4, r5, r6, lr}
	bx	lr
.L9:
	.align	2
.L8:
	.word	player
	.size	initRPSPlayer, .-initRPSPlayer
	.align	2
	.global	updateRPSPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateRPSPlayer, %function
updateRPSPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r1, #4
	ldr	r3, .L14
	ldr	r2, [r3, #32]
	add	r2, r2, #1
	cmp	r2, #10
	str	r1, [r3, #36]
	strne	r2, [r3, #32]
	bne	.L12
	ldr	r2, [r3, #44]
	ldr	r1, [r3, #48]
	add	r2, r2, #1
	cmp	r2, r1
	moveq	r2, #0
	mov	r1, #0
	str	r2, [r3, #44]
	str	r1, [r3, #32]
.L12:
	ldr	r2, .L14+4
	ldr	r0, .L14+8
	ldr	ip, [r2]
	ldr	r1, [r3, #12]
	ldr	r2, [r0, #12]
	sub	r1, r1, ip
	sub	r2, r2, ip
	str	r1, [r3, #4]
	str	r2, [r0, #4]
	bx	lr
.L15:
	.align	2
.L14:
	.word	player
	.word	RPS0_hOff
	.word	enemy
	.size	updateRPSPlayer, .-updateRPSPlayer
	.align	2
	.global	drawRPSPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawRPSPlayer, %function
drawRPSPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L18
	ldr	r3, [r2, #36]
	str	lr, [sp, #-4]!
	ldr	lr, [r2, #44]
	ldm	r2, {r0, r1}
	ldr	ip, .L18+4
	add	r3, r3, #2
	ldr	r2, .L18+8
	add	r3, r3, lr, lsl #6
	lsl	r3, r3, #1
	orr	r0, r0, ip
	orr	r1, r1, ip
	strh	r3, [r2, #52]	@ movhi
	strh	r0, [r2, #48]	@ movhi
	strh	r1, [r2, #50]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L19:
	.align	2
.L18:
	.word	player
	.word	-32768
	.word	shadowOAM
	.size	drawRPSPlayer, .-drawRPSPlayer
	.align	2
	.global	initRPSEnemy
	.syntax unified
	.arm
	.fpu softvfp
	.type	initRPSEnemy, %function
initRPSEnemy:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #62
	str	lr, [sp, #-4]!
	mov	r2, #0
	mov	lr, #24
	mov	ip, #32
	mov	r0, #4
	ldr	r3, .L22
	str	r1, [r3, #8]
	str	r1, [r3]
	add	r1, r1, #388
	str	lr, [r3, #24]
	str	ip, [r3, #28]
	str	r0, [r3, #48]
	str	r1, [r3, #12]
	str	r1, [r3, #4]
	str	r2, [r3, #32]
	str	r2, [r3, #36]
	str	r2, [r3, #44]
	ldr	lr, [sp], #4
	bx	lr
.L23:
	.align	2
.L22:
	.word	enemy
	.size	initRPSEnemy, .-initRPSEnemy
	.align	2
	.global	updateRPSEnemy
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateRPSEnemy, %function
updateRPSEnemy:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L26
	ldr	r3, [r2, #32]
	add	r3, r3, #1
	cmp	r3, #20
	str	r3, [r2, #32]
	bxne	lr
	b	updateRPSEnemy.part.0
.L27:
	.align	2
.L26:
	.word	enemy
	.size	updateRPSEnemy, .-updateRPSEnemy
	.align	2
	.global	drawRPSEnemy
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawRPSEnemy, %function
drawRPSEnemy:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r1, .L30
	ldr	r3, [r1, #4]
	cmp	r3, #240
	bxgt	lr
	mvn	r3, r3, lsl #17
	mvn	r3, r3, lsr #17
	ldr	r0, [r1, #44]
	ldr	r2, [r1, #36]
	add	r2, r2, r0, lsl #5
	ldr	r1, [r1]
	ldr	r0, .L30+4
	add	r2, r2, #97
	lsl	r2, r2, #2
	strh	r3, [r0, #74]	@ movhi
	strh	r1, [r0, #72]	@ movhi
	strh	r2, [r0, #76]	@ movhi
	bx	lr
.L31:
	.align	2
.L30:
	.word	enemy
	.word	shadowOAM
	.size	drawRPSEnemy, .-drawRPSEnemy
	.align	2
	.global	initRPSGameState
	.syntax unified
	.arm
	.fpu softvfp
	.type	initRPSGameState, %function
initRPSGameState:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	mov	r3, #32
	mov	r5, #0
	ldr	r2, .L34
	ldm	r2, {r1, r2}
	ldr	lr, .L34+4
	add	r0, r2, #82
	ldr	r4, .L34+8
	ldr	ip, .L34+12
	str	r0, [lr, #4]
	ldr	r0, .L34+16
	sub	r1, r1, #50
	str	r1, [r4]
	str	r1, [lr]
	str	r1, [ip]
	str	r1, [r0]
	add	r1, r2, #114
	str	r1, [ip, #4]
	ldr	r1, .L34+20
	add	r2, r2, #50
	str	r2, [r4, #4]
	str	r3, [r4, #24]
	str	r3, [r4, #28]
	str	r3, [lr, #24]
	str	r3, [lr, #28]
	str	r5, [r1]
	str	r2, [r0, #4]
	str	r3, [ip, #24]
	str	r3, [ip, #28]
	str	r3, [r0, #24]
	str	r3, [r0, #28]
	pop	{r4, r5, lr}
	bx	lr
.L35:
	.align	2
.L34:
	.word	player
	.word	playerPaper
	.word	playerRock
	.word	playerScissors
	.word	playerPick
	.word	playerWeapon
	.size	initRPSGameState, .-initRPSGameState
	.align	2
	.global	initRPSGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	initRPSGame, %function
initRPSGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r10, #90
	mov	r2, #0
	mov	r4, #100
	mov	lr, #20
	mov	r0, #4
	mov	r9, #2
	mov	r8, #16
	mov	r7, #3
	mov	ip, #24
	mov	r6, #32
	mov	r1, #62
	mov	r5, #80
	ldr	r3, .L38
	str	r10, [r3]
	ldr	r3, .L38+4
	str	r2, [r3]
	ldr	r3, .L38+8
	str	r2, [r3]
	ldr	r3, .L38+12
	str	r2, [r3]
	ldr	r3, .L38+16
	str	r2, [r3]
	ldr	r3, .L38+20
	str	r2, [r3, #32]
	str	r2, [r3, #44]
	str	r0, [r3, #36]
	str	r8, [r3, #24]
	str	r7, [r3, #48]
	str	r4, [r3, #8]
	str	r4, [r3]
	str	lr, [r3, #12]
	str	lr, [r3, #4]
	str	ip, [r3, #28]
	str	r9, [r3, #20]
	ldr	r3, .L38+24
	str	r2, [r3, #32]
	str	r2, [r3, #36]
	str	r2, [r3, #44]
	str	r0, [r3, #48]
	ldr	r2, .L38+28
	ldr	r0, .L38+32
	str	ip, [r3, #24]
	str	r6, [r3, #28]
	str	r1, [r3, #8]
	str	r1, [r3]
	str	r2, [r3, #12]
	str	r2, [r3, #4]
	str	r5, [r0]
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	b	initRPSGameState
.L39:
	.align	2
.L38:
	.word	RPS0_vOff
	.word	RPS0_hOff
	.word	RPS1_hOff
	.word	RPSGameState
	.word	walkingSoundFlag
	.word	player
	.word	enemy
	.word	450
	.word	RPS1_vOff
	.size	initRPSGame, .-initRPSGame
	.align	2
	.global	updateNOTREADY
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateNOTREADY, %function
updateNOTREADY:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #4
	ldr	r3, .L66
	ldrh	r1, [r3, #48]
	push	{r4, r5, r6, lr}
	ldr	r4, .L66+4
	tst	r1, #32
	str	r2, [r4, #36]
	beq	.L41
	ldrh	r3, [r3, #48]
	tst	r3, #16
	bne	.L42
.L41:
	ldr	r3, .L66
	ldrh	r3, [r3, #48]
	ands	r3, r3, #32
	ldr	r2, [r4, #12]
	bne	.L43
	ldr	r1, [r4, #20]
	subs	r2, r2, r1
	bmi	.L44
	mov	r3, #2
	ldr	r0, .L66+8
	ldr	ip, [r0]
	cmp	ip, #0
	str	r3, [r4, #36]
	beq	.L62
.L45:
	ldr	r3, [r4, #4]
	cmp	r3, #120
	str	r2, [r4, #12]
	bgt	.L43
	ldr	ip, .L66+12
	ldr	lr, .L66+16
	ldr	r0, [ip, #4]
	ldr	r3, [lr]
	add	r0, r0, #1
	subs	r1, r3, r1
	str	r0, [ip, #4]
	bmi	.L43
	ldr	r0, .L66+20
	ldr	r3, [r0]
	sub	r3, r3, #1
	str	r1, [lr]
	str	r3, [r0]
.L43:
	ldr	r3, .L66
	ldrh	r3, [r3, #48]
	ands	r3, r3, #16
	bne	.L46
.L65:
	add	r0, r4, #20
	ldm	r0, {r0, r1}
	sub	r1, r1, #1
	add	r1, r1, r2
	ldr	ip, .L66+24
	add	r1, r1, r0
	cmp	r1, ip
	bgt	.L47
	mov	r5, #1
	ldr	r3, .L66+8
	ldr	r1, [r3]
	cmp	r1, #0
	str	r5, [r4, #36]
	beq	.L63
.L48:
	ldr	r3, [r4, #4]
	add	r2, r2, r0
	cmp	r3, #120
	str	r2, [r4, #12]
	ble	.L49
.L51:
	ldr	ip, .L66+16
	ldr	r1, [ip]
	add	r3, r1, #240
	add	r3, r3, r0
	cmp	r3, #512
	bgt	.L46
	ldr	lr, .L66+20
	ldr	r3, [lr]
	add	r0, r1, r0
	add	r3, r3, #1
	str	r0, [ip]
	str	r3, [lr]
.L46:
	cmp	r2, #420
	ble	.L52
.L64:
	mov	ip, #924
	ldr	r3, .L66+28
	ldr	r0, [r4, #4]
	ldrh	lr, [r3]
	ldr	r1, [r4]
	ldr	r3, .L66+32
	sub	r2, r0, #16
	sub	r1, r1, #16
	orr	r2, r2, #16384
	tst	lr, #1
	strh	r1, [r3]	@ movhi
	strh	r2, [r3, #2]	@ movhi
	strh	ip, [r3, #4]	@ movhi
	beq	.L40
	ldr	r3, .L66+36
	ldrh	r3, [r3]
	tst	r3, #1
	bne	.L40
	ldr	r3, .L66+40
	mov	lr, pc
	bx	r3
	mov	r3, #1
	ldr	r1, .L66+44
	ldr	r2, .L66+12
	str	r3, [r1]
	str	r3, [r2, #36]
	b	.L40
.L52:
	mov	r2, #512
	ldr	r3, .L66+32
	strh	r2, [r3]	@ movhi
.L40:
	pop	{r4, r5, r6, lr}
	bx	lr
.L42:
	mov	r1, #0
	ldr	r2, .L66+8
	ldr	r3, .L66+48
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	ldr	r2, [r4, #12]
	cmp	r2, #420
	ble	.L52
	b	.L64
.L49:
	ldr	r1, .L66+12
	ldr	r3, [r1, #4]
	sub	r3, r3, #1
	str	r3, [r1, #4]
	beq	.L51
	cmp	r2, #420
	ble	.L52
	b	.L64
.L63:
	ldr	r2, .L66+48
	str	r5, [r3]
	mov	lr, pc
	bx	r2
	mov	r3, r5
	ldr	r2, .L66+52
	ldr	r0, .L66+56
	ldr	r1, .L66+60
	ldr	r5, .L66+64
	mov	lr, pc
	bx	r5
	ldr	r2, [r4, #12]
	ldr	r0, [r4, #20]
	b	.L48
.L47:
	ldr	r1, .L66+8
	ldr	r2, .L66+48
	str	r3, [r1]
	mov	lr, pc
	bx	r2
	ldr	r2, [r4, #12]
	cmp	r2, #420
	ble	.L52
	b	.L64
.L44:
	ldr	r1, .L66+8
	ldr	r2, .L66+48
	str	r3, [r1]
	mov	lr, pc
	bx	r2
	ldr	r3, .L66
	ldrh	r3, [r3, #48]
	ands	r3, r3, #16
	ldr	r2, [r4, #12]
	bne	.L46
	b	.L65
.L62:
	mov	r5, #1
	ldr	r3, .L66+48
	str	r5, [r0]
	mov	lr, pc
	bx	r3
	mov	r3, r5
	ldr	r2, .L66+52
	ldr	r1, .L66+60
	ldr	r0, .L66+56
	ldr	r5, .L66+64
	mov	lr, pc
	bx	r5
	ldr	r1, [r4, #20]
	ldr	r2, [r4, #12]
	sub	r2, r2, r1
	b	.L45
.L67:
	.align	2
.L66:
	.word	67109120
	.word	player
	.word	walkingSoundFlag
	.word	enemy
	.word	RPS0_hOff
	.word	RPS1_hOff
	.word	449
	.word	oldButtons
	.word	shadowOAM+280
	.word	buttons
	.word	srand
	.word	RPSGameState
	.word	stopSoundB
	.word	11025
	.word	walkingSound
	.word	14663
	.word	playSoundB
	.size	updateNOTREADY, .-updateNOTREADY
	.align	2
	.global	updateREADY
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateREADY, %function
updateREADY:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r4, .L94
	ldrh	r2, [r4]
	tst	r2, #32
	beq	.L69
	ldr	r3, .L94+4
	ldrh	r3, [r3]
	ands	r5, r3, #32
	beq	.L90
.L69:
	tst	r2, #16
	beq	.L70
	ldr	r3, .L94+4
	ldrh	r3, [r3]
	ands	r5, r3, #16
	beq	.L91
.L70:
	tst	r2, #1
	beq	.L68
	ldr	r3, .L94+4
	ldrh	r3, [r3]
	tst	r3, #1
	beq	.L92
.L68:
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L91:
	ldr	r6, .L94+8
	ldr	r3, [r6]
	cmp	r3, #1
	bgt	.L70
	ldr	r3, .L94+12
	mov	lr, pc
	bx	r3
	mov	r3, r5
	ldr	r2, .L94+16
	ldr	r1, .L94+20
	ldr	r0, .L94+24
	ldr	r5, .L94+28
	mov	lr, pc
	bx	r5
	ldr	r0, .L94+32
	ldr	r3, [r6]
	ldr	r1, [r0, #4]
	add	r3, r3, #1
	add	r1, r1, #32
	ldrh	r2, [r4]
	str	r1, [r0, #4]
	str	r3, [r6]
	b	.L70
.L90:
	ldr	r6, .L94+8
	ldr	r3, [r6]
	cmp	r3, #0
	ble	.L69
	ldr	r3, .L94+12
	mov	lr, pc
	bx	r3
	mov	r3, r5
	ldr	r2, .L94+16
	ldr	r1, .L94+20
	ldr	r0, .L94+24
	ldr	r5, .L94+28
	mov	lr, pc
	bx	r5
	ldr	r1, .L94+32
	ldr	r3, [r6]
	ldr	r2, [r1, #4]
	sub	r3, r3, #1
	sub	r2, r2, #32
	str	r2, [r1, #4]
	str	r3, [r6]
	ldrh	r2, [r4]
	b	.L69
.L92:
	ldr	r3, .L94+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L94+36
	mov	lr, pc
	bx	r3
	ldr	r3, .L94+40
	ldr	r3, [r3, #12]
	mul	r2, r3, r0
	ldr	r4, .L94+44
	smull	r3, r1, r2, r4
	ldr	r7, .L94+8
	sub	r4, r1, r2, asr #31
	ldr	r5, [r7]
	add	r4, r4, r4, lsl #1
	ldr	r6, .L94+48
	sub	r4, r2, r4
	cmp	r5, #0
	str	r4, [r6]
	bne	.L74
	cmp	r4, #1
	beq	.L75
	cmp	r4, #2
	beq	.L76
	cmp	r4, #0
	bne	.L68
	mov	r3, r5
	ldr	r2, .L94+16
	ldr	r1, .L94+52
	ldr	r0, .L94+56
	ldr	r4, .L94+28
	mov	lr, pc
	bx	r4
	ldr	r2, .L94+60
	ldr	r3, [r2, #4]
	add	r3, r3, #64
	mvn	r3, r3, lsl #17
	mvn	r3, r3, lsr #17
	mov	r0, #920
	ldr	lr, [r2]
	ldr	r1, [r6]
	ldr	r2, .L94+64
	add	r1, r1, #224
	ldr	ip, .L94+68
	strh	r3, [r2, #114]	@ movhi
	ldr	r3, .L94+72
	lsl	r1, r1, #2
	strh	lr, [r2, #112]	@ movhi
	strh	ip, [r2, #120]	@ movhi
	strh	r3, [r2, #122]	@ movhi
	strh	r0, [r2, #124]	@ movhi
	strh	r1, [r2, #116]	@ movhi
	ldr	r5, [r7]
.L74:
	cmp	r5, #1
	beq	.L93
.L77:
	cmp	r5, #2
	bne	.L68
	ldr	r4, [r6]
	cmp	r4, #1
	beq	.L80
	cmp	r4, #2
	beq	.L81
	cmp	r4, #0
	bne	.L68
	mov	r3, r4
	ldr	r2, .L94+16
	ldr	r1, .L94+76
	ldr	r0, .L94+80
.L89:
	ldr	r6, .L94+28
	mov	lr, pc
	bx	r6
	ldr	r2, .L94+84
	ldr	r3, .L94+88
	str	r4, [r2]
	str	r5, [r3]
	b	.L68
.L93:
	ldr	r4, [r6]
	cmp	r4, #1
	beq	.L78
	cmp	r4, #2
	beq	.L79
	cmp	r4, #0
	bne	.L68
	mov	r3, r4
	ldr	r2, .L94+16
	ldr	r1, .L94+92
	ldr	r0, .L94+96
	ldr	r4, .L94+28
	mov	lr, pc
	bx	r4
	mov	r2, #2
	ldr	r1, .L94+84
	ldr	r3, .L94+88
	str	r5, [r1]
	str	r2, [r3]
	ldr	r5, [r7]
	b	.L77
.L79:
	mov	r3, #0
	ldr	r2, .L94+16
	ldr	r1, .L94+76
	ldr	r5, .L94+28
	ldr	r0, .L94+80
	mov	lr, pc
	bx	r5
	mov	r1, #0
	ldr	r2, .L94+84
	ldr	r3, .L94+88
	ldr	r5, [r7]
	str	r1, [r2]
	str	r4, [r3]
	b	.L77
.L81:
	mov	r3, #0
	ldr	r2, .L94+16
	ldr	r1, .L94+52
	ldr	r0, .L94+56
	ldr	r4, .L94+28
	mov	lr, pc
	bx	r4
	ldr	r0, .L94+60
	ldr	r3, [r0, #4]
	add	r3, r3, #64
	mvn	r3, r3, lsl #17
	mov	ip, #920
	mvn	r3, r3, lsr #17
	ldr	r1, [r6]
	ldr	r2, .L94+64
	add	r1, r1, #224
	ldr	r4, .L94+68
	ldr	r0, [r0]
	ldr	lr, .L94+72
	lsl	r1, r1, #2
	strh	r1, [r2, #116]	@ movhi
	strh	r4, [r2, #120]	@ movhi
	strh	lr, [r2, #122]	@ movhi
	strh	ip, [r2, #124]	@ movhi
	strh	r0, [r2, #112]	@ movhi
	strh	r3, [r2, #114]	@ movhi
	b	.L68
.L78:
	mov	r3, #0
	ldr	r2, .L94+16
	ldr	r1, .L94+52
	ldr	r0, .L94+56
	ldr	r4, .L94+28
	mov	lr, pc
	bx	r4
	ldr	r2, .L94+60
	ldr	r3, [r2, #4]
	add	r3, r3, #64
	mvn	r3, r3, lsl #17
	mvn	r3, r3, lsr #17
	mov	r0, #920
	ldr	lr, [r2]
	ldr	r1, [r6]
	ldr	r2, .L94+64
	add	r1, r1, #224
	ldr	ip, .L94+68
	strh	r3, [r2, #114]	@ movhi
	ldr	r3, .L94+72
	lsl	r1, r1, #2
	ldr	r5, [r7]
	strh	lr, [r2, #112]	@ movhi
	strh	ip, [r2, #120]	@ movhi
	strh	r3, [r2, #122]	@ movhi
	strh	r0, [r2, #124]	@ movhi
	strh	r1, [r2, #116]	@ movhi
	b	.L77
.L80:
	mov	r3, #0
	ldr	r2, .L94+16
	ldr	r1, .L94+92
	ldr	r0, .L94+96
	b	.L89
.L76:
	mov	r3, r5
	ldr	r2, .L94+16
	ldr	r1, .L94+92
	ldr	r5, .L94+28
	ldr	r0, .L94+96
	mov	lr, pc
	bx	r5
	mov	r1, #1
	ldr	r2, .L94+84
	ldr	r3, .L94+88
	str	r1, [r2]
	str	r4, [r3]
	ldr	r5, [r7]
	b	.L74
.L75:
	mov	r3, r5
	ldr	r2, .L94+16
	ldr	r1, .L94+76
	ldr	r0, .L94+80
	ldr	r4, .L94+28
	mov	lr, pc
	bx	r4
	mov	r2, #2
	ldr	r1, .L94+84
	ldr	r3, .L94+88
	str	r5, [r1]
	str	r2, [r3]
	ldr	r5, [r7]
	b	.L74
.L95:
	.align	2
.L94:
	.word	oldButtons
	.word	buttons
	.word	playerWeapon
	.word	stopSoundB
	.word	11025
	.word	1314
	.word	choosingSound
	.word	playSoundB
	.word	playerPick
	.word	rand
	.word	player
	.word	1431655766
	.word	enemyWeapon
	.word	14865
	.word	RPSDrawSound
	.word	playerScissors
	.word	shadowOAM
	.word	16399
	.word	-32663
	.word	40896
	.word	RPSLoseSound
	.word	isRPSPlayerWin
	.word	RPSGameState
	.word	22464
	.word	RPSWinSound
	.size	updateREADY, .-updateREADY
	.align	2
	.global	updateRPSGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateRPSGame, %function
updateRPSGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	bl	updateRPSPlayer
	ldr	r2, .L103
	ldr	r3, [r2, #32]
	add	r3, r3, #1
	cmp	r3, #20
	str	r3, [r2, #32]
	bleq	updateRPSEnemy.part.0
.L97:
	ldr	r3, .L103+4
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L98
	cmp	r3, #1
	beq	.L99
	pop	{r4, lr}
	bx	lr
.L98:
	pop	{r4, lr}
	b	updateNOTREADY
.L99:
	pop	{r4, lr}
	b	updateREADY
.L104:
	.align	2
.L103:
	.word	enemy
	.word	RPSGameState
	.size	updateRPSGame, .-updateRPSGame
	.align	2
	.global	drawREADY
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawREADY, %function
drawREADY:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	mov	r7, #896
	mov	r6, #900
	mov	r4, #904
	mov	lr, #908
	ldr	r3, .L107
	ldr	r2, [r3]
	ldr	r1, [r3, #4]
	ldr	r3, .L107+4
	strh	r2, [r3, #80]	@ movhi
	ldr	r2, .L107+8
	ldr	r5, .L107+12
	orr	r1, r1, r2
	strh	r1, [r3, #82]	@ movhi
	ldr	r1, [r5, #4]
	ldr	r0, .L107+16
	orr	r1, r1, r2
	ldr	ip, .L107+20
	strh	r1, [r3, #90]	@ movhi
	ldr	r1, [r0]
	ldr	r0, [r0, #4]
	strh	r1, [r3, #96]	@ movhi
	ldr	r1, [ip, #4]
	strh	r7, [r3, #84]	@ movhi
	ldr	ip, [ip]
	ldr	r7, [r5]
	orr	r0, r0, r2
	orr	r2, r1, r2
	strh	r7, [r3, #88]	@ movhi
	strh	r6, [r3, #92]	@ movhi
	strh	r4, [r3, #100]	@ movhi
	strh	lr, [r3, #108]	@ movhi
	strh	r0, [r3, #98]	@ movhi
	strh	r2, [r3, #106]	@ movhi
	strh	ip, [r3, #104]	@ movhi
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L108:
	.align	2
.L107:
	.word	playerRock
	.word	shadowOAM
	.word	-32768
	.word	playerPaper
	.word	playerScissors
	.word	playerPick
	.size	drawREADY, .-drawREADY
	.align	2
	.global	drawGAMESET
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawGAMESET, %function
drawGAMESET:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r1, .L111
	ldr	r2, [r1, #4]
	add	r2, r2, #64
	mvn	r2, r2, lsl #17
	mvn	r2, r2, lsr #17
	push	{r4, r5, lr}
	mov	r4, #512
	ldr	r0, .L111+4
	ldr	r3, .L111+8
	ldr	lr, .L111+12
	ldr	ip, [r0]
	ldr	r0, [r3]
	ldr	r3, .L111+16
	ldr	r5, [r1]
	add	ip, ip, #224
	ldr	r1, [lr, #4]
	strh	r2, [r3, #114]	@ movhi
	lsl	ip, ip, #2
	ldr	r2, .L111+20
	lsl	r0, r0, #6
	strh	ip, [r3, #116]	@ movhi
	add	r0, r0, #912
	ldr	lr, [lr]
	sub	r1, r1, #16
	ldr	ip, .L111+24
	strh	r0, [r3, #124]	@ movhi
	strh	r2, [r3, #122]	@ movhi
	orr	r1, r1, #16384
	add	r2, r3, #288
	ldr	r0, .L111+28
	strh	r5, [r3, #112]	@ movhi
	sub	lr, lr, #16
	strh	ip, [r3, #120]	@ movhi
	strh	r1, [r2, #2]	@ movhi
	add	r1, r3, #280
	add	r3, r3, #292
	strh	lr, [r2]	@ movhi
	strh	r4, [r1]	@ movhi
	strh	r0, [r3]	@ movhi
	pop	{r4, r5, lr}
	bx	lr
.L112:
	.align	2
.L111:
	.word	playerScissors
	.word	enemyWeapon
	.word	isRPSPlayerWin
	.word	player
	.word	shadowOAM
	.word	-32663
	.word	16399
	.word	926
	.size	drawGAMESET, .-drawGAMESET
	.align	2
	.global	drawRPSGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawRPSGame, %function
drawRPSGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L119
	ldr	r3, [r2, #36]
	push	{r4, lr}
	ldr	ip, .L119+4
	ldr	lr, [r2, #44]
	add	r3, r3, #2
	ldm	r2, {r0, r1}
	ldr	r4, .L119+8
	add	r3, r3, lr, lsl #6
	ldr	lr, [ip, #4]
	ldr	r2, .L119+12
	lsl	r3, r3, #1
	orr	r0, r0, r4
	orr	r1, r1, r4
	cmp	lr, #240
	strh	r3, [r2, #52]	@ movhi
	strh	r0, [r2, #48]	@ movhi
	strh	r1, [r2, #50]	@ movhi
	bgt	.L114
	ldr	r1, [ip, #44]
	ldr	r3, [ip, #36]
	add	r3, r3, r1, lsl #5
	add	r3, r3, #97
	ldr	r1, [ip]
	orr	lr, lr, r4
	lsl	r3, r3, #2
	strh	lr, [r2, #74]	@ movhi
	strh	r3, [r2, #76]	@ movhi
	strh	r1, [r2, #72]	@ movhi
.L114:
	ldr	r3, .L119+16
	ldr	r3, [r3]
	cmp	r3, #1
	beq	.L115
	cmp	r3, #2
	bleq	drawGAMESET
.L117:
	ldr	r3, .L119+20
	mov	lr, pc
	bx	r3
	ldr	r4, .L119+24
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L119+12
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	ldr	r2, .L119+28
	ldrh	r1, [r2]
	ldr	r2, .L119+32
	strh	r1, [r3, #16]	@ movhi
	ldrh	r1, [r2]
	ldr	r2, .L119+36
	strh	r1, [r3, #18]	@ movhi
	ldrh	r1, [r2]
	ldr	r2, .L119+40
	ldrh	r2, [r2]
	strh	r1, [r3, #20]	@ movhi
	pop	{r4, lr}
	strh	r2, [r3, #22]	@ movhi
	bx	lr
.L115:
	bl	drawREADY
	b	.L117
.L120:
	.align	2
.L119:
	.word	player
	.word	enemy
	.word	-32768
	.word	shadowOAM
	.word	RPSGameState
	.word	waitForVBlank
	.word	DMANow
	.word	RPS0_hOff
	.word	RPS0_vOff
	.word	RPS1_hOff
	.word	RPS1_vOff
	.size	drawRPSGame, .-drawRPSGame
	.comm	playerPick,64,4
	.comm	playerScissors,64,4
	.comm	playerPaper,64,4
	.comm	playerRock,64,4
	.comm	shadowOAM,1024,4
	.comm	isRPSPlayerWin,4,4
	.comm	enemyWeapon,4,4
	.comm	playerWeapon,4,4
	.comm	RPSGameState,4,4
	.comm	enemy,64,4
	.comm	player,64,4
	.comm	walkingSoundFlag,4,4
	.comm	RPS1_vOff,4,4
	.comm	RPS1_hOff,4,4
	.comm	RPS0_vOff,4,4
	.comm	RPS0_hOff,4,4
	.comm	soundB,32,4
	.comm	soundA,32,4
	.ident	"GCC: (devkitARM release 50) 8.2.0"
