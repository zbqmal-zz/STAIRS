#include "myLib.h"
#include "sound.h"
#include "mainGame.h"


// Variables
int MG0_vOff, MG0_hOff;
int MG1_vOff, MG1_hOff;
int MG2_vOff, MG2_hOff;
int diceNum, randSeed, isRolling, isRolled, amountOfMove, destRow, destCol, randGame, isAtDoor;
int currentLevel, firstNum, secondNum, thirdNum;
OBJ_ATTR shadowOAM[128];
ANISPRITE player, dice, buttonA, butt3donB, door;

// ================= Game Control ==================
// Initialize the game
void initMainGame() {

    // Initialize the current level
    if (isStartedGame) {
        currentLevel = 0;
    }
    firstNum = 0;
    secondNum = 0;
    thirdNum = 0;

    // Walking Sound Flag
    walkingSoundFlag = 0;

	// Set up MainGame Screen
    MG0_vOff = 96;
    MG0_hOff = 0;
    MG1_vOff = 76;
    MG1_hOff = 0;
    MG2_vOff = 96;
    MG2_hOff = 0;

    // Set a random value for rolling a dice
    randSeed = 0;
    diceNum = 0;
    isRolling = 0;
    isRolled = 0;
    destRow = 0;
    destCol = 0;
    randGame = 0;
    isAtDoor = 0;

    // Init Objects
    initMGPlayer();
    initDice();
    initDoor();
}

// Updates the game each frame
void updateMainGame() {

    // Update objects
	updateMGPlayer();
    updateDice();
    updateDoor();
}

// Draws the game each frame
void drawMainGame() {

    // Draw objects
    drawMGPlayer();
    drawDice();
    drawDoor();
    drawLevel();

    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 128 * 4);

    REG_BG0HOFF = MG0_hOff;
    REG_BG0VOFF = MG0_vOff;
    REG_BG1HOFF = MG1_hOff;
    REG_BG1VOFF = MG1_vOff;
    REG_BG2HOFF = MG2_hOff;
    REG_BG2VOFF = MG2_vOff;
}

// ==================== Player =====================
// Initialize the player
void initMGPlayer() {

    // Locate the Player
    player.worldRow = 128 + 96;
    player.worldCol = 16;
    player.screenRow = 128;
    player.screenCol = 16;

    // Player's speed of moving
    player.rdel = 1;
    player.cdel = 3;

    // Player's dimension
    player.width = 16;
    player.height = 24;

    // Animation
    player.aniCounter = 0;
    player.aniState = MGPLAYERSTAND;
    player.curFrame = 0;
    player.numFrames = 3;
}

// Handle every-frame actions of the player
void updateMGPlayer() {

    // Stay PLAYERSTAND
    player.aniState = MGPLAYERSTAND;

    // Animation Factors
    if (++player.aniCounter == 10) {
        player.aniCounter = 0;
        if (++player.curFrame == player.numFrames) {
            player.curFrame = 0;
        }
    }

    //
    if (isRolled) {

        if (BUTTON_HELD(BUTTON_LEFT) || (BUTTON_HELD(BUTTON_RIGHT))) {

            // Going down
            if (BUTTON_HELD(BUTTON_LEFT)) {

                if ((player.worldCol - player.cdel) >= 16) {

                    // Turn on walkingSoundFlag
                    if (!walkingSoundFlag) {

                        walkingSoundFlag = 1;
                        stopSoundB();
                        playSoundB(walkingSound, WALKINGSOUNDLEN, WALKINGSOUNDFREQ, 1);
                    }

                    // Player aniState to LEFT
                    player.aniState = MGPLAYERLEFT;

                    // For player move
                    player.worldRow += player.rdel;
                    player.worldCol -= player.cdel;

                    // For screen move
                    if (MG0_hOff - player.cdel > 0 && player.screenCol < SCREENWIDTH / 2) {

                        MG0_vOff += player.rdel;
                        MG0_hOff -= player.cdel;
                        MG1_hOff -= 2;
                        MG2_hOff -= 1;
                    }
                } else {

                    // stop walkingSound
                    walkingSoundFlag = 0;
                    stopSoundB();
                }  
            } 
            // Going up
            if (BUTTON_HELD(BUTTON_RIGHT)) {

                if ((player.worldRow - player.rdel) >= destRow) {

                    // Turn on walkingSoundFlag
                    if (!walkingSoundFlag) {

                        walkingSoundFlag = 1;
                        stopSoundB();
                        playSoundB(walkingSound, WALKINGSOUNDLEN, WALKINGSOUNDFREQ, 1);
                    }

                    // Player aniState to RIGHT
                    player.aniState = MGPLAYERRIGHT;

                    // For player move
                    player.worldRow -= player.rdel;
                    player.worldCol += player.cdel;

                    // For screen move
                    if (player.screenCol > SCREENWIDTH / 2 && MG0_hOff + SCREENWIDTH <= MG_MAPWIDTH) {

                        MG0_vOff -= player.rdel;
                        MG0_hOff += player.cdel;
                        MG1_hOff += 2;
                        MG2_hOff += 1;
                    }

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
            

        // Check if player is at door
        if (collision(player.screenRow, player.screenCol, player.height, player.width,
            door.screenRow, door.screenCol, door.height, door.width)) {
            isAtDoor = 1;
        } else {
            isAtDoor = 0;
        }

    }

    // Update player's and door's location
    player.screenRow = player.worldRow - MG0_vOff;
    player.screenCol = player.worldCol - MG0_hOff;
    door.screenRow = door.worldRow - MG0_vOff;
    door.screenCol = door.worldCol - MG0_hOff;
}

// Draw the player
void drawMGPlayer() {

    shadowOAM[6].attr0 = player.screenRow | ATTR0_TALL;
    shadowOAM[6].attr1 = player.screenCol | ATTR1_MEDIUM;
    shadowOAM[6].attr2 = ATTR2_TILEID((player.curFrame * 4), (4 + 2 * player.aniState));
}

// ==================== Dice =====================
void initDice() {

    // Location (default: hiding)
    dice.screenRow = 20;
    dice.screenCol = 20;

    // Dice dimension
    dice.width = 32;
    dice.height = 32;

}

void updateDice() {

    if (isRolled) {

        // Do nothing
    } else {

        // Roll the dice
        if (BUTTON_PRESSED(BUTTON_A)) {

            // For the animation of rolling dice
            if (!isRolling) {

                stopSoundB();
                playSoundB(rollingDiceSound, ROLLINGDICESOUNDLEN, ROLLINGDICESOUNDFREQ, 0);
                isRolling = 1;

            // When isRolled
            } else {

                // Rollind a dice sound again
                stopSoundB();
                playSoundB(rollingDiceSound, ROLLINGDICESOUNDLEN, ROLLINGDICESOUNDFREQ, 0);

                // Set a random dice number
                // diceNum = rand() % 6 + 1;
                isRolled = 1;

                // For levels
                firstNum = ((currentLevel + diceNum) % 1000) / 100;
                secondNum = ((currentLevel + diceNum) % 100) / 10;
                thirdNum = ((currentLevel + diceNum) % 10) / 1;

                // For door
                destRow = player.worldRow - (16 * diceNum);
                destCol = player.worldCol + (48 * diceNum);
                door.active = 1;
                door.worldRow = destRow - 8;
                door.worldCol = destCol - 8;


                // Set the next random game
                randGame = (diceNum + rand() + thirdNum) % 4;
                switch (randGame) {
                    case 0:
                        randGame = RPSGAME;
                        break;
                    case 1:
                        randGame = THGAME;
                        break;
                    case 2:
                        randGame = PAROMAGAME;
                        break;
                    case 3:
                        randGame = SRGAME;
                        break;
                    default:
                        break;
                }
            }
        }
    }
}

void drawDice() {

    // Anifmation for rolling dice
    if (isRolling && !isRolled) {

        if (++diceNum > 6) {
            diceNum = 1;
        }
    }

    // Dice
    shadowOAM[8].attr0 = dice.screenRow | ATTR0_SQUARE;
    shadowOAM[8].attr1 = dice.screenCol | ATTR1_MEDIUM;
    shadowOAM[8].attr2 = ATTR2_TILEID(diceNum * 4, 28);

    // ButtonA is pressed
    if (isRolled) {

        // Erase buttonA first
        shadowOAM[35].attr0 = ATTR0_HIDE;

        if (isAtDoor) {

            // When get the door, draw buttonB
            shadowOAM[36].attr0 = (dice.screenRow + (dice.width + 2)) | ATTR0_SQUARE;
            shadowOAM[36].attr1 = (dice.screenCol + (dice.height + 3)) | ATTR1_SMALL;
            shadowOAM[36].attr2 = ATTR2_TILEID(28, 30);

        } else {

            // Erase the buttonB if player is not near the door
            shadowOAM[36].attr0 = ATTR0_HIDE;
        }
        
    } else {

        // ButtonA to roll the dice
        shadowOAM[35].attr0 = (dice.screenRow + (dice.width + 2)) | ATTR0_SQUARE;
        shadowOAM[35].attr1 = (dice.screenCol + (dice.height + 3)) | ATTR1_SMALL;
        shadowOAM[35].attr2 = ATTR2_TILEID(28, 28);
    }   
}


// ====================== Door =========================
void initDoor() {

    // Location
    door.worldRow = 0;
    door.worldCol = 0;
    door.screenRow = 0;
    door.screenCol = 0;

    // Door dimension
    door.width = 32;
    door.height = 32;

    // Door active
    door.active = 0;
}

void updateDoor() {

    //
}

void drawDoor() {

    // 
    if (isRolled && door.screenRow >= 0 && door.screenCol <= SCREENWIDTH) {

        // Draw Door
        shadowOAM[37].attr0 = (door.screenRow + 1) | ATTR0_SQUARE;
        shadowOAM[37].attr1 = door.screenCol | ATTR1_MEDIUM;
        shadowOAM[37].attr2 = ATTR2_TILEID(28, 20);
    } else {

        shadowOAM[37].attr0 = ATTR0_HIDE;
    }
}


// ========================= LEVELS ============================
void drawLevel() {

    shadowOAM[38].attr0 = (player.screenRow + 24) | ATTR0_SQUARE;
    shadowOAM[38].attr1 = (player.screenCol) | ATTR1_TINY;
    shadowOAM[39].attr0 = (player.screenRow + 24) | ATTR0_SQUARE;
    shadowOAM[39].attr1 = (player.screenCol + 8) | ATTR1_TINY;
    shadowOAM[40].attr0 = (player.screenRow + 24) | ATTR0_SQUARE;
    shadowOAM[40].attr1 = (player.screenCol + 16) | ATTR1_TINY;
    if (player.worldRow >= 210 - 16 * 0) {
        shadowOAM[38].attr2 = ATTR2_TILEID(12 + (((currentLevel + 0) % 1000) / 100), 27);
        shadowOAM[39].attr2 = ATTR2_TILEID(12 + (((currentLevel + 0) % 100) / 10), 27);
        shadowOAM[40].attr2 = ATTR2_TILEID(12 + (((currentLevel + 0) % 10)), 27);

    } else if (player.worldRow >= 210 - 16 * 1) {
        shadowOAM[38].attr2 = ATTR2_TILEID(12 + (((currentLevel + 1) % 1000) / 100), 27);
        shadowOAM[39].attr2 = ATTR2_TILEID(12 + (((currentLevel + 1) % 100) / 10), 27);
        shadowOAM[40].attr2 = ATTR2_TILEID(12 + (((currentLevel + 1) % 10)), 27);

    } else if (player.worldRow >= 210 - 16 * 2) {
        shadowOAM[38].attr2 = ATTR2_TILEID(12 + (((currentLevel + 2) % 1000) / 100), 27);
        shadowOAM[39].attr2 = ATTR2_TILEID(12 + (((currentLevel + 2) % 100) / 10), 27);
        shadowOAM[40].attr2 = ATTR2_TILEID(12 + (((currentLevel + 2) % 10)), 27);

    } else if (player.worldRow >= 210 - 16 * 3) {
        shadowOAM[38].attr2 = ATTR2_TILEID(12 + (((currentLevel + 3) % 1000) / 100), 27);
        shadowOAM[39].attr2 = ATTR2_TILEID(12 + (((currentLevel + 3) % 100) / 10), 27);
        shadowOAM[40].attr2 = ATTR2_TILEID(12 + (((currentLevel + 3) % 10)), 27);

    } else if (player.worldRow >= 210 - 16 * 4) {
        shadowOAM[38].attr2 = ATTR2_TILEID(12 + (((currentLevel + 4) % 1000) / 100), 27);
        shadowOAM[39].attr2 = ATTR2_TILEID(12 + (((currentLevel + 4) % 100) / 10), 27);
        shadowOAM[40].attr2 = ATTR2_TILEID(12 + (((currentLevel + 4) % 10)), 27);

    } else if (player.worldRow >= 210 - 16 * 5) {
        shadowOAM[38].attr2 = ATTR2_TILEID(12 + (((currentLevel + 5) % 1000) / 100), 27);
        shadowOAM[39].attr2 = ATTR2_TILEID(12 + (((currentLevel + 5) % 100) / 10), 27);
        shadowOAM[40].attr2 = ATTR2_TILEID(12 + (((currentLevel + 5) % 10)), 27);

    } else if (player.worldRow >= 210 - 16 * 6) {
        shadowOAM[38].attr2 = ATTR2_TILEID(12 + (((currentLevel + 6) % 1000) / 100), 27);
        shadowOAM[39].attr2 = ATTR2_TILEID(12 + (((currentLevel + 6) % 100) / 10), 27);
        shadowOAM[40].attr2 = ATTR2_TILEID(12 + (((currentLevel + 6) % 10)), 27);

    } else if (player.worldRow >= 242 - 16 * 7) {
        shadowOAM[38].attr2 = ATTR2_TILEID(12 + (((currentLevel + 7) % 1000) / 100), 27);
        shadowOAM[39].attr2 = ATTR2_TILEID(12 + (((currentLevel + 7) % 100) / 10), 27);
        shadowOAM[40].attr2 = ATTR2_TILEID(12 + (((currentLevel + 7) % 10)), 27);

    } else if (player.worldRow >= 210 - 16 * 8) {
        shadowOAM[38].attr2 = ATTR2_TILEID(12 + (((currentLevel + 8) % 1000) / 100), 27);
        shadowOAM[39].attr2 = ATTR2_TILEID(12 + (((currentLevel + 8) % 100) / 10), 27);
        shadowOAM[40].attr2 = ATTR2_TILEID(12 + (((currentLevel + 8) % 10)), 27);

    } else if (player.worldRow >= 210 - 16 * 9) {
        shadowOAM[38].attr2 = ATTR2_TILEID(12 + (((currentLevel + 9) % 1000) / 100), 27);
        shadowOAM[39].attr2 = ATTR2_TILEID(12 + (((currentLevel + 9) % 100) / 10), 27);
        shadowOAM[40].attr2 = ATTR2_TILEID(12 + (((currentLevel + 9) % 10)), 27);

    } else if (player.worldRow >= 210 - 16 * 10) {
        shadowOAM[38].attr2 = ATTR2_TILEID(12 + (((currentLevel + 10) % 1000) / 100), 27);
        shadowOAM[39].attr2 = ATTR2_TILEID(12 + (((currentLevel + 10) % 100) / 10), 27);
        shadowOAM[40].attr2 = ATTR2_TILEID(12 + (((currentLevel + 10) % 10)), 27);
    }

}