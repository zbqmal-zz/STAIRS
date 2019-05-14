#include "myLib.h"
#include "sound.h"
#include "startGame.h"
#include "startBGCollisionMap.h"


// Variables
int SG_vOff, SG_hOff;
int isOnMenu, goingOnMenu, menuOption, walkingSoundFlag;
OBJ_ATTR shadowOAM[128];
ANISPRITE character_S1, character_T, character_A, character_I, character_R, character_S2;
ANISPRITE player, highlighter, buttonB;

 

// ================= Game Control ==================
// Initialize the game
void initStartGame() {

	// Place screen on map's left, splash screen
    SG_vOff = 0;
    SG_hOff = 0;
    isOnMenu = 0;
    goingOnMenu = 0;
    walkingSoundFlag = 0;

    initSGPlayer();
    initTitle();
    initHighlighter();
    initButtonB();
}

// Updates the game each frame
void updateStartGame() {

	updateSGPlayer();
    updateTitle();
    updateHighlighter();
    updateButtonB();
}

// Draws the game each frame
void drawStartGame() {

    drawSGPlayer();
    drawTitle();
    drawHighlighter();
    drawButtonB();

    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 128 * 4);

    REG_BG0HOFF = SG_hOff;
    REG_BG0VOFF = SG_vOff;
}

// ==================== Player =====================
// Initialize the player
void initSGPlayer() {

    // Locate the Player
    player.worldRow = 115;
    player.worldCol = 130 + 240;
    player.screenRow = 0;
    player.screenCol = 0;

    // Player's speed of moving
    player.rdel = 1;
    player.cdel = 1;

    // Player's dimension
    player.width = 16;
    player.height = 24;

    // Animation
    player.aniCounter = 0;
    player.aniState = PLAYERSTAND;
    player.curFrame = 0;
    player.numFrames = 3;
}

// Handle every-frame actions of the player
void updateSGPlayer() {

    // Default animatio state is standing
    player.aniState = PLAYERSTAND;

    if (isOnMenu) {

        // Motion of Player
        if (BUTTON_HELD(BUTTON_UP) || BUTTON_HELD(BUTTON_DOWN) || BUTTON_HELD(BUTTON_RIGHT) || BUTTON_HELD(BUTTON_LEFT)) {

            if (BUTTON_HELD(BUTTON_UP)) {

                if ((startBGCollisionMapBitmap[OFFSET(player.worldRow + 12 - 1, player.worldCol + 10, SG_MAPWIDTH)])
                    && (startBGCollisionMapBitmap[OFFSET(player.worldRow + 12 - 1, player.worldCol + 10 + (player.width - 1), SG_MAPWIDTH)])) {

                    // Turn on walkingSoundFlag
                    if (!walkingSoundFlag) {
                        walkingSoundFlag = 1;
                        stopSoundB();
                        playSoundB(walkingSound, WALKINGSOUNDLEN, WALKINGSOUNDFREQ, 1);
                    }

                    // Location update
                    player.worldRow -= player.rdel;

                    // Animation State update
                    player.aniState = PLAYERBACK;

                } else {

                    // stop walkingSound
                    walkingSoundFlag = 0;
                    stopSoundB();
                }
            } else if (BUTTON_HELD(BUTTON_DOWN)) {

                if ((player.worldRow + (player.height - 1) + 1 < 160)
                    && (startBGCollisionMapBitmap[OFFSET(player.worldRow + (player.height - 1), player.worldCol + 10, SG_MAPWIDTH)])
                    && (startBGCollisionMapBitmap[OFFSET(player.worldRow + (player.height - 1), player.worldCol + 10 + (player.width - 1), SG_MAPWIDTH)])) {

                    // Turn on walkingSoundFlag
                    if (!walkingSoundFlag) {
                        walkingSoundFlag = 1;
                        stopSoundB();
                        playSoundB(walkingSound, WALKINGSOUNDLEN, WALKINGSOUNDFREQ, 1);
                    }

                    // Location update
                    player.worldRow += player.rdel;

                    // Animation State update
                    player.aniState = PLAYERFRONT;
                } else {

                    // stop walkingSound
                    walkingSoundFlag = 0;
                    stopSoundB();
                }
            } else if (BUTTON_HELD(BUTTON_LEFT)) {

                if ((startBGCollisionMapBitmap[OFFSET(player.worldRow + 12, player.worldCol + 9, SG_MAPWIDTH)])
                    && (startBGCollisionMapBitmap[OFFSET(player.worldRow + (player.height - 1), player.worldCol + 9, SG_MAPWIDTH)])) {

                    // Turn on walkingSoundFlag
                    if (!walkingSoundFlag) {
                        walkingSoundFlag = 1;
                        stopSoundB();
                        playSoundB(walkingSound, WALKINGSOUNDLEN, WALKINGSOUNDFREQ, 1);
                    }

                    // Location update
                    player.worldCol -= player.cdel;

                    // Animation State update
                    player.aniState = PLAYERLEFT;
                } else {

                    // stop walkingSound
                    walkingSoundFlag = 0;
                    stopSoundB();
                }
            } else if (BUTTON_HELD(BUTTON_RIGHT)) {

                if ((player.worldCol + (player.width - 1) + player.cdel < 480)
                    && (startBGCollisionMapBitmap[OFFSET(player.worldRow + 12, player.worldCol + 10 + (player.width - 1) + 1, SG_MAPWIDTH)])
                    && (startBGCollisionMapBitmap[OFFSET(player.worldRow + (player.height - 1), player.worldCol + 10 + (player.width - 1) + 1, SG_MAPWIDTH)])) {

                    // Turn on walkingSoundFlag
                    if (!walkingSoundFlag) {
                        walkingSoundFlag = 1;
                        stopSoundB();
                        playSoundB(walkingSound, WALKINGSOUNDLEN, WALKINGSOUNDFREQ, 1);
                    }

                    // Location update
                    player.worldCol += player.cdel;

                    // Animation State update
                    player.aniState = PLAYERRIGHT;
                } else {

                    // stop walkingSound
                    walkingSoundFlag = 0;
                    stopSoundB();
                }
            }

        } else {

            // Stop walkingSound
            stopSoundB();
            walkingSoundFlag = 0;
        }
        

        // Motion change per 20fps
        if (++player.aniCounter % 10 == 0) {
            if (++player.curFrame == player.numFrames) {
                player.curFrame = 0;
            }

            // Initialize aniCounter
            player.aniCounter = 0;
        }
    }    

    // Update player's screen locations
    player.screenRow = player.worldRow - SG_vOff;
    player.screenCol = player.worldCol - SG_hOff;
}

// Draw the player
void drawSGPlayer() {

    if (player.screenCol > 0) {
        shadowOAM[6].attr0 = player.screenRow | ATTR0_TALL;
        shadowOAM[6].attr1 = player.screenCol | ATTR1_MEDIUM;
        shadowOAM[6].attr2 = ATTR2_TILEID(4 * player.curFrame, 4 + 2 * player.aniState);
    }
}

// ==================== Arrow =====================
void initHighlighter() {

    // Location (default: hiding)
    highlighter.screenRow = 0;
    highlighter.screenCol = 0;

    // Highlighter dimension
    highlighter.width = 16;
    highlighter.height = 16;

    // TODO : Animation

    // Highlighter state
    highlighter.active = 0;
    menuOption = NONE;
}

void updateHighlighter() {

    // Set highlighter inactive first
    highlighter.active = 0;
    buttonB.active = 0;

    // When in front of Instruction
    if (player.screenRow > 80 && player.screenRow < 110 && player.screenCol > 125 && player.screenCol < 155) {

        // Locate highlighter
        highlighter.screenRow = 55;
        highlighter.screenCol = 105;

        // Turn active on
        highlighter.active = 1;
        buttonB.active = 1;

        // Menu Option
        menuOption = MENU_INSTRUCTION;
    }

    // When in front of GameStart
    if (player.screenRow > 70 && player.screenRow < 110 && player.screenCol > 195 && player.screenCol < 210) {

        // Locate highlighter
        highlighter.screenRow = 10;
        highlighter.screenCol = 175;

        // Turn active on
        highlighter.active = 1;
        buttonB.active = 1;

        // Menu Option
        menuOption = MENU_GAMESTART;
    }
}

void drawHighlighter() {

    if (highlighter.active && isOnMenu) {
        shadowOAM[7].attr0 = highlighter.screenRow | ATTR0_SQUARE;
        shadowOAM[7].attr1 = highlighter.screenCol | ATTR1_SMALL;
        shadowOAM[7].attr2 = ATTR2_TILEID(24, 0);
    } else {
        shadowOAM[7].attr0 = ATTR0_HIDE;
    }
}

// ================================= ButtonB =================================
void initButtonB() {

    // Location
    buttonB.screenRow = 0;
    buttonB.screenCol = 0;

    // Dimension
    buttonB.width = 8;
    buttonB.height = 8;

    // Active
    buttonB.active = 0;
}

void updateButtonB() {

    // Always update button's location
    buttonB.screenRow = player.screenRow + player.height + 3;
    buttonB.screenCol = player.screenCol;
}

void drawButtonB() {

    if (buttonB.active) {

        shadowOAM[35].attr0 = buttonB.screenRow | ATTR0_SQUARE;
        shadowOAM[35].attr1 = buttonB.screenCol | ATTR1_SMALL;
        shadowOAM[35].attr2 = ATTR2_TILEID(28, 30);

    } else {

        shadowOAM[35].attr0 = ATTR0_HIDE;
    }
}

// ==================== Title =====================
void initTitle() {
    
    // S1
    character_S1.worldRow = 80;
    character_S1.worldCol = 20;
    character_S1.rdel = 1;
    character_S1.width = 32;
    character_S1.height = 32;

    // T
    character_T.worldRow = 80 - 15 * 1;
    character_T.worldCol = 20 + 35 * 1;
    character_T.rdel = 1;
    character_T.width = 32;
    character_T.height = 32;

    // A
    character_A.worldRow = 80 - 15 * 2;
    character_A.worldCol = 20 + 35 * 2;
    character_A.rdel = 1;
    character_A.width = 32;
    character_A.height = 32;

    // I
    character_I.worldRow = 80 - 15 * 3;
    character_I.worldCol = 20 + 35 * 3;
    character_I.rdel = 1;
    character_I.width = 32;
    character_I.height = 32;

    // R
    character_R.worldRow = 80 - 15 * 4;
    character_R.worldCol = 20 + 35 * 4;
    character_R.rdel = 1;
    character_R.width = 32;
    character_R.height = 32;

    // S2
    character_S2.worldRow = 80 - 15 * 5;
    character_S2.worldCol = 20 + 35 * 5;
    character_S2.rdel = 1;
    character_S2.width = 32;
    character_S2.height = 32;    

}

void updateTitle() {

    // TODO : Moving each character up and down with gravity
}

void drawTitle() {

    // S1
    if (character_S1.worldCol > -5) {
        shadowOAM[0].attr0 = character_S1.worldRow | ATTR0_SQUARE;
        shadowOAM[0].attr1 = character_S1.worldCol | ATTR1_MEDIUM;
        shadowOAM[0].attr2 = ATTR2_TILEID(4 * 0, 0);
    } else {
        shadowOAM[0].attr0 = ATTR0_HIDE;
    }
    

    // T
    if (character_T.worldCol > -5) {
        shadowOAM[1].attr0 = character_T.worldRow | ATTR0_SQUARE;
        shadowOAM[1].attr1 = character_T.worldCol | ATTR1_MEDIUM;
        shadowOAM[1].attr2 = ATTR2_TILEID(4 * 1, 0);
    } else {
        shadowOAM[1].attr0 = ATTR0_HIDE;
    }

    // A
    if (character_A.worldCol > -5) {
        shadowOAM[2].attr0 = character_A.worldRow | ATTR0_SQUARE;
        shadowOAM[2].attr1 = character_A.worldCol | ATTR1_MEDIUM;
        shadowOAM[2].attr2 = ATTR2_TILEID(4 * 2, 0);
    } else {
        shadowOAM[2].attr0 = ATTR0_HIDE;
    }

    // I
    if (character_I.worldCol > -5) {
        shadowOAM[3].attr0 = character_I.worldRow | ATTR0_SQUARE;
        shadowOAM[3].attr1 = character_I.worldCol | ATTR1_MEDIUM;
        shadowOAM[3].attr2 = ATTR2_TILEID(4 * 3, 0);
    } else {
        shadowOAM[3].attr0 = ATTR0_HIDE;
    }

    // R
    if (character_R.worldCol > -5) {
        shadowOAM[4].attr0 = character_R.worldRow | ATTR0_SQUARE;
        shadowOAM[4].attr1 = character_R.worldCol | ATTR1_MEDIUM;
        shadowOAM[4].attr2 = ATTR2_TILEID(4 * 4, 0);
    } else {
        shadowOAM[4].attr0 = ATTR0_HIDE;
    }

    // S2
    if (character_S2.worldCol > -5) {
        shadowOAM[5].attr0 = character_S2.worldRow | ATTR0_SQUARE;
        shadowOAM[5].attr1 = character_S2.worldCol | ATTR1_MEDIUM;
        shadowOAM[5].attr2 = ATTR2_TILEID(4 * 5, 0);
    } else {
        shadowOAM[5].attr0 = ATTR0_HIDE;
    }
}

// For Moving Screen from Splah screen to main menu screen
void movingScreen() {

    if (isOnMenu) {
        goingOnMenu = 1;

        if (SG_hOff > 0) {

            // Shift screen
            SG_hOff -= 5;

            // Shift Title
            character_S1.worldCol += 5;
            character_T.worldCol += 5;
            character_A.worldCol += 5;
            character_I.worldCol += 5;
            character_R.worldCol += 5;
            character_S2.worldCol += 5;

        } else {

            isOnMenu = 0;
            goingOnMenu = 0;
        }
    } else {

        goingOnMenu = 1;

        if (SG_hOff < SG_MAPWIDTH / 2) {

            // Shift screen
            SG_hOff += 5;

            // Shift Title
            character_S1.worldCol -= 5;
            character_T.worldCol -= 5;
            character_A.worldCol -= 5;
            character_I.worldCol -= 5;
            character_R.worldCol -= 5;
            character_S2.worldCol -= 5;

        } else {

            isOnMenu = 1;
            goingOnMenu = 0;
        }
    }
    
}