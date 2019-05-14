#include "myLib.h"
#include "sound.h"
#include "startGame.h"
#include "startBG.h"
#include "startBGCollisionMap.h"
#include "startSpriteSheet.h"
#include "StartGameSong.h"
#include "instruction.h"
#include "mainGame.h"
#include "mainGameBG.h"
#include "mainGameBG2.h"
#include "mainGameBG3.h"
#include "MainGameSong.h"
#include "RPSStageIntro.h"
#include "RPSBG0.h"
#include "RPSBG1.h"
#include "RPSGame.h"
#include "RPSGameSong.h"
#include "THStageIntro.h"
#include "THBG.h"
#include "THGame.h"
#include "THGameSong.h"
#include "PAROMAStageIntro.h"
#include "ParomaBG.h"
#include "ParomaGame.h"
#include "ParomaSong.h"
#include "SRStageIntro.h"
#include "SRBG.h"
#include "SRGame.h"
#include "SwimmingRaceSong.h"
#include "SRCrowdSound.h"
#include "pause.h"
#include "end.h"
#include "EndGameSong.h"
#include <time.h>
// ============== Sound Effects ===================
#include "transitionSound.h"
#include "gameEntranceSound.h"
// ================================================


// Prototypes
void initialize();
void goToStart();
void start();
void goToInstruction();
void instruction();
void goToMainGame();
void mainGame();
void goToStageIntro();
void stageIntro();
void goToRPSGame();
void RPSGame();
void goToTHGame();
void THGame();
void goToParomaGame();
void ParomaGame();
void goToSRGame();
void SRGame();
void goToBonusGame();
void bonusGame();
void goToPause();
void pause();
void goToEnd();
void end();

// Game States
int gameState;
int currGameState;
int isStartedGame;

// Button Variables
unsigned short buttons;
unsigned short oldButtons;

// Sprites
OBJ_ATTR shadowOAM[128];

int main() {

    initialize();

    while(1) {

        // Update button variables
        oldButtons = buttons;
        buttons = BUTTONS;
                
        // State Machine
        switch(gameState) {

            case START:
                start();
                break;
            case INSTRUCTION:
                instruction();
                break;
            case MAINGAME:
                mainGame();
                break;
            case STAGEINTRO:
                stageIntro();
                break;
            case RPSGAME:
                RPSGame();
                break;
            case THGAME:
                THGame();
                break;
            case PAROMAGAME:
                ParomaGame();
                break;
            case SRGAME:
                SRGame();
                break;
            case PAUSE:
                pause();
                break;
            case END:
                end();
                break;
        }
    }
}

// Set the GBA
void initialize() {

    // Load the entire palette 
    DMANow(3, startBGPal, PALETTE, 256);

    // Set buttons
    buttons = BUTTONS;

    // Set up sound system
    setupSounds();
    setupInterrupts();

    // Random seed with time(NULL)
    srand(time(NULL));

    // State Transition to Splash Screen
    goToStart();
}

// ====================== START ========================
// Set the Splash Screen
void goToStart() {

    // Adjust SMALL Screen
    REG_BG0HOFF = 0;
    REG_BG0VOFF = 0;

    if (gameState != PAUSE && gameState != INSTRUCTION) {

        // Play StartGameSong
        playSoundA(StartGameSong, STARTGAMESONGLEN, STARTGAMESONGFREQ, 1);

        // Initialize Start Screen
        initStartGame();

    } else {

        // Transition Sound
        stopSoundB();
        playSoundB(transitionSound, TRANSITIONSOUNDLEN, TRANSITIONSOUNDFREQ, 0);
    }

    // Load the START Screen spritesheet palette
    DMANow(3, startSpriteSheetPal, SPRITEPALETTE, 256);

    // Set up START Screen
    DMANow(3, startBGTiles, &CHARBLOCK[0], startBGTilesLen / 2);
    DMANow(3, startBGMap, &SCREENBLOCK[28], startBGMapLen / 2);

    // Load the sprite sheet's Tiles
    DMANow(3, startSpriteSheetTiles, &CHARBLOCK[4], startSpriteSheetTilesLen / 2);

    // Register Background_0
    REG_BG0CNT = BG_SIZE_LARGE | BG_CHARBLOCK(0) | BG_SCREENBLOCK(28);

    // Hide all sprites
    hideSprites();

    // Set Display Control
    REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;    

    // State Transition to START screen
    gameState = START;
}

// Splash Screen & Menu Screen
void start() {

    updateStartGame();
    drawStartGame();

    // State Transition
    if (isOnMenu) {

        // Move to the Splash Screen
        if (BUTTON_PRESSED(BUTTON_SELECT) || goingOnMenu) {

            movingScreen();
        }

        // Move to MainGame
        if (BUTTON_PRESSED(BUTTON_B)) {

            switch (menuOption) {

                case NONE:
                    break;
                case MENU_INSTRUCTION:
                    goToInstruction();
                    break;
                case MENU_GAMESTART:
                    isStartedGame = 1;
                    goToMainGame();
                    break;
                default:
                    break;
            }
        }
    } else {

        // Move to the Menu Screen
        if (BUTTON_PRESSED(BUTTON_START) || goingOnMenu) {

            movingScreen();
        }
    }
    
}


// ================ INSTRUCTION ===================
// Set the Instruction Screen
void goToInstruction() {

    // Transition Sound
    stopSoundB();
    playSoundB(transitionSound, TRANSITIONSOUNDLEN, TRANSITIONSOUNDFREQ, 0);

    // Adjust SMALL Screen
    REG_BG0HOFF = 0;
    REG_BG0VOFF = 0;

    // Set up Instruction Screen
    DMANow(3, instructionTiles, &CHARBLOCK[0], instructionTilesLen / 2);
    DMANow(3, instructionMap, &SCREENBLOCK[28], instructionMapLen / 2);

    // Register Background_0
    REG_BG0CNT = BG_SIZE_LARGE | BG_CHARBLOCK(0) | BG_SCREENBLOCK(28);

    // Set Display Control
    REG_DISPCTL = MODE0 | BG0_ENABLE;

    // State Transition to INSTRUCTION screen
    gameState = INSTRUCTION;
}

// Instruction Screen
void instruction() {

    // State Transition to MENU screen
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToStart();
    }
}


// ================ MAINGAME ====================
// Set the MainGame Screen
void goToMainGame() {

    if (gameState != PAUSE) {

        // Set MainGame BGM and transition sound
        stopSound();
        playSoundA(MainGameSong, MAINGAMESONGLEN, MAINGAMESONGFREQ, 1);
        playSoundB(transitionSound, TRANSITIONSOUNDLEN, TRANSITIONSOUNDFREQ, 0);

        // Initialize mainGame
        initMainGame();

    } else {

        // Unpause the sound
        unpauseSound();
    }

    // Hide all sprites
    hideSprites();

    // Set up MainGame Screen
    DMANow(3, mainGameBGTiles, &CHARBLOCK[0], mainGameBGTilesLen / 2);
    DMANow(3, mainGameBGMap, &SCREENBLOCK[30], mainGameBGMapLen / 2);
    DMANow(3, mainGameBG2Tiles, &CHARBLOCK[2], mainGameBG2TilesLen / 2);
    DMANow(3, mainGameBG2Map, &SCREENBLOCK[28], mainGameBG2MapLen / 2);
    DMANow(3, mainGameBG3Tiles, &CHARBLOCK[3], mainGameBG3TilesLen / 2);
    DMANow(3, mainGameBG3Map, &SCREENBLOCK[26], mainGameBG3MapLen / 2);

    // Load the sprite sheet's Tiles
    DMANow(3, startSpriteSheetTiles, &CHARBLOCK[4], startSpriteSheetTilesLen / 2);

    // Register Background_0
    REG_BG0CNT = BG_SIZE_WIDE | BG_CHARBLOCK(0) | BG_SCREENBLOCK(30);
    REG_BG1CNT = BG_SIZE_WIDE | BG_CHARBLOCK(2) | BG_SCREENBLOCK(28);
    REG_BG2CNT = BG_SIZE_WIDE | BG_CHARBLOCK(3) | BG_SCREENBLOCK(26);

    // Set Display Control
    REG_DISPCTL = MODE0 | BG0_ENABLE | BG1_ENABLE | BG2_ENABLE | SPRITE_ENABLE;

    // State Transition to MAINGAME screen
    gameState = MAINGAME;

    // Remember the current game state
    currGameState = MAINGAME;
}

// MainGame Screen
void mainGame() {

    updateMainGame();
    drawMainGame();

    // State Transition to PAUSE Screen
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToPause();
        // goToRPSGame();
        // goToTHGame();
        // goToParomaGame();
        // goToSRGame();
    }

    // State Transition to stage Intro
    if (isRolled && isAtDoor) {

        if (BUTTON_PRESSED(BUTTON_B)) {

            stopSoundB();
            playSoundB(gameEntranceSound, GAMEENTRANCESOUNDLEN, GAMEENTRANCESOUNDFREQ, 0);
            isStartedGame = 0;
            currentLevel += diceNum;
            goToStageIntro();
        }
    }
    
}


// =============== STAGE INTRO ====================
void goToStageIntro() {

    // Adjust SMALL Screen
    REG_BG0HOFF = 0;
    REG_BG0VOFF = 0;

    // Stop the sound first
    stopSoundA();

    // Show each stage intro
    switch (randGame) {

        case RPSGAME:
            // Set up Rock-Paper-Scissor Game Stage Intro Screen
            playSoundA(RPSGameSong, RPSGAMESONGLEN, RPSGAMESONGFREQ, 1);
            DMANow(3, RPSStageIntroTiles, &CHARBLOCK[0], RPSStageIntroTilesLen / 2);
            DMANow(3, RPSStageIntroMap, &SCREENBLOCK[28], RPSStageIntroMapLen / 2);
            break;
        case THGAME:
            // Set up Treasure hunt Game Stage Intro Screen
            playSoundA(THGameSong, THGAMESONGLEN, THGAMESONGFREQ, 1);
            DMANow(3, THStageIntroTiles, &CHARBLOCK[0], THStageIntroTilesLen / 2);
            DMANow(3, THStageIntroMap, &SCREENBLOCK[28], THStageIntroMapLen / 2);
            break;
        case PAROMAGAME:
            // Set up PAROMA Game Stage Intro Screen
            playSoundA(ParomaSong, PAROMASONGLEN, PAROMASONGFREQ, 1);
            DMANow(3, PAROMAStageIntroTiles, &CHARBLOCK[0], PAROMAStageIntroTilesLen / 2);
            DMANow(3, PAROMAStageIntroMap, &SCREENBLOCK[28], PAROMAStageIntroMapLen / 2);
            break;
        case SRGAME:
            // Set up Swimming Race Game Stage Intro Screen
            playSoundA(SwimmingRaceSong, SWIMMINGRACESONGLEN, SWIMMINGRACESONGFREQ, 1);
            DMANow(3, SRStageIntroTiles, &CHARBLOCK[0], SRStageIntroTilesLen / 2);
            DMANow(3, SRStageIntroMap, &SCREENBLOCK[28], SRStageIntroMapLen / 2);
            break;
        default:
            break;
    }

    // Register Stage Intro
    REG_BG0CNT = BG_SIZE_LARGE | BG_CHARBLOCK(0) | BG_SCREENBLOCK(28);
    REG_BG0HOFF = 0;
    REG_BG0VOFF = 0;
    
    // Hide all sprites
    hideSprites();

    // Set Display Control
    REG_DISPCTL = MODE0 | BG0_ENABLE;

    // Transition to stage Intro Screen
    gameState = STAGEINTRO;
}

void stageIntro() {

    // State transition to the actual game screen
    if (BUTTON_PRESSED(BUTTON_A)) {

        switch (randGame) {

            case RPSGAME:
                goToRPSGame();
                break;
            case THGAME:
                goToTHGame();
                break;
            case PAROMAGAME:
                goToParomaGame();
                break;
            case SRGAME:
                goToSRGame();
                break;
            default:
                break;
        }
    }
}


// ================= RPSGAME ====================
// Set the Rock-Paper-Scissor Game Screen
void goToRPSGame() {

    if (gameState != PAUSE) {

        // Initialize RPSGame
        initRPSGame();

        // Hide all sprites
        hideSprites();
    }

    // Set up Rock-Paper-Scissor Game Screen
    DMANow(3, RPSBG0Tiles, &CHARBLOCK[0], RPSBG0TilesLen / 2);
    DMANow(3, RPSBG0Map, &SCREENBLOCK[30], RPSBG0MapLen / 2);
    DMANow(3, RPSBG1Tiles, &CHARBLOCK[1], RPSBG1TilesLen / 2);
    DMANow(3, RPSBG1Map, &SCREENBLOCK[28], RPSBG1MapLen / 2);

    // Load the sprite sheet's Tiles
    DMANow(3, startSpriteSheetTiles, &CHARBLOCK[4], startSpriteSheetTilesLen / 2);

    // Register Background_0
    REG_BG0CNT = BG_SIZE_WIDE | BG_CHARBLOCK(0) | BG_SCREENBLOCK(30);
    REG_BG1CNT = BG_SIZE_WIDE | BG_CHARBLOCK(1) | BG_SCREENBLOCK(28);

    // Set Display Control
    REG_DISPCTL = MODE0 | BG0_ENABLE | BG1_ENABLE | SPRITE_ENABLE;

    // State Transition to Rock-Paper-Scissor Game screen
    gameState = RPSGAME;

    // Remember the current game state
    currGameState = RPSGAME;
}

// Rock-Paper-Scissor Game Screen
void RPSGame() {

    updateRPSGame();
    drawRPSGame();

    // State Transition to PAUSE screen
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToPause();
    }

    // State Transition to Next Screen
    if (BUTTON_PRESSED(BUTTON_B) && RPSGameState == RPSGAMESET) {

        if (isRPSPlayerWin) {
            goToMainGame();
        } else {
            goToEnd();
        }
    }
}


// ================= THGAME =====================
// Set the Treasure Hunt Game Screen
void goToTHGame() {

    if (gameState != PAUSE) {

        // Initialize THGame
        initTHGame();

        // Hide all sprites
        hideSprites();
    }

    // Set up Tresure Hunt Game Screen
    DMANow(3, THBGTiles, &CHARBLOCK[0], THBGTilesLen / 2);
    DMANow(3, THBGMap, &SCREENBLOCK[31], THBGMapLen / 2);

    // Load the sprite sheet's Tiles
    DMANow(3, startSpriteSheetTiles, &CHARBLOCK[4], startSpriteSheetTilesLen / 2);

    // Register Background_0
    REG_BG0CNT = BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(31);

    // Set Display Control
    REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;

    // State Transition to Treasure Hunt Game screen
    gameState = THGAME;

    // Remember the current game state
    currGameState = THGAME;
}

// Treasure Hunt Game Screen
void THGame() {

    updateTHGame();
    drawTHGame();

    // State Transition to PAUSE screen
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToPause();
    }

    // State Transition to Next Screen
    if (BUTTON_PRESSED(BUTTON_B) && THGameState == THGAMESET) {

        if (isFound) {
            goToMainGame();
        } else {
            goToEnd();
        }
    }
}


// =============== PAROMAGAME ===================
// Set the Paroma Game Screen
void goToParomaGame() {

    if (gameState != PAUSE) {

        // Initialize PAROMA game
        initPAROMAGame();

        // Hide all sprites
        hideSprites();
    }

    // Set up Paroma Game Screen
    DMANow(3, ParomaBGTiles, &CHARBLOCK[0], ParomaBGTilesLen / 2);
    DMANow(3, ParomaBGMap, &SCREENBLOCK[31], ParomaBGMapLen / 2);

    // Load the sprite sheet's Tiles
    DMANow(3, startSpriteSheetTiles, &CHARBLOCK[4], startSpriteSheetTilesLen / 2);

    // Register Background_0
    REG_BG0CNT = BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(31);

    // Set Display Control
    REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;

    // State Transition to Paroma Game Screen
    gameState = PAROMAGAME;

    // Remember the current game state
    currGameState = PAROMAGAME;
}


// Paroma Game Screen
void ParomaGame() {

    updatePAROMAGame();
    drawPAROMAGame();

    // State Transition to PAUSE screen
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToPause();
    }

    // State Transition to Next Screen
    if (BUTTON_PRESSED(BUTTON_B) && PRGameState == PRGAMESET) {

        if (remainingEnemies == 0) {
            goToMainGame();
        } else {
            goToEnd();
        }
    }
}


// ================= SRGAME =====================
// Set the Swimming Race Game Screen
void goToSRGame() {

    if (gameState != PAUSE) {

        // Crowd Sound
        stopSoundB();
        playSoundB(SRCrowdSound, SRCROWDSOUNDLEN, SRCROWDSOUNDFREQ, 1);

        // Initialize Swimming Race game
        initSRGame();

        // Hide all sprites
        hideSprites();
    }

    // Set up Swimming Race Game Screen
    DMANow(3, SRBGTiles, &CHARBLOCK[0], SRBGTilesLen / 2);
    DMANow(3, SRBGMap, &SCREENBLOCK[28], SRBGMapLen / 2);

    // Load the sprite sheet's Tiles
    DMANow(3, startSpriteSheetTiles, &CHARBLOCK[4], startSpriteSheetTilesLen / 2);

    // Register Background_0
    REG_BG0CNT = BG_SIZE_LARGE | BG_CHARBLOCK(0) | BG_SCREENBLOCK(28);

    // Hide all sprites
    hideSprites();

    // Set Display Control
    REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;

    // State Transition to Swimming Race Game Screen
    gameState = SRGAME;

    // Remember the current game state
    currGameState = SRGAME;
}

// Swimming Race Game Screen
void SRGame() {

    updateSRGame();
    drawSRGame();

    // State Transition to PAUSE screen
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToPause();
    }

    // State Transition to MainGame Screen
    if (BUTTON_PRESSED(BUTTON_B) && SRGameState == SRGAMESET) {

        if (isSRPlayerWin) {
            goToMainGame();
        } else {
            goToEnd();
        }
    }
}

// ================== PAUSE ======================
// Set the Pause Screen
void goToPause() {

    // Adjust SMALL Screen
    REG_BG3HOFF = 0;
    REG_BG3VOFF = 0;

    // Set up PAUSE Screen
    DMANow(3, pauseTiles, &CHARBLOCK[0], pauseTilesLen / 2);
    DMANow(3, pauseMap, &SCREENBLOCK[31], pauseMapLen / 2);

    // Load the sprite sheet's Tiles
    DMANow(3, startSpriteSheetTiles, &CHARBLOCK[4], startSpriteSheetTilesLen / 2);

    // Register Background_0
    REG_BG3CNT = BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(31);

    // Hide all sprites
    // hideSprites();

    // Set Display Control
    REG_DISPCTL = MODE0 | BG3_ENABLE;

    // Pause the sound
    pauseSound();

    // State Transition to PAUSE screen
    gameState = PAUSE;
}

// Pause Screen
void pause() {

    // State Transition to MAINGAME screen
    if (BUTTON_PRESSED(BUTTON_START)) {

        // Unpause Sound
        unpauseSound();

        switch (currGameState) {
            case MAINGAME:
                goToMainGame();
                break;
            case RPSGAME:
                goToRPSGame();
                break;
            case THGAME:
                goToTHGame();
                break;
            case PAROMAGAME:
                goToParomaGame();
                break;
            case SRGAME:
                goToSRGame();
                break;
        }
    }
}

// =================== END =======================
// Set the End Screen
void goToEnd() {

    // Adjust SMALL Screen
    REG_BG0HOFF = 0;
    REG_BG0VOFF = 0;

    // Set up Swimming Race Game Screen
    DMANow(3, endTiles, &CHARBLOCK[0], endTilesLen / 2);
    DMANow(3, endMap, &SCREENBLOCK[28], endMapLen / 2);

    // Load the sprite sheet's Tiles
    DMANow(3, startSpriteSheetTiles, &CHARBLOCK[4], startSpriteSheetTilesLen / 2);

    // Register Background_0
    REG_BG0CNT = BG_SIZE_LARGE | BG_CHARBLOCK(0) | BG_SCREENBLOCK(28);

    // Hide all sprites
    hideSprites();

    // Put the final score
    shadowOAM[38].attr0 = 35 | ATTR0_SQUARE;
    shadowOAM[38].attr1 = 206 | ATTR1_TINY;
    shadowOAM[38].attr2 = ATTR2_TILEID(12 + (((currentLevel - diceNum) % 1000) / 100), 27);
    shadowOAM[39].attr0 = 35 | ATTR0_SQUARE;
    shadowOAM[39].attr1 = 214 | ATTR1_TINY;
    shadowOAM[39].attr2 = ATTR2_TILEID(12 + (((currentLevel - diceNum) % 100) / 10), 27);
    shadowOAM[40].attr0 = 35 | ATTR0_SQUARE;
    shadowOAM[40].attr1 = 222 | ATTR1_TINY;
    shadowOAM[40].attr2 = ATTR2_TILEID(12 + ((currentLevel - diceNum) % 10), 27);
    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 128 * 4);

    // Set Display Control
    REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;

    // Set the End BGM
    stopSound();
    playSoundA(EndGameSong, ENDGAMESONGLEN, ENDGAMESONGFREQ, 1);

    // State Transition to END screen
    gameState = END;
}

// End Screen
void end() {

    // State Transition to MENU screen
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
    }
}