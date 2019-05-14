PRODUCT_NAME       = Project
SOURCES            = main.c myLib.c sound.c startGame.c startBG.c startSpriteSheet.c startBGCollisionMap.c StartGameSong.c instruction.c mainGame.c mainGameBG.c mainGameBG2.c mainGameBG3.c MainGameSong.c rollingDiceSound.c RPSStageIntro.c RPSBG0.c RPSBG1.c RPSGame.c RPSGameSong.c RPSLoseSound.c RPSWinSound.c RPSDrawSound.c THStageIntro.c THBG.c THGame.c THGameSong.c THFailSound.c THLoseSound.c PAROMAStageIntro.c ParomaBG.c ParomaGame.c ParomaSong.c PAROMAFireSound.c PAROMALoseSound.c PAROMAWinSound.c PAROMASound.c getHitSound.c SRStageIntro.c SRBG.c SRGame.c SwimmingRaceSong.c SRCrowdSound.c pause.c end.c EndGameSong.c choosingSound.c transitionSound.c gameEntranceSound.c walkingSound.c
CCPATH             = C:\cygwin64\bin
DKPATH             = C:\devkitPro
VBASIM             = C:\vbam-2.0.1\bin\visualboyadvance-m.exe
FIND               = find
COPY               = cp -r

# --- File Names
ELF_NAME           = $(PRODUCT_NAME).elf
ROM_NAME           = $(PRODUCT_NAME).gba
BIN_NAME           = $(PRODUCT_NAME)

# --- Flags
MODEL              = -mthumb-interwork -marm -mlong-calls
SPECS              = -specs=gba.specs

# --- Archiver
AS                 = $(DKPATH)/devkitARM/bin/arm-none-eabi-as
ASFLAGS            = -mthumb-interwork

# --- Compiler
CC                 = $(DKPATH)/devkitARM/bin/arm-none-eabi-gcc
CFLAGS             = $(MODEL) -O2 -Wall -pedantic -Wextra -std=c99 -save-temps -D_ROM=$(ROM_NAME) -D_VBA=$(VBASIM) 


# --- Linker
LD                 = $(DKPATH)/devkitARM/bin/arm-none-eabi-gcc
LDFLAGS            = $(SPECS) $(MODEL) -lm

# --- Object/Executable Packager
OBJCOPY            = $(DKPATH)/devkitARM/bin/arm-none-eabi-objcopy
OBJCOPYFLAGS       = -O binary

# --- ROM Fixer
GBAFIX             = $(DKPATH)/tools/bin/gbafix

# --- Delete
RM                 = rm -f

OBJECTS = $(SOURCES:.c=.o)


# --- Main build target

all : clean run

run : $(ROM_NAME)
	$(VBASIM) $(ROM_NAME)


build : $(ROM_NAME)

# --- Build .elf file into .gba ROM file
$(ROM_NAME) : $(ELF_NAME)
	$(OBJCOPY) $(OBJCOPYFLAGS) $(ELF_NAME) $(ROM_NAME)
	$(GBAFIX) $(ROM_NAME)

# --- Build .o files into .elf file
$(ELF_NAME) : $(OBJECTS)
	$(LD) $(OBJECTS) $(LDFLAGS) -o $@

# -- Build .c files into .o files
$(OBJECTS) : %.o : %.c
	$(CC) $(CFLAGS) -c $< -o $@



clean:
	$(RM) $(ROM_NAME)
	$(RM) $(ELF_NAME)
	$(RM) $(BIN_NAME)
	$(RM) *.o