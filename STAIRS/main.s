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
	.file	"main.c"
	.text
	.align	2
	.global	goToStart
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToStart, %function
goToStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #67108864
	mov	r2, #0
	push	{r4, r5, r6, lr}
	ldr	r5, .L6
	strh	r2, [r3, #16]	@ movhi
	strh	r2, [r3, #18]	@ movhi
	ldr	r3, [r5]
	cmp	r3, #9
	cmpne	r3, #2
	movne	r4, #1
	moveq	r4, #0
	beq	.L2
	mov	r3, #1
	ldr	r2, .L6+4
	ldr	r1, .L6+8
	ldr	r0, .L6+12
	ldr	r4, .L6+16
	mov	lr, pc
	bx	r4
	ldr	r3, .L6+20
	mov	lr, pc
	bx	r3
.L3:
	ldr	r4, .L6+24
	mov	r3, #256
	ldr	r2, .L6+28
	ldr	r1, .L6+32
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #15488
	mov	r2, #100663296
	ldr	r1, .L6+36
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #2048
	ldr	r2, .L6+40
	ldr	r1, .L6+44
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #16384
	ldr	r2, .L6+48
	ldr	r1, .L6+52
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r4, #67108864
	mov	r2, #56320
	ldr	r3, .L6+56
	strh	r2, [r4, #8]	@ movhi
	mov	lr, pc
	bx	r3
	mov	r2, #4352
	mov	r3, #0
	strh	r2, [r4]	@ movhi
	str	r3, [r5]
	pop	{r4, r5, r6, lr}
	bx	lr
.L2:
	ldr	r3, .L6+60
	mov	lr, pc
	bx	r3
	mov	r3, r4
	ldr	r2, .L6+4
	mov	r1, #7488
	ldr	r0, .L6+64
	ldr	r4, .L6+68
	mov	lr, pc
	bx	r4
	b	.L3
.L7:
	.align	2
.L6:
	.word	gameState
	.word	11025
	.word	1270368
	.word	StartGameSong
	.word	playSoundA
	.word	initStartGame
	.word	DMANow
	.word	83886592
	.word	startSpriteSheetPal
	.word	startBGTiles
	.word	100720640
	.word	startBGMap
	.word	100728832
	.word	startSpriteSheetTiles
	.word	hideSprites
	.word	stopSoundB
	.word	transitionSound
	.word	playSoundB
	.size	goToStart, .-goToStart
	.align	2
	.global	initialize
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r0, #3
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L10
	ldr	r4, .L10+4
	mov	lr, pc
	bx	r4
	ldr	r3, .L10+8
	ldr	r2, .L10+12
	ldrh	r1, [r3, #48]
	ldr	r3, .L10+16
	strh	r1, [r2]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r3, .L10+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L10+24
	mov	r0, #0
	mov	lr, pc
	bx	r3
	ldr	r3, .L10+28
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	goToStart
.L11:
	.align	2
.L10:
	.word	startBGPal
	.word	DMANow
	.word	67109120
	.word	buttons
	.word	setupSounds
	.word	setupInterrupts
	.word	time
	.word	srand
	.size	initialize, .-initialize
	.align	2
	.global	goToInstruction
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToInstruction, %function
goToInstruction:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r3, .L14
	mov	lr, pc
	bx	r3
	ldr	r4, .L14+4
	mov	r3, #0
	ldr	r2, .L14+8
	mov	r1, #7488
	ldr	r0, .L14+12
	mov	lr, pc
	bx	r4
	mov	r4, #67108864
	mov	r1, #0
	ldr	r5, .L14+16
	strh	r1, [r4, #16]	@ movhi
	mov	r3, #2832
	strh	r1, [r4, #18]	@ movhi
	mov	r2, #100663296
	ldr	r1, .L14+20
	mov	r0, #3
	mov	lr, pc
	bx	r5
	mov	r3, #1024
	ldr	r2, .L14+24
	ldr	r1, .L14+28
	mov	r0, #3
	mov	lr, pc
	bx	r5
	mov	r0, #56320
	mov	r1, #256
	mov	r2, #2
	ldr	r3, .L14+32
	strh	r0, [r4, #8]	@ movhi
	strh	r1, [r4]	@ movhi
	str	r2, [r3]
	pop	{r4, r5, r6, lr}
	bx	lr
.L15:
	.align	2
.L14:
	.word	stopSoundB
	.word	playSoundB
	.word	11025
	.word	transitionSound
	.word	DMANow
	.word	instructionTiles
	.word	100720640
	.word	instructionMap
	.word	gameState
	.size	goToInstruction, .-goToInstruction
	.align	2
	.global	instruction
	.syntax unified
	.arm
	.fpu softvfp
	.type	instruction, %function
instruction:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L21
	ldrh	r3, [r3]
	tst	r3, #4
	bxeq	lr
	ldr	r3, .L21+4
	ldrh	r3, [r3]
	tst	r3, #4
	bxne	lr
	b	goToStart
.L22:
	.align	2
.L21:
	.word	oldButtons
	.word	buttons
	.size	instruction, .-instruction
	.align	2
	.global	goToMainGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToMainGame, %function
goToMainGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r5, .L27
	ldr	r3, [r5]
	cmp	r3, #9
	beq	.L24
	ldr	r3, .L27+4
	mov	lr, pc
	bx	r3
	ldr	r4, .L27+8
	mov	r3, #1
	ldr	r2, .L27+12
	ldr	r1, .L27+16
	ldr	r0, .L27+20
	mov	lr, pc
	bx	r4
	mov	r3, #0
	ldr	r2, .L27+12
	mov	r1, #7488
	ldr	r0, .L27+24
	ldr	r4, .L27+28
	mov	lr, pc
	bx	r4
	ldr	r3, .L27+32
	mov	lr, pc
	bx	r3
.L25:
	ldr	r3, .L27+36
	mov	lr, pc
	bx	r3
	ldr	r4, .L27+40
	mov	r3, #272
	mov	r2, #100663296
	ldr	r1, .L27+44
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #2048
	ldr	r2, .L27+48
	ldr	r1, .L27+52
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #784
	ldr	r2, .L27+56
	ldr	r1, .L27+60
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #2048
	ldr	r2, .L27+64
	ldr	r1, .L27+68
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #752
	ldr	r2, .L27+72
	ldr	r1, .L27+76
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #2048
	ldr	r2, .L27+80
	ldr	r1, .L27+84
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #16384
	ldr	r2, .L27+88
	ldr	r1, .L27+92
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	mov	r1, #24064
	mov	r2, #3
	mov	ip, #5888
	strh	r1, [r3, #8]	@ movhi
	ldr	lr, .L27+96
	ldr	r0, .L27+100
	ldr	r1, .L27+104
	strh	lr, [r3, #10]	@ movhi
	strh	ip, [r3]	@ movhi
	strh	r0, [r3, #12]	@ movhi
	str	r2, [r5]
	str	r2, [r1]
	pop	{r4, r5, r6, lr}
	bx	lr
.L24:
	ldr	r3, .L27+108
	mov	lr, pc
	bx	r3
	b	.L25
.L28:
	.align	2
.L27:
	.word	gameState
	.word	stopSound
	.word	playSoundA
	.word	11025
	.word	3786336
	.word	MainGameSong
	.word	transitionSound
	.word	playSoundB
	.word	initMainGame
	.word	hideSprites
	.word	DMANow
	.word	mainGameBGTiles
	.word	100724736
	.word	mainGameBGMap
	.word	100696064
	.word	mainGameBG2Tiles
	.word	100720640
	.word	mainGameBG2Map
	.word	100712448
	.word	mainGameBG3Tiles
	.word	100716544
	.word	mainGameBG3Map
	.word	100728832
	.word	startSpriteSheetTiles
	.word	23560
	.word	23052
	.word	currGameState
	.word	unpauseSound
	.size	goToMainGame, .-goToMainGame
	.align	2
	.global	start
	.syntax unified
	.arm
	.fpu softvfp
	.type	start, %function
start:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L60
	mov	lr, pc
	bx	r3
	ldr	r3, .L60+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L60+8
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L30
	ldr	r4, .L60+12
	ldrh	r3, [r4]
	tst	r3, #4
	beq	.L31
	ldr	r2, .L60+16
	ldrh	r2, [r2]
	tst	r2, #4
	bne	.L31
.L32:
	ldr	r3, .L60+20
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
.L33:
	tst	r3, #2
	beq	.L29
	ldr	r3, .L60+16
	ldrh	r3, [r3]
	tst	r3, #2
	bne	.L29
	ldr	r3, .L60+24
	ldr	r3, [r3]
	cmp	r3, #1
	beq	.L37
	cmp	r3, #2
	bne	.L29
	mov	r2, #1
	ldr	r3, .L60+28
	pop	{r4, lr}
	str	r2, [r3]
	b	goToMainGame
.L31:
	ldr	r2, .L60+32
	ldr	r2, [r2]
	cmp	r2, #0
	beq	.L33
	b	.L32
.L30:
	ldr	r3, .L60+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L39
	ldr	r3, .L60+16
	ldrh	r3, [r3]
	tst	r3, #8
	bne	.L39
	ldr	r3, .L60+20
	mov	lr, pc
	bx	r3
.L29:
	pop	{r4, lr}
	bx	lr
.L39:
	ldr	r3, .L60+32
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L29
	ldr	r3, .L60+20
	mov	lr, pc
	bx	r3
	b	.L29
.L37:
	pop	{r4, lr}
	b	goToInstruction
.L61:
	.align	2
.L60:
	.word	updateStartGame
	.word	drawStartGame
	.word	isOnMenu
	.word	oldButtons
	.word	buttons
	.word	movingScreen
	.word	menuOption
	.word	isStartedGame
	.word	goingOnMenu
	.size	start, .-start
	.align	2
	.global	goToStageIntro
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToStageIntro, %function
goToStageIntro:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #67108864
	mov	r2, #0
	push	{r4, lr}
	ldr	r1, .L70
	strh	r2, [r3, #16]	@ movhi
	strh	r2, [r3, #18]	@ movhi
	mov	lr, pc
	bx	r1
	ldr	r3, .L70+4
	ldr	r3, [r3]
	sub	r3, r3, #5
	cmp	r3, #3
	ldrls	pc, [pc, r3, asl #2]
	b	.L63
.L65:
	.word	.L68
	.word	.L67
	.word	.L66
	.word	.L64
.L68:
	mov	r3, #1
	ldr	r2, .L70+8
	ldr	r1, .L70+12
	ldr	r0, .L70+16
	ldr	r4, .L70+20
	mov	lr, pc
	bx	r4
	mov	r3, #2192
	mov	r2, #100663296
	ldr	r1, .L70+24
	mov	r0, #3
	ldr	r4, .L70+28
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L70+32
	ldr	r1, .L70+36
	mov	r0, #3
	mov	lr, pc
	bx	r4
.L63:
	mov	r4, #67108864
	mov	r3, #0
	mov	r2, #56320
	strh	r2, [r4, #8]	@ movhi
	strh	r3, [r4, #16]	@ movhi
	ldr	r2, .L70+40
	strh	r3, [r4, #18]	@ movhi
	mov	lr, pc
	bx	r2
	mov	r1, #256
	mov	r2, #4
	ldr	r3, .L70+44
	strh	r1, [r4]	@ movhi
	str	r2, [r3]
	pop	{r4, lr}
	bx	lr
.L64:
	mov	r3, #1
	ldr	r2, .L70+8
	ldr	r1, .L70+48
	ldr	r0, .L70+52
	ldr	r4, .L70+20
	mov	lr, pc
	bx	r4
	ldr	r4, .L70+28
	mov	r3, #3952
	mov	r2, #100663296
	ldr	r1, .L70+56
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L70+32
	ldr	r1, .L70+60
	mov	r0, #3
	mov	lr, pc
	bx	r4
	b	.L63
.L66:
	mov	r3, #1
	ldr	r2, .L70+8
	ldr	r1, .L70+64
	ldr	r0, .L70+68
	ldr	r4, .L70+20
	mov	lr, pc
	bx	r4
	ldr	r4, .L70+28
	mov	r3, #3680
	mov	r2, #100663296
	ldr	r1, .L70+72
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L70+32
	ldr	r1, .L70+76
	mov	r0, #3
	mov	lr, pc
	bx	r4
	b	.L63
.L67:
	mov	r3, #1
	ldr	r2, .L70+8
	ldr	r1, .L70+80
	ldr	r0, .L70+84
	ldr	r4, .L70+20
	mov	lr, pc
	bx	r4
	ldr	r4, .L70+28
	mov	r3, #3744
	mov	r2, #100663296
	ldr	r1, .L70+88
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L70+32
	ldr	r1, .L70+92
	mov	r0, #3
	mov	lr, pc
	bx	r4
	b	.L63
.L71:
	.align	2
.L70:
	.word	stopSoundA
	.word	randGame
	.word	11025
	.word	1349856
	.word	RPSGameSong
	.word	playSoundA
	.word	RPSStageIntroTiles
	.word	DMANow
	.word	100720640
	.word	RPSStageIntroMap
	.word	hideSprites
	.word	gameState
	.word	2352096
	.word	SwimmingRaceSong
	.word	SRStageIntroTiles
	.word	SRStageIntroMap
	.word	866880
	.word	ParomaSong
	.word	PAROMAStageIntroTiles
	.word	PAROMAStageIntroMap
	.word	2721312
	.word	THGameSong
	.word	THStageIntroTiles
	.word	THStageIntroMap
	.size	goToStageIntro, .-goToStageIntro
	.align	2
	.global	goToRPSGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToRPSGame, %function
goToRPSGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r5, .L78
	ldr	r3, [r5]
	cmp	r3, #9
	beq	.L73
	ldr	r3, .L78+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L78+8
	mov	lr, pc
	bx	r3
.L73:
	ldr	r4, .L78+12
	mov	r3, #736
	mov	r2, #100663296
	ldr	r1, .L78+16
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #2048
	ldr	r2, .L78+20
	ldr	r1, .L78+24
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1248
	ldr	r2, .L78+28
	ldr	r1, .L78+32
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #2048
	ldr	r2, .L78+36
	ldr	r1, .L78+40
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #16384
	ldr	r2, .L78+44
	ldr	r1, .L78+48
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	mov	lr, #24064
	mov	r2, #5
	mov	ip, #4864
	ldr	r0, .L78+52
	ldr	r1, .L78+56
	strh	lr, [r3, #8]	@ movhi
	strh	ip, [r3]	@ movhi
	strh	r0, [r3, #10]	@ movhi
	str	r2, [r5]
	str	r2, [r1]
	pop	{r4, r5, r6, lr}
	bx	lr
.L79:
	.align	2
.L78:
	.word	gameState
	.word	initRPSGame
	.word	hideSprites
	.word	DMANow
	.word	RPSBG0Tiles
	.word	100724736
	.word	RPSBG0Map
	.word	100679680
	.word	RPSBG1Tiles
	.word	100720640
	.word	RPSBG1Map
	.word	100728832
	.word	startSpriteSheetTiles
	.word	23556
	.word	currGameState
	.size	goToRPSGame, .-goToRPSGame
	.align	2
	.global	goToTHGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToTHGame, %function
goToTHGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r5, .L86
	ldr	r3, [r5]
	cmp	r3, #9
	beq	.L81
	ldr	r3, .L86+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L86+8
	mov	lr, pc
	bx	r3
.L81:
	ldr	r4, .L86+12
	mov	r3, #1040
	mov	r2, #100663296
	ldr	r1, .L86+16
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L86+20
	ldr	r1, .L86+24
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #16384
	ldr	r2, .L86+28
	ldr	r1, .L86+32
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r2, #67108864
	mov	r3, #6
	mov	ip, #7936
	mov	r0, #4352
	ldr	r1, .L86+36
	strh	ip, [r2, #8]	@ movhi
	strh	r0, [r2]	@ movhi
	str	r3, [r5]
	str	r3, [r1]
	pop	{r4, r5, r6, lr}
	bx	lr
.L87:
	.align	2
.L86:
	.word	gameState
	.word	initTHGame
	.word	hideSprites
	.word	DMANow
	.word	THBGTiles
	.word	100726784
	.word	THBGMap
	.word	100728832
	.word	startSpriteSheetTiles
	.word	currGameState
	.size	goToTHGame, .-goToTHGame
	.align	2
	.global	goToParomaGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToParomaGame, %function
goToParomaGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r5, .L94
	ldr	r3, [r5]
	cmp	r3, #9
	beq	.L89
	ldr	r3, .L94+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L94+8
	mov	lr, pc
	bx	r3
.L89:
	ldr	r4, .L94+12
	mov	r3, #400
	mov	r2, #100663296
	ldr	r1, .L94+16
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L94+20
	ldr	r1, .L94+24
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #16384
	ldr	r2, .L94+28
	ldr	r1, .L94+32
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r2, #67108864
	mov	r3, #7
	mov	ip, #7936
	mov	r0, #4352
	ldr	r1, .L94+36
	strh	ip, [r2, #8]	@ movhi
	strh	r0, [r2]	@ movhi
	str	r3, [r5]
	str	r3, [r1]
	pop	{r4, r5, r6, lr}
	bx	lr
.L95:
	.align	2
.L94:
	.word	gameState
	.word	initPAROMAGame
	.word	hideSprites
	.word	DMANow
	.word	ParomaBGTiles
	.word	100726784
	.word	ParomaBGMap
	.word	100728832
	.word	startSpriteSheetTiles
	.word	currGameState
	.size	goToParomaGame, .-goToParomaGame
	.align	2
	.global	goToSRGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToSRGame, %function
goToSRGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r5, .L102
	ldr	r3, [r5]
	cmp	r3, #9
	bne	.L100
	ldr	r6, .L102+4
.L97:
	ldr	r4, .L102+8
	mov	r3, #144
	mov	r2, #100663296
	ldr	r1, .L102+12
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #2048
	ldr	r2, .L102+16
	ldr	r1, .L102+20
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r2, .L102+24
	ldr	r1, .L102+28
	mov	r3, #16384
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r4, #67108864
	mov	r3, #56320
	strh	r3, [r4, #8]	@ movhi
	mov	lr, pc
	bx	r6
	mov	r3, #8
	mov	r1, #4352
	ldr	r2, .L102+32
	strh	r1, [r4]	@ movhi
	str	r3, [r5]
	str	r3, [r2]
	pop	{r4, r5, r6, lr}
	bx	lr
.L100:
	ldr	r3, .L102+36
	mov	lr, pc
	bx	r3
	ldr	r4, .L102+40
	ldr	r2, .L102+44
	ldr	r1, .L102+48
	ldr	r0, .L102+52
	mov	r3, #1
	mov	lr, pc
	bx	r4
	ldr	r6, .L102+4
	ldr	r3, .L102+56
	mov	lr, pc
	bx	r3
	mov	lr, pc
	bx	r6
	b	.L97
.L103:
	.align	2
.L102:
	.word	gameState
	.word	hideSprites
	.word	DMANow
	.word	SRBGTiles
	.word	100720640
	.word	SRBGMap
	.word	100728832
	.word	startSpriteSheetTiles
	.word	currGameState
	.word	stopSoundB
	.word	playSoundB
	.word	11025
	.word	459936
	.word	SRCrowdSound
	.word	initSRGame
	.size	goToSRGame, .-goToSRGame
	.align	2
	.global	stageIntro
	.syntax unified
	.arm
	.fpu softvfp
	.type	stageIntro, %function
stageIntro:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L114
	ldrh	r3, [r3]
	tst	r3, #1
	bxeq	lr
	ldr	r3, .L114+4
	ldrh	r3, [r3]
	tst	r3, #1
	bxne	lr
	ldr	r3, .L114+8
	ldr	r3, [r3]
	sub	r3, r3, #5
	cmp	r3, #3
	ldrls	pc, [pc, r3, asl #2]
	b	.L104
.L107:
	.word	.L110
	.word	.L109
	.word	.L108
	.word	.L106
.L104:
	bx	lr
.L106:
	b	goToSRGame
.L108:
	b	goToParomaGame
.L109:
	b	goToTHGame
.L110:
	b	goToRPSGame
.L115:
	.align	2
.L114:
	.word	oldButtons
	.word	buttons
	.word	randGame
	.size	stageIntro, .-stageIntro
	.align	2
	.global	goToPause
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToPause, %function
goToPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r1, #0
	mov	r4, #67108864
	ldr	r5, .L118
	strh	r1, [r4, #28]	@ movhi
	mov	r3, #2320
	strh	r1, [r4, #30]	@ movhi
	mov	r2, #100663296
	ldr	r1, .L118+4
	mov	r0, #3
	mov	lr, pc
	bx	r5
	mov	r3, #1024
	ldr	r2, .L118+8
	ldr	r1, .L118+12
	mov	r0, #3
	mov	lr, pc
	bx	r5
	mov	r3, #16384
	ldr	r2, .L118+16
	ldr	r1, .L118+20
	mov	r0, #3
	mov	lr, pc
	bx	r5
	mov	r2, #7936
	mov	r3, #2048
	strh	r2, [r4, #14]	@ movhi
	strh	r3, [r4]	@ movhi
	ldr	r3, .L118+24
	mov	lr, pc
	bx	r3
	mov	r2, #9
	ldr	r3, .L118+28
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L119:
	.align	2
.L118:
	.word	DMANow
	.word	pauseTiles
	.word	100726784
	.word	pauseMap
	.word	100728832
	.word	startSpriteSheetTiles
	.word	pauseSound
	.word	gameState
	.size	goToPause, .-goToPause
	.align	2
	.global	mainGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	mainGame, %function
mainGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r3, .L138
	ldr	r4, .L138+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L138+8
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	tst	r3, #8
	beq	.L121
	ldr	r3, .L138+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L136
.L121:
	ldr	r3, .L138+16
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L120
	ldr	r3, .L138+20
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L120
	ldrh	r3, [r4]
	tst	r3, #2
	beq	.L120
	ldr	r3, .L138+12
	ldrh	r3, [r3]
	ands	r4, r3, #2
	beq	.L137
.L120:
	pop	{r4, r5, r6, lr}
	bx	lr
.L136:
	bl	goToPause
	b	.L121
.L137:
	ldr	r3, .L138+24
	mov	lr, pc
	bx	r3
	ldr	r5, .L138+28
	mov	r3, r4
	ldr	r2, .L138+32
	mov	r1, #23040
	ldr	r0, .L138+36
	mov	lr, pc
	bx	r5
	ldr	r2, .L138+40
	ldr	r1, .L138+44
	ldr	r3, [r2]
	ldr	r0, [r1]
	ldr	r1, .L138+48
	add	r3, r3, r0
	str	r4, [r1]
	pop	{r4, r5, r6, lr}
	str	r3, [r2]
	b	goToStageIntro
.L139:
	.align	2
.L138:
	.word	updateMainGame
	.word	oldButtons
	.word	drawMainGame
	.word	buttons
	.word	isRolled
	.word	isAtDoor
	.word	stopSoundB
	.word	playSoundB
	.word	11025
	.word	gameEntranceSound
	.word	currentLevel
	.word	diceNum
	.word	isStartedGame
	.size	mainGame, .-mainGame
	.align	2
	.global	pause
	.syntax unified
	.arm
	.fpu softvfp
	.type	pause, %function
pause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L155
	ldrh	r3, [r3]
	tst	r3, #8
	bxeq	lr
	ldr	r3, .L155+4
	ldrh	r3, [r3]
	tst	r3, #8
	bxne	lr
	ldr	r3, .L155+8
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L155+12
	ldr	r3, [r3]
	sub	r3, r3, #3
	cmp	r3, #5
	ldrls	pc, [pc, r3, asl #2]
	b	.L140
.L143:
	.word	.L147
	.word	.L140
	.word	.L146
	.word	.L145
	.word	.L144
	.word	.L142
.L140:
	pop	{r4, lr}
	bx	lr
.L142:
	pop	{r4, lr}
	b	goToSRGame
.L144:
	pop	{r4, lr}
	b	goToParomaGame
.L145:
	pop	{r4, lr}
	b	goToTHGame
.L146:
	pop	{r4, lr}
	b	goToRPSGame
.L147:
	pop	{r4, lr}
	b	goToMainGame
.L156:
	.align	2
.L155:
	.word	oldButtons
	.word	buttons
	.word	unpauseSound
	.word	currGameState
	.size	pause, .-pause
	.align	2
	.global	goToEnd
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToEnd, %function
goToEnd:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r1, #0
	mov	r4, #67108864
	ldr	r5, .L159
	strh	r1, [r4, #16]	@ movhi
	mov	r3, #2752
	strh	r1, [r4, #18]	@ movhi
	mov	r2, #100663296
	ldr	r1, .L159+4
	mov	r0, #3
	mov	lr, pc
	bx	r5
	mov	r3, #1024
	ldr	r2, .L159+8
	ldr	r1, .L159+12
	mov	r0, #3
	mov	lr, pc
	bx	r5
	ldr	r1, .L159+16
	mov	r0, #3
	mov	r3, #16384
	ldr	r2, .L159+20
	mov	lr, pc
	bx	r5
	mov	r2, #56320
	ldr	r3, .L159+24
	strh	r2, [r4, #8]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r2, .L159+28
	ldr	r3, .L159+32
	ldr	r2, [r2]
	ldr	r3, [r3]
	ldr	r1, .L159+36
	ldr	ip, .L159+40
	sub	r3, r2, r3
	smull	r2, r6, r3, r1
	smull	r1, r2, ip, r3
	mov	lr, #214
	mov	r0, #35
	asr	r8, r3, #31
	rsb	r1, r8, r6, asr #6
	rsb	r2, r8, r2, asr #5
	rsb	r6, r1, r1, lsl #5
	add	r6, r1, r6, lsl #2
	add	r2, r2, r2, lsl #2
	add	r2, r2, r2, lsl #2
	sub	r6, r3, r6, lsl #3
	sub	r1, r3, r2, lsl #2
	smull	r2, r9, r6, ip
	ldr	r2, .L159+44
	smull	r10, fp, r2, r3
	smull	ip, r10, r2, r1
	asr	r6, r6, #31
	rsb	r8, r8, fp, asr #2
	asr	r2, r1, #31
	rsb	r1, r6, r9, asr #5
	add	r8, r8, r8, lsl #2
	ldr	r6, .L159+48
	rsb	r2, r2, r10, asr #2
	lsl	r1, r1, #5
	sub	r3, r3, r8, lsl #1
	lsl	r2, r2, #5
	add	r1, r1, #408
	add	r1, r1, #3
	add	r8, r6, #308
	lsl	r3, r3, #5
	add	r2, r2, #408
	strh	r1, [r8]	@ movhi
	add	r2, r2, #3
	add	r1, r6, #316
	add	r3, r3, #408
	strh	r2, [r1]	@ movhi
	add	r3, r3, #3
	add	r2, r6, #324
	strh	r3, [r2]	@ movhi
	add	r2, r6, #312
	strh	lr, [r2, #2]	@ movhi
	strh	r0, [r2]	@ movhi
	mov	r7, #206
	mov	r2, #222	@ movhi
	add	r3, r6, #320
	add	r1, r6, #304
	strh	r7, [r1, #2]	@ movhi
	strh	r0, [r1]	@ movhi
	strh	r0, [r3]	@ movhi
	strh	r2, [r3, #2]	@ movhi
	ldr	r1, .L159+52
	mov	lr, pc
	bx	r1
	mov	r1, r6
	mov	r0, #3
	mov	r3, #512
	mov	r2, #117440512
	mov	lr, pc
	bx	r5
	mov	r2, #4352
	ldr	r3, .L159+56
	strh	r2, [r4]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r4, .L159+60
	mov	r3, #1
	ldr	r2, .L159+64
	ldr	r1, .L159+68
	ldr	r0, .L159+72
	mov	lr, pc
	bx	r4
	mov	r2, #10
	ldr	r3, .L159+76
	str	r2, [r3]
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L160:
	.align	2
.L159:
	.word	DMANow
	.word	endTiles
	.word	100720640
	.word	endMap
	.word	startSpriteSheetTiles
	.word	100728832
	.word	hideSprites
	.word	currentLevel
	.word	diceNum
	.word	274877907
	.word	1374389535
	.word	1717986919
	.word	shadowOAM
	.word	waitForVBlank
	.word	stopSound
	.word	playSoundA
	.word	11025
	.word	1480320
	.word	EndGameSong
	.word	gameState
	.size	goToEnd, .-goToEnd
	.align	2
	.global	RPSGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	RPSGame, %function
RPSGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L174
	ldr	r4, .L174+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L174+8
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	tst	r3, #8
	beq	.L162
	ldr	r2, .L174+12
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L172
.L162:
	tst	r3, #2
	beq	.L161
	ldr	r3, .L174+12
	ldrh	r3, [r3]
	tst	r3, #2
	bne	.L161
	ldr	r3, .L174+16
	ldr	r3, [r3]
	cmp	r3, #2
	beq	.L173
.L161:
	pop	{r4, lr}
	bx	lr
.L172:
	bl	goToPause
	ldrh	r3, [r4]
	b	.L162
.L173:
	ldr	r3, .L174+20
	ldr	r3, [r3]
	cmp	r3, #0
	popne	{r4, lr}
	bne	goToMainGame
.L164:
	pop	{r4, lr}
	b	goToEnd
.L175:
	.align	2
.L174:
	.word	updateRPSGame
	.word	oldButtons
	.word	drawRPSGame
	.word	buttons
	.word	RPSGameState
	.word	isRPSPlayerWin
	.size	RPSGame, .-RPSGame
	.align	2
	.global	THGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	THGame, %function
THGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L189
	ldr	r4, .L189+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L189+8
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	tst	r3, #8
	beq	.L177
	ldr	r2, .L189+12
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L187
.L177:
	tst	r3, #2
	beq	.L176
	ldr	r3, .L189+12
	ldrh	r3, [r3]
	tst	r3, #2
	bne	.L176
	ldr	r3, .L189+16
	ldr	r3, [r3]
	cmp	r3, #1
	beq	.L188
.L176:
	pop	{r4, lr}
	bx	lr
.L187:
	bl	goToPause
	ldrh	r3, [r4]
	b	.L177
.L188:
	ldr	r3, .L189+20
	ldr	r3, [r3]
	cmp	r3, #0
	popne	{r4, lr}
	bne	goToMainGame
.L179:
	pop	{r4, lr}
	b	goToEnd
.L190:
	.align	2
.L189:
	.word	updateTHGame
	.word	oldButtons
	.word	drawTHGame
	.word	buttons
	.word	THGameState
	.word	isFound
	.size	THGame, .-THGame
	.align	2
	.global	ParomaGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	ParomaGame, %function
ParomaGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L204
	ldr	r4, .L204+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L204+8
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	tst	r3, #8
	beq	.L192
	ldr	r2, .L204+12
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L202
.L192:
	tst	r3, #2
	beq	.L191
	ldr	r3, .L204+12
	ldrh	r3, [r3]
	tst	r3, #2
	bne	.L191
	ldr	r3, .L204+16
	ldr	r3, [r3]
	cmp	r3, #1
	beq	.L203
.L191:
	pop	{r4, lr}
	bx	lr
.L202:
	bl	goToPause
	ldrh	r3, [r4]
	b	.L192
.L203:
	ldr	r3, .L204+20
	ldr	r3, [r3]
	cmp	r3, #0
	popeq	{r4, lr}
	beq	goToMainGame
.L194:
	pop	{r4, lr}
	b	goToEnd
.L205:
	.align	2
.L204:
	.word	updatePAROMAGame
	.word	oldButtons
	.word	drawPAROMAGame
	.word	buttons
	.word	PRGameState
	.word	remainingEnemies
	.size	ParomaGame, .-ParomaGame
	.align	2
	.global	SRGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	SRGame, %function
SRGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L219
	ldr	r4, .L219+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L219+8
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	tst	r3, #8
	beq	.L207
	ldr	r2, .L219+12
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L217
.L207:
	tst	r3, #2
	beq	.L206
	ldr	r3, .L219+12
	ldrh	r3, [r3]
	tst	r3, #2
	bne	.L206
	ldr	r3, .L219+16
	ldr	r3, [r3]
	cmp	r3, #1
	beq	.L218
.L206:
	pop	{r4, lr}
	bx	lr
.L217:
	bl	goToPause
	ldrh	r3, [r4]
	b	.L207
.L218:
	ldr	r3, .L219+20
	ldr	r3, [r3]
	cmp	r3, #0
	popne	{r4, lr}
	bne	goToMainGame
.L209:
	pop	{r4, lr}
	b	goToEnd
.L220:
	.align	2
.L219:
	.word	updateSRGame
	.word	oldButtons
	.word	drawSRGame
	.word	buttons
	.word	SRGameState
	.word	isSRPlayerWin
	.size	SRGame, .-SRGame
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r7, fp, lr}
	ldr	r6, .L252
	ldr	r7, .L252+4
	ldr	r3, .L252+8
	mov	lr, pc
	bx	r3
	ldr	r5, .L252+12
	ldrh	r1, [r7]
	ldr	r2, [r6]
	ldr	fp, .L252+16
	ldr	r10, .L252+20
	ldr	r9, .L252+24
	ldr	r8, .L252+28
	ldr	r4, .L252+32
.L222:
	strh	r1, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [r7]	@ movhi
	cmp	r2, #10
	ldrls	pc, [pc, r2, asl #2]
	b	.L242
.L227:
	.word	.L236
	.word	.L242
	.word	.L235
	.word	.L234
	.word	.L233
	.word	.L232
	.word	.L231
	.word	.L230
	.word	.L229
	.word	.L228
	.word	.L226
.L228:
	ldr	r3, .L252+36
	mov	lr, pc
	bx	r3
	ldrh	r1, [r7]
	ldr	r2, [r6]
	b	.L222
.L229:
	ldr	r3, .L252+40
	mov	lr, pc
	bx	r3
	ldrh	r1, [r7]
	ldr	r2, [r6]
	b	.L222
.L230:
	ldr	r3, .L252+44
	mov	lr, pc
	bx	r3
	ldrh	r1, [r7]
	ldr	r2, [r6]
	b	.L222
.L231:
	ldr	r3, .L252+48
	mov	lr, pc
	bx	r3
	ldrh	r1, [r7]
	ldr	r2, [r6]
	b	.L222
.L232:
	mov	lr, pc
	bx	r8
	ldrh	r1, [r7]
	ldr	r2, [r6]
	b	.L222
.L233:
	mov	lr, pc
	bx	r9
	ldrh	r1, [r7]
	ldr	r2, [r6]
	b	.L222
.L234:
	mov	lr, pc
	bx	r10
	ldrh	r1, [r7]
	ldr	r2, [r6]
	b	.L222
.L236:
	mov	lr, pc
	bx	fp
	ldrh	r1, [r7]
	ldr	r2, [r6]
	b	.L222
.L238:
	strh	r3, [r5]	@ movhi
	ldrh	r2, [r4, #48]
	mov	r1, r3
	mov	r3, r2
	strh	r2, [r7]	@ movhi
.L235:
	tst	r1, #4
	beq	.L238
	tst	r3, #4
	bne	.L238
.L240:
	ldr	r3, .L252+52
	mov	lr, pc
	bx	r3
	ldrh	r1, [r7]
	ldr	r2, [r6]
	b	.L222
.L239:
	strh	r3, [r5]	@ movhi
	ldrh	r2, [r4, #48]
	mov	r1, r3
	mov	r3, r2
	strh	r2, [r7]	@ movhi
.L226:
	tst	r1, #8
	beq	.L239
	tst	r3, #8
	bne	.L239
	b	.L240
.L242:
	mov	r1, r3
	b	.L222
.L253:
	.align	2
.L252:
	.word	gameState
	.word	buttons
	.word	initialize
	.word	oldButtons
	.word	start
	.word	mainGame
	.word	stageIntro
	.word	RPSGame
	.word	67109120
	.word	pause
	.word	SRGame
	.word	ParomaGame
	.word	THGame
	.word	goToStart
	.size	main, .-main
	.text
	.align	2
	.global	end
	.syntax unified
	.arm
	.fpu softvfp
	.type	end, %function
end:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L259
	ldrh	r3, [r3]
	tst	r3, #8
	bxeq	lr
	ldr	r3, .L259+4
	ldrh	r3, [r3]
	tst	r3, #8
	bxne	lr
	b	goToStart
.L260:
	.align	2
.L259:
	.word	oldButtons
	.word	buttons
	.size	end, .-end
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	isStartedGame,4,4
	.comm	currGameState,4,4
	.comm	gameState,4,4
	.comm	SRComputer,128,4
	.comm	SR_vOff,4,4
	.comm	SR_hOff,4,4
	.comm	paromas,192,4
	.comm	enemyBullet,64,4
	.comm	enemies,320,4
	.comm	playerBullets,320,4
	.comm	isCheatOn,4,4
	.comm	enemyBulletTimer,4,4
	.comm	playerBulletTimer,4,4
	.comm	PR_vOff,4,4
	.comm	PR_hOff,4,4
	.comm	TH_vOff,4,4
	.comm	TH_hOff,4,4
	.comm	enemy,64,4
	.comm	RPS1_vOff,4,4
	.comm	RPS1_hOff,4,4
	.comm	RPS0_vOff,4,4
	.comm	RPS0_hOff,4,4
	.comm	door,64,4
	.comm	buttonA,64,4
	.comm	dice,64,4
	.comm	shadowOAM,1024,4
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
