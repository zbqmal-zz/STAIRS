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
	.file	"ParomaGame.c"
	.text
	.align	2
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawPRPlayer.part.1, %function
drawPRPlayer.part.1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r0, .L3
	ldr	r2, [r0, #4]
	mvn	r2, r2, lsl #17
	mvn	r2, r2, lsr #17
	ldr	r3, [r0, #36]
	ldr	r1, .L3+4
	ldr	r0, [r0]
	lsl	r3, r3, #7
	add	r3, r3, #14
	strh	r2, [r1, #50]	@ movhi
	strh	r0, [r1, #48]	@ movhi
	strh	r3, [r1, #52]	@ movhi
	bx	lr
.L4:
	.align	2
.L3:
	.word	player
	.word	shadowOAM
	.size	drawPRPlayer.part.1, .-drawPRPlayer.part.1
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	updatePREnemyBullet.part.8, %function
updatePREnemyBullet.part.8:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L15
	ldr	r2, [r3]
	ldr	r1, [r3, #16]
	ldr	ip, [r3, #28]
	add	r2, r2, r1
	add	r1, r2, ip
	cmp	r1, #160
	movgt	r1, #0
	push	{r4, r5, lr}
	ldr	r4, .L15+4
	strgt	r1, [r3, #52]
	ldr	r1, [r4, #52]
	cmp	r1, #0
	sub	sp, sp, #20
	str	r2, [r3]
	bne	.L14
.L5:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L14:
	ldr	lr, [r3, #4]
	ldr	r5, [r3, #24]
	ldm	r4, {r0, r1}
	add	r3, lr, #2
	add	r2, r2, #3
	stm	sp, {r2, r3, ip}
	str	r5, [sp, #12]
	add	r1, r1, #8
	add	r0, r0, #8
	ldr	r3, [r4, #24]
	ldr	r2, [r4, #28]
	ldr	r5, .L15+8
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	beq	.L5
	ldr	r3, .L15+12
	mov	lr, pc
	bx	r3
	ldr	r5, .L15+16
	mov	r3, #0
	ldr	r2, .L15+20
	ldr	r1, .L15+24
	ldr	r0, .L15+28
	mov	lr, pc
	bx	r5
	mov	r2, #0
	mov	r3, #3
	str	r2, [r4, #52]
	str	r3, [r4, #36]
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L16:
	.align	2
.L15:
	.word	enemyBullet
	.word	player
	.word	collision
	.word	stopSoundB
	.word	playSoundB
	.word	11025
	.word	9181
	.word	getHitSound
	.size	updatePREnemyBullet.part.8, .-updatePREnemyBullet.part.8
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawPREnemyBullet.part.9, %function
drawPREnemyBullet.part.9:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r1, .L18
	ldr	r3, [r1]
	mvn	r3, r3, lsl #17
	mov	r0, #23
	mvn	r3, r3, lsr #17
	ldr	r2, .L18+4
	ldr	ip, [r1, #4]
	add	r1, r2, #368
	add	r2, r2, #372
	strh	r3, [r1]	@ movhi
	strh	ip, [r1, #2]	@ movhi
	strh	r0, [r2]	@ movhi
	bx	lr
.L19:
	.align	2
.L18:
	.word	enemyBullet
	.word	shadowOAM
	.size	drawPREnemyBullet.part.9, .-drawPREnemyBullet.part.9
	.align	2
	.global	drawPAROMAGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawPAROMAGame, %function
drawPAROMAGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r5, .L41
	ldr	r3, [r5]
	cmp	r3, #0
	bleq	drawPRPlayer.part.1
.L21:
	mov	lr, #512
	ldr	r3, .L41+4
	ldr	r4, .L41+8
	add	ip, r3, #320
.L24:
	add	r1, r3, #52
	ldm	r1, {r1, r2}
	cmp	r1, #0
	add	r2, r2, #27
	lsl	r1, r2, #3
	lsleq	r2, r2, #3
	add	r0, r4, r1
	strheq	lr, [r4, r2]	@ movhi
	beq	.L23
	ldr	r2, [r3, #36]
	ldr	r6, [r3, #4]
	lsl	r2, r2, #6
	ldr	r7, [r3]
	add	r2, r2, #18
	orr	r6, r6, #16384
	strh	r2, [r0, #4]	@ movhi
	strh	r6, [r0, #2]	@ movhi
	strh	r7, [r4, r1]	@ movhi
.L23:
	add	r3, r3, #64
	cmp	r3, ip
	bne	.L24
	mov	r6, #512
	ldr	r3, .L41+12
	add	lr, r3, #192
.L27:
	add	r1, r3, #52
	ldm	r1, {r1, r2}
	cmp	r1, #0
	add	r2, r2, #32
	lsl	r1, r2, #3
	lsleq	r2, r2, #3
	add	r0, r4, r1
	strheq	r6, [r4, r2]	@ movhi
	beq	.L26
	ldr	r2, [r3, #36]
	lsl	r2, r2, #6
	add	r2, r2, #20
	ldr	ip, [r3, #4]
	strh	r2, [r0, #4]	@ movhi
	ldr	r2, [r3]
	orr	ip, ip, #16384
	strh	ip, [r0, #2]	@ movhi
	strh	r2, [r4, r1]	@ movhi
.L26:
	add	r3, r3, #64
	cmp	r3, lr
	bne	.L27
	mov	lr, #512
	ldr	r3, .L41+16
	ldr	ip, .L41+20
	add	r0, r3, #320
.L30:
	add	r1, r3, #52
	ldm	r1, {r1, r2}
	cmp	r1, #0
	add	r2, r2, #41
	lsl	r1, r2, #3
	lsleq	r2, r2, #3
	add	r6, r4, r1
	strheq	lr, [r4, r2]	@ movhi
	beq	.L29
	ldr	r2, [r3, #36]
	lsl	r2, r2, #6
	add	r2, r2, #22
	ldr	r7, [r3]
	strh	r2, [r6, #4]	@ movhi
	ldr	r2, [r3, #4]
	orr	r7, r7, ip
	strh	r7, [r4, r1]	@ movhi
	strh	r2, [r6, #2]	@ movhi
.L29:
	add	r3, r3, #64
	cmp	r0, r3
	bne	.L30
	ldr	r3, .L41+24
	ldr	r3, [r3, #52]
	cmp	r3, #0
	bne	.L40
	mov	r2, #512
	ldr	r3, .L41+28
	strh	r2, [r3]	@ movhi
.L32:
	ldr	r3, [r5]
	cmp	r3, #1
	bne	.L33
	ldr	r3, .L41+32
	ldr	r3, [r3]
	cmp	r3, #0
	moveq	r0, #976
	movne	r0, #912
	ldr	r2, .L41+36
	ldm	r2, {r1, r3}
	ldr	r2, .L41+40
	add	r3, r3, #16
	orr	r3, r3, #16384
	ldr	ip, .L41+44
	strh	r0, [r4, #124]	@ movhi
	strh	r3, [r2, #2]	@ movhi
	ldr	r0, .L41+48
	ldr	r3, .L41+52
	sub	r1, r1, #16
	strh	r1, [r2]	@ movhi
	strh	ip, [r2, #4]	@ movhi
	strh	r0, [r4, #120]	@ movhi
	strh	r3, [r4, #122]	@ movhi
.L33:
	ldr	r3, .L41+56
	mov	lr, pc
	bx	r3
	ldr	r4, .L41+60
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L41+8
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	ldr	r2, .L41+64
	ldrh	r1, [r2]
	ldr	r2, .L41+68
	ldrh	r2, [r2]
	strh	r1, [r3, #16]	@ movhi
	pop	{r4, r5, r6, r7, r8, lr}
	strh	r2, [r3, #18]	@ movhi
	bx	lr
.L40:
	bl	drawPREnemyBullet.part.9
	b	.L32
.L42:
	.align	2
.L41:
	.word	PRGameState
	.word	enemies
	.word	shadowOAM
	.word	paromas
	.word	playerBullets
	.word	-32768
	.word	enemyBullet
	.word	shadowOAM+368
	.word	remainingEnemies
	.word	player
	.word	shadowOAM+288
	.word	926
	.word	16404
	.word	-32664
	.word	waitForVBlank
	.word	DMANow
	.word	PR_hOff
	.word	PR_vOff
	.size	drawPAROMAGame, .-drawPAROMAGame
	.align	2
	.global	initPRPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	initPRPlayer, %function
initPRPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #16
	push	{r4, r5, lr}
	mov	r2, #0
	mov	r5, #130
	mov	r4, #112
	mov	lr, #2
	mov	ip, #1
	mov	r0, #20
	ldr	r3, .L45
	str	r1, [r3, #24]
	str	r1, [r3, #28]
	ldr	r1, .L45+4
	str	r5, [r3]
	str	r4, [r3, #4]
	str	lr, [r3, #20]
	str	ip, [r3, #52]
	str	r2, [r3, #36]
	str	r2, [r3, #32]
	str	r0, [r1]
	pop	{r4, r5, lr}
	bx	lr
.L46:
	.align	2
.L45:
	.word	player
	.word	playerBulletTimer
	.size	initPRPlayer, .-initPRPlayer
	.align	2
	.global	fireBullet
	.syntax unified
	.arm
	.fpu softvfp
	.type	fireBullet, %function
fireBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L53
	mov	lr, pc
	bx	r3
	ldr	r4, .L53+4
	mov	r3, #0
	ldr	r1, .L53+8
	ldr	r2, .L53+12
	ldr	r0, .L53+16
	mov	lr, pc
	bx	r4
	mov	r3, #0
	ldr	r1, .L53+20
.L50:
	ldr	r2, [r1, r3, lsl #6]
	cmp	r2, #0
	lsl	r2, r3, #6
	bne	.L48
	mov	lr, #1
	ldr	ip, .L53+24
	ldr	r0, .L53+28
	ldr	r1, [ip, #4]
	ldr	ip, [ip]
	add	r2, r0, r2
	add	r1, r1, #12
	str	r1, [r2, #4]
	str	ip, [r0, r3, lsl #6]
	str	lr, [r2, #52]
.L47:
	pop	{r4, lr}
	bx	lr
.L48:
	add	r3, r3, #1
	cmp	r3, #5
	bne	.L50
	b	.L47
.L54:
	.align	2
.L53:
	.word	stopSoundB
	.word	playSoundB
	.word	6243
	.word	11025
	.word	PAROMAFireSound
	.word	playerBullets+52
	.word	player
	.word	playerBullets
	.size	fireBullet, .-fireBullet
	.align	2
	.global	updatePRPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	updatePRPlayer, %function
updatePRPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r1, .L79
	ldr	r2, [r1]
	cmp	r2, #0
	bxne	lr
	ldr	r3, .L79+4
	ldr	r0, [r3, #52]
	cmp	r0, #0
	beq	.L58
	ldr	r1, .L79+8
	ldrh	r1, [r1, #48]
	tst	r1, #32
	push	{r4, lr}
	str	r2, [r3, #36]
	bne	.L59
	ldr	r1, [r3, #20]
	ldr	r2, [r3, #4]
	subs	r2, r2, r1
	movpl	r1, #1
	strpl	r2, [r3, #4]
	strpl	r1, [r3, #36]
.L59:
	ldr	r2, .L79+8
	ldrh	r2, [r2, #48]
	tst	r2, #16
	bne	.L60
	ldr	r1, [r3, #4]
	ldr	r0, [r3, #20]
	add	r2, r1, #31
	add	r2, r2, r0
	cmp	r2, #240
	movle	r2, #2
	addle	r1, r1, r0
	strle	r1, [r3, #4]
	strle	r2, [r3, #36]
.L60:
	ldr	r1, .L79+12
	ldr	r4, .L79+16
	ldr	r3, [r1]
	ldrh	r2, [r4]
	add	r3, r3, #1
	tst	r2, #1
	str	r3, [r1]
	beq	.L61
	cmp	r3, #20
	movle	r3, #0
	movgt	r3, #1
	ldr	r0, .L79+20
	ldrh	r0, [r0]
	bics	r3, r3, r0
	bne	.L77
.L61:
	tst	r2, #512
	beq	.L55
	ldr	r3, .L79+20
	ldrh	r3, [r3]
	tst	r3, #512
	moveq	r2, #1
	ldreq	r3, .L79+24
	streq	r2, [r3]
.L55:
	pop	{r4, lr}
	bx	lr
.L58:
	ldr	r2, [r3, #32]
	add	r2, r2, #1
	cmp	r2, #20
	ble	.L78
	ldr	r2, [r3, #36]
	add	r2, r2, #1
	cmp	r2, #4
	str	r0, [r3, #32]
	str	r2, [r3, #36]
	movgt	r3, #1
	strgt	r3, [r1]
	bx	lr
.L78:
	str	r2, [r3, #32]
	bx	lr
.L77:
	mov	r3, #0
	str	r3, [r1]
	bl	fireBullet
	ldrh	r2, [r4]
	b	.L61
.L80:
	.align	2
.L79:
	.word	PRGameState
	.word	player
	.word	67109120
	.word	playerBulletTimer
	.word	oldButtons
	.word	buttons
	.word	isCheatOn
	.size	updatePRPlayer, .-updatePRPlayer
	.align	2
	.global	drawPRPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawPRPlayer, %function
drawPRPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L83
	ldr	r3, [r3]
	cmp	r3, #0
	bxne	lr
	b	drawPRPlayer.part.1
.L84:
	.align	2
.L83:
	.word	PRGameState
	.size	drawPRPlayer, .-drawPRPlayer
	.align	2
	.global	initPREnemies
	.syntax unified
	.arm
	.fpu softvfp
	.type	initPREnemies, %function
initPREnemies:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r9, #0
	ldr	r4, .L89
	ldr	r5, .L89+4
	ldr	r7, .L89+8
	ldr	r6, .L89+12
	ldr	r8, .L89+16
.L86:
	mov	r3, #1
	str	r9, [r4, #56]
	str	r3, [r4, #52]
	mov	lr, pc
	bx	r5
	smull	r3, r2, r7, r0
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #5
	add	r3, r3, r3, lsl #2
	add	r3, r3, r3, lsl #2
	sub	r3, r0, r3, lsl #2
	str	r3, [r4]
	mov	lr, pc
	bx	r5
	smull	r3, r2, r7, r0
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #6
	add	r3, r3, r3, lsl #2
	add	r3, r3, r3, lsl #2
	sub	r3, r0, r3, lsl #3
	str	r3, [r4, #4]
	mov	lr, pc
	bx	r5
	smull	r2, r3, r6, r0
	sub	r3, r3, r0, asr #31
	add	r3, r3, r3, lsl #1
	sub	r0, r0, r3
	add	r0, r0, #1
	str	r0, [r4, #16]
	mov	lr, pc
	bx	r5
	mov	r1, #10
	mov	r2, #14
	smull	ip, r3, r6, r0
	sub	r3, r3, r0, asr #31
	add	r3, r3, r3, lsl #1
	sub	r0, r0, r3
	add	r0, r0, #1
	str	r1, [r4, #24]
	str	r2, [r4, #28]
	str	r0, [r4, #20]
	mov	lr, pc
	bx	r5
	mov	r2, #0
	smull	r3, r1, r8, r0
	asr	r3, r0, #31
	rsb	r3, r3, r1, asr #3
	add	r9, r9, #1
	add	r3, r3, r3, lsl #2
	sub	r3, r0, r3, lsl #2
	cmp	r9, #5
	str	r3, [r4, #32]
	str	r2, [r4, #36]
	add	r4, r4, #64
	bne	.L86
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L90:
	.align	2
.L89:
	.word	enemies
	.word	rand
	.word	1374389535
	.word	1431655766
	.word	1717986919
	.size	initPREnemies, .-initPREnemies
	.align	2
	.global	updatePREnemy
	.syntax unified
	.arm
	.fpu softvfp
	.type	updatePREnemy, %function
updatePREnemy:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L112
	ldr	r3, [r3]
	cmp	r3, #0
	bxne	lr
	ldr	r2, [r0, #52]
	cmp	r2, #0
	bxeq	lr
	ldr	r1, [r0, #32]
	cmp	r2, #1
	add	r2, r1, #1
	beq	.L110
	cmp	r2, #20
	bgt	.L102
	str	r2, [r0, #32]
	bx	lr
.L110:
	ldr	r3, [r0, #16]
	ldr	ip, [r0]
	add	r1, ip, r3
	cmp	r1, #120
	rsbhi	r1, r3, #0
	str	lr, [sp, #-4]!
	ldr	lr, [r0, #4]
	strhi	r1, [r0, #16]
	subhi	r1, ip, r3
	ldr	ip, [r0, #20]
	add	r3, lr, ip
	cmp	r3, #240
	rsbhi	r3, ip, #0
	strhi	r3, [r0, #20]
	subhi	r3, lr, ip
	cmp	r2, #20
	stm	r0, {r1, r3}
	strle	r2, [r0, #32]
	bgt	.L111
.L99:
	ldr	r2, .L112+4
	ldr	r0, [r2]
	cmp	r0, #29
	ble	.L91
	ldr	r0, .L112+8
	ldr	ip, [r0, #52]
	cmp	ip, #0
	bne	.L91
	mov	lr, #1
	add	r3, r3, #4
	str	r3, [r0, #4]
	str	ip, [r2]
	str	r1, [r0]
	str	lr, [r0, #52]
.L91:
	ldr	lr, [sp], #4
	bx	lr
.L102:
	ldr	r2, [r0, #36]
	add	r2, r2, #1
	cmp	r2, #4
	str	r3, [r0, #32]
	str	r2, [r0, #36]
	strgt	r3, [r0, #52]
	bx	lr
.L111:
	mov	ip, #0
	ldr	r2, [r0, #36]
	add	r2, r2, #1
	cmp	r2, #1
	movgt	r2, ip
	str	ip, [r0, #32]
	str	r2, [r0, #36]
	b	.L99
.L113:
	.align	2
.L112:
	.word	PRGameState
	.word	enemyBulletTimer
	.word	enemyBullet
	.size	updatePREnemy, .-updatePREnemy
	.align	2
	.global	drawPREnemy
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawPREnemy, %function
drawPREnemy:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	add	r2, r0, #52
	ldm	r2, {r2, r3}
	cmp	r2, #0
	add	r3, r3, #27
	beq	.L115
	ldr	r2, [r0, #36]
	ldr	r1, [r0, #4]
	ldr	ip, .L121
	str	lr, [sp, #-4]!
	lsl	r3, r3, #3
	ldr	lr, [r0]
	lsl	r2, r2, #6
	add	r0, ip, r3
	orr	r1, r1, #16384
	add	r2, r2, #18
	strh	lr, [ip, r3]	@ movhi
	strh	r1, [r0, #2]	@ movhi
	strh	r2, [r0, #4]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L115:
	mov	r1, #512
	ldr	r2, .L121
	lsl	r3, r3, #3
	strh	r1, [r2, r3]	@ movhi
	bx	lr
.L122:
	.align	2
.L121:
	.word	shadowOAM
	.size	drawPREnemy, .-drawPREnemy
	.align	2
	.global	initParomas
	.syntax unified
	.arm
	.fpu softvfp
	.type	initParomas, %function
initParomas:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r7, #0
	mov	r9, #15
	mov	r8, r7
	ldr	r4, .L127
	ldr	r6, .L127+4
	ldr	r5, .L127+8
.L124:
	str	r7, [r4, #56]
	str	r8, [r4, #52]
	mov	lr, pc
	bx	r6
	smull	r3, r2, r5, r0
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #5
	add	r3, r3, r3, lsl #2
	add	r3, r3, r3, lsl #2
	sub	r3, r0, r3, lsl #2
	str	r3, [r4]
	mov	lr, pc
	bx	r6
	smull	r3, r2, r5, r0
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #6
	add	r7, r7, #1
	add	r3, r3, r3, lsl #2
	add	r3, r3, r3, lsl #2
	add	r2, r7, r7, lsl #2
	sub	r3, r0, r3, lsl #3
	lsl	r2, r2, #1
	cmp	r7, #3
	str	r9, [r4, #24]
	str	r9, [r4, #28]
	str	r8, [r4, #32]
	str	r8, [r4, #36]
	str	r3, [r4, #4]
	str	r2, [r4, #60]
	add	r4, r4, #64
	bne	.L124
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L128:
	.align	2
.L127:
	.word	paromas
	.word	rand
	.word	1374389535
	.size	initParomas, .-initParomas
	.align	2
	.global	initPAROMAGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	initPAROMAGame, %function
initPAROMAGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	lr, #2
	mov	r3, #0
	mov	r8, #5
	mov	r6, #16
	mov	fp, #130
	mov	r10, #112
	mov	r9, #1
	mov	r7, #20
	mov	ip, lr
	mov	r5, #4
	mov	r0, #12
	ldr	r1, .L133
	str	r3, [r1]
	ldr	r1, .L133+4
	str	r3, [r1]
	ldr	r1, .L133+8
	str	r3, [r1]
	ldr	r1, .L133+12
	str	r3, [r1]
	ldr	r1, .L133+16
	str	r3, [r1]
	ldr	r1, .L133+20
	str	r3, [r1]
	ldr	r1, .L133+24
	mov	r2, r3
	mov	r4, r3
	str	r3, [r1, #36]
	str	r3, [r1, #32]
	ldr	r3, .L133+28
	str	r8, [r3]
	ldr	r3, .L133+32
	str	fp, [r1]
	str	r7, [r3]
	str	r10, [r1, #4]
	str	r9, [r1, #52]
	str	r6, [r1, #24]
	str	r6, [r1, #28]
	str	lr, [r1, #20]
	ldr	r3, .L133+36
.L130:
	str	r2, [r3, #56]
	add	r2, r2, #1
	cmp	r2, #5
	str	r4, [r3, #52]
	str	r4, [r3]
	str	r4, [r3, #4]
	str	r5, [r3, #24]
	str	r0, [r3, #28]
	str	r4, [r3, #32]
	str	r4, [r3, #36]
	str	ip, [r3, #16]
	add	r3, r3, #64
	bne	.L130
	bl	initPREnemies
	mov	r1, #10
	mov	r2, #1
	ldr	r3, .L133+40
	str	r1, [r3, #28]
	str	r4, [r3, #52]
	str	r4, [r3]
	str	r4, [r3, #4]
	str	r5, [r3, #24]
	str	r2, [r3, #16]
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	b	initParomas
.L134:
	.align	2
.L133:
	.word	PR_vOff
	.word	PR_hOff
	.word	isGotParoma
	.word	PRGameState
	.word	enemyBulletTimer
	.word	isCheatOn
	.word	player
	.word	remainingEnemies
	.word	playerBulletTimer
	.word	playerBullets
	.word	enemyBullet
	.size	initPAROMAGame, .-initPAROMAGame
	.align	2
	.global	updateParoma
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateParoma, %function
updateParoma:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #60]
	add	r3, r3, #1
	cmp	r3, #49
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r4, r0
	str	r3, [r0, #60]
	ldr	r5, [r0, #52]
	ble	.L136
	mov	r3, #0
	cmp	r5, r3
	str	r3, [r0, #60]
	strne	r3, [r0, #52]
	beq	.L148
.L135:
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L136:
	cmp	r5, #0
	beq	.L135
	ldr	r3, [r0, #32]
	add	r3, r3, #1
	cmp	r3, #10
	str	r3, [r0, #32]
	ble	.L143
	cmp	r3, #20
	movle	r3, #2
	strle	r3, [r0, #36]
	ble	.L135
	cmp	r3, #30
	movle	r3, #3
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	strle	r3, [r0, #36]
	bx	lr
.L148:
	mov	r6, #1
	ldr	r8, .L149
	str	r6, [r0, #52]
	mov	lr, pc
	bx	r8
	ldr	r9, .L149+4
	smull	r2, r3, r9, r0
	asr	r2, r0, #31
	rsb	r2, r2, r3, asr #5
	add	r2, r2, r2, lsl #2
	add	r2, r2, r2, lsl #2
	sub	r2, r0, r2, lsl #2
	str	r2, [r4]
	mov	lr, pc
	bx	r8
	smull	r3, r7, r0, r9
	asr	r3, r0, #31
	rsb	r3, r3, r7, asr #6
	add	r3, r3, r3, lsl #2
	ldr	r2, [r4, #52]
	add	r3, r3, r3, lsl #2
	sub	r3, r0, r3, lsl #3
	cmp	r2, #0
	str	r5, [r4, #32]
	str	r5, [r4, #36]
	str	r3, [r4, #4]
	strne	r6, [r4, #32]
	beq	.L135
.L143:
	mov	r3, #1
	str	r3, [r4, #36]
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L150:
	.align	2
.L149:
	.word	rand
	.word	1374389535
	.size	updateParoma, .-updateParoma
	.align	2
	.global	drawParoma
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawParoma, %function
drawParoma:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	add	r2, r0, #52
	ldm	r2, {r2, r3}
	cmp	r2, #0
	add	r3, r3, #32
	beq	.L152
	ldr	r2, [r0, #36]
	ldr	r1, [r0, #4]
	ldr	ip, .L158
	str	lr, [sp, #-4]!
	lsl	r3, r3, #3
	ldr	lr, [r0]
	lsl	r2, r2, #6
	add	r0, ip, r3
	orr	r1, r1, #16384
	add	r2, r2, #20
	strh	lr, [ip, r3]	@ movhi
	strh	r1, [r0, #2]	@ movhi
	strh	r2, [r0, #4]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L152:
	mov	r1, #512
	ldr	r2, .L158
	lsl	r3, r3, #3
	strh	r1, [r2, r3]	@ movhi
	bx	lr
.L159:
	.align	2
.L158:
	.word	shadowOAM
	.size	drawParoma, .-drawParoma
	.align	2
	.global	initPlayerBullets
	.syntax unified
	.arm
	.fpu softvfp
	.type	initPlayerBullets, %function
initPlayerBullets:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #0
	str	lr, [sp, #-4]!
	mov	r2, r1
	mov	lr, #4
	mov	ip, #12
	mov	r0, #2
	ldr	r3, .L164
.L161:
	str	r1, [r3, #56]
	add	r1, r1, #1
	cmp	r1, #5
	str	r2, [r3, #52]
	str	r2, [r3]
	str	r2, [r3, #4]
	str	lr, [r3, #24]
	str	ip, [r3, #28]
	str	r2, [r3, #32]
	str	r2, [r3, #36]
	str	r0, [r3, #16]
	add	r3, r3, #64
	bne	.L161
	ldr	lr, [sp], #4
	bx	lr
.L165:
	.align	2
.L164:
	.word	playerBullets
	.size	initPlayerBullets, .-initPlayerBullets
	.align	2
	.global	updatePlayerBullet
	.syntax unified
	.arm
	.fpu softvfp
	.type	updatePlayerBullet, %function
updatePlayerBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #52]
	cmp	r3, #0
	bxeq	lr
	ldr	r3, [r0]
	ldr	r2, [r0, #16]
	subs	r3, r3, r2
	movmi	r3, #0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	strmi	r3, [r0, #52]
	sub	sp, sp, #28
	bmi	.L169
	ldr	r2, [r0, #32]
	add	r2, r2, #1
	cmp	r2, #10
	str	r3, [r0]
	strne	r2, [r0, #32]
	beq	.L196
.L169:
	mov	r5, r0
	ldr	r4, .L199
	ldr	r7, .L199+4
	ldr	fp, .L199+8
	ldr	r10, .L199+12
	ldr	r9, .L199+16
	ldr	r8, .L199+20
	add	r6, r4, #320
.L176:
	ldr	r3, [r4, #52]
	cmp	r3, #1
	beq	.L197
.L174:
	add	r4, r4, #64
	cmp	r4, r6
	bne	.L176
	ldr	r3, .L199+24
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L166
	mov	r9, #1
	ldr	r4, .L199+28
	ldr	r7, .L199+4
	ldr	r8, .L199+32
	add	r6, r4, #192
.L180:
	ldr	r3, [r4, #52]
	cmp	r3, #0
	bne	.L198
.L178:
	add	r4, r4, #64
	cmp	r4, r6
	bne	.L180
.L166:
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L197:
	ldr	r2, [r4, #4]
	add	r2, r2, #1
	ldm	r5, {r0, r1}
	ldr	r3, [r4]
	ldr	ip, [r4, #24]
	str	r2, [sp, #4]
	ldr	r2, [r4, #28]
	add	r3, r3, #3
	str	r3, [sp]
	str	ip, [sp, #12]
	str	r2, [sp, #8]
	add	r1, r1, #2
	add	r0, r0, #2
	ldr	r3, [r5, #24]
	ldr	r2, [r5, #28]
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	beq	.L174
	mov	lr, pc
	bx	fp
	mov	r3, #0
	ldr	r2, .L199+36
	ldr	r1, .L199+40
	mov	r0, r10
	mov	lr, pc
	bx	r9
	mov	r1, #0
	mov	r2, #2
	ldr	r3, [r8]
	sub	r3, r3, #1
	cmp	r3, r1
	str	r1, [r5, #52]
	str	r3, [r8]
	str	r1, [r4, #32]
	str	r2, [r4, #52]
	str	r2, [r4, #36]
	bne	.L174
	str	r3, [sp, #20]
	ldr	r3, .L199+44
	mov	lr, pc
	bx	r3
	ldr	r3, [sp, #20]
	ldr	r2, .L199+36
	ldr	r1, .L199+48
	ldr	r0, .L199+52
	mov	lr, pc
	bx	r9
	b	.L174
.L198:
	ldr	r2, [r4, #4]
	add	r2, r2, #1
	ldm	r5, {r0, r1}
	ldr	r3, [r4]
	ldr	ip, [r4, #24]
	str	r2, [sp, #4]
	ldr	r2, [r4, #28]
	add	r3, r3, #1
	str	r3, [sp]
	str	ip, [sp, #12]
	str	r2, [sp, #8]
	add	r1, r1, #2
	add	r0, r0, #2
	ldr	r3, [r5, #24]
	ldr	r2, [r5, #28]
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	strne	r9, [r8]
	b	.L178
.L196:
	mov	r2, #0
	ldr	r3, [r0, #36]
	add	r3, r3, #1
	cmp	r3, #1
	movgt	r3, r2
	str	r2, [r0, #32]
	str	r3, [r0, #36]
	b	.L169
.L200:
	.align	2
.L199:
	.word	enemies
	.word	collision
	.word	stopSoundB
	.word	getHitSound
	.word	playSoundB
	.word	remainingEnemies
	.word	isCheatOn
	.word	paromas
	.word	isGotParoma
	.word	11025
	.word	9181
	.word	stopSound
	.word	22464
	.word	RPSWinSound
	.size	updatePlayerBullet, .-updatePlayerBullet
	.align	2
	.global	updatePAROMAGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	updatePAROMAGame, %function
updatePAROMAGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L217
	ldr	r3, [r4]
	cmp	r3, #0
	beq	.L216
.L201:
	pop	{r4, r5, r6, lr}
	bx	lr
.L216:
	bl	updatePRPlayer
	ldr	r0, .L217+4
	bl	updatePREnemy
	ldr	r0, .L217+8
	bl	updatePREnemy
	ldr	r0, .L217+12
	bl	updatePREnemy
	ldr	r0, .L217+16
	bl	updatePREnemy
	ldr	r0, .L217+20
	bl	updatePREnemy
	ldr	r0, .L217+24
	bl	updateParoma
	ldr	r0, .L217+28
	bl	updateParoma
	ldr	r0, .L217+32
	bl	updateParoma
	ldr	r0, .L217+36
	bl	updatePlayerBullet
	ldr	r0, .L217+40
	bl	updatePlayerBullet
	ldr	r0, .L217+44
	bl	updatePlayerBullet
	ldr	r5, .L217+48
	ldr	r0, .L217+52
	bl	updatePlayerBullet
	ldr	r0, .L217+56
	bl	updatePlayerBullet
	ldr	r3, [r5, #52]
	cmp	r3, #0
	bne	.L204
.L206:
	ldr	r2, .L217+60
	ldr	r3, [r2]
	add	r3, r3, #1
	str	r3, [r2]
.L205:
	ldr	r3, .L217+64
	ldr	r3, [r3]
	cmp	r3, #0
	moveq	r3, #1
	streq	r3, [r4]
	ldr	r3, .L217+68
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L201
	mov	r3, #0
	ldr	r5, .L217+72
	ldr	r2, .L217+76
	ldr	r1, .L217+80
	ldr	r0, .L217+84
	mov	lr, pc
	bx	r5
	mov	r3, #1
	str	r3, [r4]
	pop	{r4, r5, r6, lr}
	bx	lr
.L204:
	bl	updatePREnemyBullet.part.8
	ldr	r3, [r5, #52]
	cmp	r3, #0
	bne	.L205
	b	.L206
.L218:
	.align	2
.L217:
	.word	PRGameState
	.word	enemies
	.word	enemies+64
	.word	enemies+128
	.word	enemies+192
	.word	enemies+256
	.word	paromas
	.word	paromas+64
	.word	paromas+128
	.word	playerBullets
	.word	playerBullets+64
	.word	playerBullets+128
	.word	enemyBullet
	.word	playerBullets+192
	.word	playerBullets+256
	.word	enemyBulletTimer
	.word	remainingEnemies
	.word	isGotParoma
	.word	playSoundB
	.word	11025
	.word	12688
	.word	PAROMASound
	.size	updatePAROMAGame, .-updatePAROMAGame
	.align	2
	.global	drawPlayerBullet
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawPlayerBullet, %function
drawPlayerBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	add	r2, r0, #52
	ldm	r2, {r2, r3}
	cmp	r2, #0
	add	r3, r3, #41
	beq	.L220
	ldr	r1, [r0]
	mvn	r1, r1, lsl #17
	mvn	r1, r1, lsr #17
	ldr	r2, [r0, #36]
	ldr	ip, .L226
	str	lr, [sp, #-4]!
	lsl	r3, r3, #3
	ldr	lr, [r0, #4]
	lsl	r2, r2, #6
	add	r0, ip, r3
	add	r2, r2, #22
	strh	lr, [r0, #2]	@ movhi
	strh	r1, [ip, r3]	@ movhi
	strh	r2, [r0, #4]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L220:
	mov	r1, #512
	ldr	r2, .L226
	lsl	r3, r3, #3
	strh	r1, [r2, r3]	@ movhi
	bx	lr
.L227:
	.align	2
.L226:
	.word	shadowOAM
	.size	drawPlayerBullet, .-drawPlayerBullet
	.align	2
	.global	initPREnemyBullet
	.syntax unified
	.arm
	.fpu softvfp
	.type	initPREnemyBullet, %function
initPREnemyBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #0
	mov	ip, #4
	mov	r0, #10
	mov	r1, #1
	ldr	r3, .L229
	str	r2, [r3, #52]
	str	r2, [r3]
	str	r2, [r3, #4]
	str	ip, [r3, #24]
	str	r0, [r3, #28]
	str	r1, [r3, #16]
	bx	lr
.L230:
	.align	2
.L229:
	.word	enemyBullet
	.size	initPREnemyBullet, .-initPREnemyBullet
	.align	2
	.global	updatePREnemyBullet
	.syntax unified
	.arm
	.fpu softvfp
	.type	updatePREnemyBullet, %function
updatePREnemyBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L233
	ldr	r3, [r3, #52]
	cmp	r3, #0
	bxeq	lr
	b	updatePREnemyBullet.part.8
.L234:
	.align	2
.L233:
	.word	enemyBullet
	.size	updatePREnemyBullet, .-updatePREnemyBullet
	.align	2
	.global	drawPREnemyBullet
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawPREnemyBullet, %function
drawPREnemyBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L237
	ldr	r3, [r3, #52]
	cmp	r3, #0
	bne	drawPREnemyBullet.part.9
.L236:
	mov	r2, #512
	ldr	r3, .L237+4
	strh	r2, [r3]	@ movhi
	bx	lr
.L238:
	.align	2
.L237:
	.word	enemyBullet
	.word	shadowOAM+368
	.size	drawPREnemyBullet, .-drawPREnemyBullet
	.align	2
	.global	drawPRGameSet
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawPRGameSet, %function
drawPRGameSet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L243
	ldr	r3, [r3]
	cmp	r3, #0
	moveq	ip, #976
	movne	ip, #912
	ldr	r1, .L243+4
	ldr	r3, .L243+8
	ldr	r2, [r1, #4]
	str	lr, [sp, #-4]!
	ldr	r0, .L243+12
	ldr	lr, .L243+16
	ldr	r1, [r1]
	strh	ip, [r3, #124]	@ movhi
	add	r2, r2, #16
	ldr	ip, .L243+20
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
.L244:
	.align	2
.L243:
	.word	remainingEnemies
	.word	player
	.word	shadowOAM
	.word	16404
	.word	-32664
	.word	926
	.size	drawPRGameSet, .-drawPRGameSet
	.comm	shadowOAM,1024,4
	.comm	isGotParoma,4,4
	.comm	remainingEnemies,4,4
	.comm	PRGameState,4,4
	.comm	paromas,192,4
	.comm	enemyBullet,64,4
	.comm	enemies,320,4
	.comm	playerBullets,320,4
	.comm	player,64,4
	.comm	isCheatOn,4,4
	.comm	enemyBulletTimer,4,4
	.comm	playerBulletTimer,4,4
	.comm	PR_vOff,4,4
	.comm	PR_hOff,4,4
	.comm	soundB,32,4
	.comm	soundA,32,4
	.ident	"GCC: (devkitARM release 50) 8.2.0"
