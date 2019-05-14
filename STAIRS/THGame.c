#include "myLib.h"
#include "sound.h"
#include "THGame.h"


// Variables
int TH_vOff, TH_hOff;
int THGameState, playerLives, isFound;
OBJ_ATTR shadowOAM[128];
ANISPRITE playerSelect, bushes[BUSHNUMBER], treasure;
 

// ================= Game Control ==================
// Initialize the game
void initTHGame() {

	// Set up THGame Screen
    TH_vOff = 0;
    TH_hOff = 0;

    // Initialize playerLives
    playerLives = NUMBEROFTRIAL;
    isFound = 0;

    // TH Game State
    THGameState = THCHOOSING;

    // Init Objects
    initBush();
    initTreasure();
    initSelect();
}

// Updates the game each frame
void updateTHGame() {

    // Update objects
	updateBush();
    updateTreasure();
    updateSelect();
}

// Draws the game each frame
void drawTHGame() {

    // Draw objects
    drawTreasure();
    for (int i = 0; i < BUSHNUMBER; i++)
        drawBush(&bushes[i]);
    drawSelect();

    if (THGameState == THGAMESET) 
        drawTHGameSet();

    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 128 * 4);

    REG_BG0HOFF = TH_hOff;
    REG_BG0VOFF = TH_vOff;
}

// ==================== Bush =====================
// Initialize the bush
void initBush() {

    for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 3; j++) {

            // Bush Index
            bushes[i * 3 + j].index = i * 3 + j;

            // Bush dimension
            bushes[i * 3 + j].width = 32;
            bushes[i * 3 + j].height = 32;

            // Bush Location
            bushes[i * 3 + j].screenRow = (bushes[i * 3 + j].height + 1) * i + 30;
            bushes[i * 3 + j].screenCol = 70 + (bushes[i * 3 + j].width + 1) * j;

            // Bush State
            bushes[i * 3 + j].active = 1;
        }
    }
}

// 
void updateBush() {

}

// Draw the bushes
void drawBush(ANISPRITE* bush) {

    if (bush->active) {
        shadowOAM[bush->index + 16].attr0 = bush->screenRow | ATTR0_SQUARE;
        shadowOAM[bush->index + 16].attr1 = bush->screenCol | ATTR1_MEDIUM;
        shadowOAM[bush->index + 16].attr2 = ATTR2_TILEID(4, 24);
    } else {
        shadowOAM[bush->index + 16].attr0 = ATTR0_HIDE;
    }
}


// ==================== Treasure =====================
void initTreasure() {

    // Treasure Index
    treasure.index = rand() % 9;

    // Treasure Location
    treasure.screenRow = bushes[treasure.index].screenRow;
    treasure.screenCol = bushes[treasure.index].screenCol;

    // Enemy dimension
    treasure.width = 32;
    treasure.height = 32;
}

void updateTreasure() {
    
}

void drawTreasure() {

    //
    shadowOAM[25].attr0 = treasure.screenRow | ATTR0_SQUARE;
    shadowOAM[25].attr1 = treasure.screenCol | ATTR1_MEDIUM;
    shadowOAM[25].attr2 = ATTR2_TILEID(8, 24);
}


// =================== SELECT ===================
void initSelect() {

    // SELECT Index
    playerSelect.index = 0;

    // SELECT Location
    playerSelect.screenRow = bushes[0].screenRow;
    playerSelect.screenCol = bushes[0].screenCol;

    // SELECT Dimension
    playerSelect.width = 32;
    playerSelect.height = 32;
}

void updateSelect() {

    if (THGameState == THCHOOSING) {

        // To Cheat
        if (BUTTON_PRESSED(BUTTON_L) && playerLives == 5) {
            playerLives = CHEAT_NUMBEROFTRIAL;
        }
    
        // Moving
        if (BUTTON_PRESSED(BUTTON_UP) && (playerSelect.screenRow > 30) ) {

            // Choosing Sound
            stopSoundB();
            playSoundB(choosingSound, CHOOSINGSOUNDLEN, CHOOSINGSOUNDFREQ, 0);

            playerSelect.screenRow -= 33;
            playerSelect.index -= 3;
        }
        if (BUTTON_PRESSED(BUTTON_DOWN) && (playerSelect.screenRow < 96)) {

            // Choosing Sound
            stopSoundB();
            playSoundB(choosingSound, CHOOSINGSOUNDLEN, CHOOSINGSOUNDFREQ, 0);

            playerSelect.screenRow += 33;
            playerSelect.index += 3;
        }
        if (BUTTON_PRESSED(BUTTON_LEFT) && (playerSelect.screenCol > 70)) {

            // Choosing Sound
            stopSoundB();
            playSoundB(choosingSound, CHOOSINGSOUNDLEN, CHOOSINGSOUNDFREQ, 0);

            playerSelect.screenCol -= 33;
            playerSelect.index--;
        }
        if (BUTTON_PRESSED(BUTTON_RIGHT) && (playerSelect.screenCol < 136)) {

            // Choosing Sound
            stopSoundB();
            playSoundB(choosingSound, CHOOSINGSOUNDLEN, CHOOSINGSOUNDFREQ, 0);
            
            playerSelect.screenCol += 33;
            playerSelect.index++;
        }
    
        // To select
        if (BUTTON_PRESSED(BUTTON_A) && bushes[playerSelect.index].active) {

            // Hide the selected bush
            bushes[playerSelect.index].active = 0;

            // Decrement playerLives
            playerLives--;

            // When found
            if (playerSelect.index == treasure.index) {

                stopSoundB();
                playSoundB(RPSWinSound, RPSWINSOUNDLEN, RPSWINSOUNDFREQ, 0);

                isFound = 1;
                THGameState = THGAMESET;
            } else {

                // Make Fail Sound
                stopSoundB();
                playSoundB(THFailSound, THFAILSOUNDLEN, THFAILSOUNDFREQ, 0);
            }

            // When playerLives get empty
            if (playerLives == 0) {

                // if player failed to find, play lose sound
                if (!isFound) {

                    stopSoundB();
                    playSoundB(THLoseSound, THLOSESOUNDLEN, THLOSESOUNDFREQ, 0);
                }

                THGameState = THGAMESET;
            }
        }
    } 
}

void drawSelect() {

    shadowOAM[26].attr0 = playerSelect.screenRow | ATTR0_SQUARE;
    shadowOAM[26].attr1 = playerSelect.screenCol | ATTR1_MEDIUM;
    shadowOAM[26].attr2 = ATTR2_TILEID(28, 12);
}

void drawTHGameSet() {

    // Win or Lose
    shadowOAM[15].attr0 = 10 | ATTR0_WIDE;
    shadowOAM[15].attr1 = 10 | ATTR1_MEDIUM;
    shadowOAM[15].attr2 = ATTR2_TILEID(28 + 2 * isFound, 16);

    // Button B
    shadowOAM[36].attr0 = 30 | ATTR0_SQUARE;
    shadowOAM[36].attr1 = 30 | ATTR1_SMALL;
    shadowOAM[36].attr2 = ATTR2_TILEID(28, 30);
}