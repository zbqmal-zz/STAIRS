#include "myLib.h"
#include "sound.h"
#include "RPSGame.h"


// Variables
int RPS0_vOff, RPS0_hOff;
int RPS1_vOff, RPS1_hOff;
int RPSGameState, playerWeapon, enemyWeapon, isRPSPlayerWin, walkingSoundFlag;
OBJ_ATTR shadowOAM[128];
ANISPRITE player, enemy, playerRock, playerPaper, playerScissors, playerPick;
 

// ================= Game Control ==================
// Initialize the game
void initRPSGame() {

	// Set up MainGame Screen
    RPS0_vOff = 90;
    RPS0_hOff = 0;
    RPS1_vOff = 80;
    RPS1_hOff = 0;

    // RPS Game State
    RPSGameState = RPSISNOTREADY;

    // walkingSound flag
    walkingSoundFlag = 0;

    // Init Objects
    initRPSPlayer();
    initRPSEnemy();
    initRPSGameState();
}

// Updates the game each frame
void updateRPSGame() {

    // Update objects
	updateRPSPlayer();
    updateRPSEnemy();

    // Update Game State
    switch (RPSGameState) {

        case RPSISNOTREADY:
            updateNOTREADY();
            break;
        case RPSISREADY:
            updateREADY();
            break;
        case RPSGAMESET:
            break;
        default:
            break;
    }
}

// Draws the game each frame
void drawRPSGame() {

    // Draw objects
    drawRPSPlayer();
    drawRPSEnemy();

    // Draw Game State
    switch (RPSGameState) {

        case RPSISREADY:
            drawREADY();
            break;
        case RPSGAMESET:
            drawGAMESET();
            break;
        default:
            break;
    }

    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 128 * 4);

    REG_BG0HOFF = RPS0_hOff;
    REG_BG0VOFF = RPS0_vOff;
    REG_BG1HOFF = RPS1_hOff;
    REG_BG1VOFF = RPS1_vOff;
}

// ==================== Player =====================
// Initialize the player
void initRPSPlayer() {

    // Locate the Player
    player.worldRow = 100;
    player.worldCol = 20;
    player.screenRow = 100;
    player.screenCol = 20;

    // Player's speed of moving
    player.cdel = 2;

    // Player's dimension
    player.width = 16;
    player.height = 24;

    // Animation
    player.aniCounter = 0;
    player.aniState = RPSPLAYERSTAND;
    player.curFrame = 0;
    player.numFrames = 3;
}

// Handle every-frame actions of the player
void updateRPSPlayer() {

    // Stay PLAYERSTAND
    player.aniState = RPSPLAYERSTAND;

    // Animation
    if (++player.aniCounter == 10) {
        player.aniCounter = 0;
        if (++player.curFrame == player.numFrames) {
            player.curFrame = 0;
        }
    }

    // Object Location
    player.screenCol = player.worldCol - RPS0_hOff;
    enemy.screenCol = enemy.worldCol - RPS0_hOff;
}

// Draw the player
void drawRPSPlayer() {

    shadowOAM[6].attr0 = player.screenRow | ATTR0_TALL;
    shadowOAM[6].attr1 = player.screenCol | ATTR1_MEDIUM;
    shadowOAM[6].attr2 = ATTR2_TILEID((player.curFrame * 4), (4 + 2 * player.aniState));

}


// ==================== Enemy =====================
void initRPSEnemy() {

    // Enemy Location
    enemy.worldRow = 62;
    enemy.worldCol = 450;
    enemy.screenRow = 62;
    enemy.screenCol = 450;

    // Enemy dimension
    enemy.width = 24;
    enemy.height = 32;

    // Animation
    enemy.aniCounter = 0;
    enemy.aniState = RPSENEMYSTAND;
    enemy.curFrame = 0;
    enemy.numFrames = 4;

    // Enemy state
    enemy.aniState = RPSENEMYSTAND;

}

void updateRPSEnemy() {
    
    if (++enemy.aniCounter == 20) {
        enemy.aniCounter = 0;
        if (++enemy.curFrame == enemy.numFrames) {
            enemy.curFrame = 0;
        }
    }
}

void drawRPSEnemy() {

    if (enemy.screenCol <= 240) {
        shadowOAM[9].attr0 = enemy.screenRow | ATTR0_SQUARE;
        shadowOAM[9].attr1 = enemy.screenCol | ATTR1_MEDIUM;
        shadowOAM[9].attr2 = ATTR2_TILEID((12 + 4 * enemy.curFrame), (4 + enemy.aniState * 4));
    }
}


// =================== UPDATE GAME STATE ===================
void initRPSGameState() {

    // Player Chooses Location
    playerRock.screenRow = player.screenRow - 50;
    playerRock.screenCol = player.screenCol + 50;
    playerPaper.screenRow = player.screenRow - 50;
    playerPaper.screenCol = player.screenCol + 82;
    playerScissors.screenRow = player.screenRow - 50;
    playerScissors.screenCol = player.screenCol + 114;
    playerPick.screenRow = player.screenRow - 50;
    playerPick.screenCol = player.screenCol + 50;

    // Player Chooses Dimension
    playerRock.width = 32;
    playerRock.height = 32;
    playerPaper.width = 32;
    playerPaper.height = 32;
    playerScissors.width = 32;
    playerScissors.height = 32;
    playerPick.width = 32;
    playerPick.height = 32;

    // Player Weapon
    playerWeapon = ROCK;
}

void updateNOTREADY() {

    // Reset animation state to STAND state
    player.aniState = RPSPLAYERSTAND;

    if (BUTTON_HELD(BUTTON_LEFT) || BUTTON_HELD(BUTTON_RIGHT)) {

        // Moving
        if (BUTTON_HELD(BUTTON_LEFT)) {

            // For Player
            if (player.worldCol - player.cdel >= 0) {

                // Animation State
                player.aniState = RPSPLAYERLEFT;

                // Turn on walkingSoundFlag
                if (!walkingSoundFlag) {
                    walkingSoundFlag = 1;
                    stopSoundB();
                    playSoundB(walkingSound, WALKINGSOUNDLEN, WALKINGSOUNDFREQ, 1);
                }

                // Moving
                player.worldCol -= player.cdel;

                // For Enemy
                if (player.screenCol <= SCREENWIDTH / 2) {
                    enemy.screenCol += 1;
                }

                // For Screen
                if ((RPS0_hOff - player.cdel >= 0) && (player.screenCol <= SCREENWIDTH / 2)) {
                    RPS0_hOff -= player.cdel;
                    RPS1_hOff -= 1;
                }

            } else {

                // stop walkingSound
                walkingSoundFlag = 0;
                stopSoundB();
            }
        }
        if (BUTTON_HELD(BUTTON_RIGHT)) {

            // For Player
            if (player.worldCol + (player.width - 1) + player.cdel < 450) {

                // Animation State
                player.aniState = RPSPLAYERRIGHT;

                // Turn on walkingSoundFlag
                if (!walkingSoundFlag) {
                    walkingSoundFlag = 1;
                    stopSoundB();
                    playSoundB(walkingSound, WALKINGSOUNDLEN, WALKINGSOUNDFREQ, 1);
                }

                // Moving
                player.worldCol += player.cdel;
                
                // For Enemy
                if (player.screenCol <= SCREENWIDTH / 2) {
                    enemy.screenCol -= 1;
                }

                // For Screen
                if ((player.screenCol >= SCREENWIDTH / 2) && ((RPS0_hOff + SCREENWIDTH) + player.cdel <= RPS_MAPWIDTH)) {
                    RPS0_hOff += player.cdel;
                    RPS1_hOff += 1;
                }

            } else {

                // stop walkingSound
                walkingSoundFlag = 0;
                stopSoundB();
            }
        }

    } else {

        // stop walkingSound
        walkingSoundFlag = 0;
        stopSoundB();
    }
        

    // When the player is near the enemy
    if (player.worldCol > 420) {

        // Draw A Button
        shadowOAM[35].attr0 = (player.screenRow - 16) | ATTR0_SQUARE;
        shadowOAM[35].attr1 = (player.screenCol - 16) | ATTR1_SMALL;
        shadowOAM[35].attr2 = ATTR2_TILEID(28, 28);

        // Transition to RPSISREADY
        if (BUTTON_PRESSED(BUTTON_A) && player.worldCol > 420) {

            // RPS game state transition with enemy random choice
            srand(player.screenCol);
            RPSGameState = RPSISREADY;
            enemy.aniState = RPSENEMYLEFT;
        }

    } else {

        // else, erase the A Button
        shadowOAM[35].attr0 = ATTR0_HIDE;
    }
}

void updateREADY() {

    // Choosing
    if (BUTTON_PRESSED(BUTTON_LEFT) && playerWeapon > 0) {

        // Choosing Sound
        stopSoundB();
        playSoundB(choosingSound, CHOOSINGSOUNDLEN, CHOOSINGSOUNDFREQ, 0);

        playerPick.screenCol -= 32;
        playerWeapon--;
    }
    if (BUTTON_PRESSED(BUTTON_RIGHT) && playerWeapon < 2) {

        // Choosing Sound
        stopSoundB();
        playSoundB(choosingSound, CHOOSINGSOUNDLEN, CHOOSINGSOUNDFREQ, 0);

        playerPick.screenCol += 32;
        playerWeapon++;
    }

    // Transition to GAMESET
    if (BUTTON_PRESSED(BUTTON_A)) {

        // ready to make sound
        stopSoundB();

        // Random pick of enemyWeapon
        enemyWeapon = (rand() * player.worldCol) % 3;

        // Decide who wins
        if (playerWeapon == ROCK) {

            switch (enemyWeapon) {

                case ROCK:

                    // Draw Sound
                    playSoundB(RPSDrawSound, RPSDRAWSOUNDLEN, RPSDRAWSOUNDFREQ, 0);

                    // Draw
                    shadowOAM[15].attr0 = 15 | ATTR0_WIDE;
                    shadowOAM[15].attr1 = 105 | ATTR1_MEDIUM;
                    shadowOAM[15].attr2 = ATTR2_TILEID(28, 24);

                    // Enemy Weapon
                    shadowOAM[14].attr0 = playerScissors.screenRow | ATTR0_SQUARE;
                    shadowOAM[14].attr1 = (playerScissors.screenCol + 64) | ATTR1_MEDIUM;
                    shadowOAM[14].attr2 = ATTR2_TILEID(28, 4 * enemyWeapon);
                    break;

                case PAPER:

                    // Lose Sound
                    playSoundB(RPSLoseSound, RPSLOSESOUNDLEN, RPSLOSESOUNDFREQ, 0);

                    // RPSGameState transition
                    isRPSPlayerWin = 0;
                    RPSGameState = RPSGAMESET;
                    break;

                case SCISSORS:

                    // Win Sound
                    playSoundB(RPSWinSound, RPSWINSOUNDLEN, RPSWINSOUNDFREQ, 0);

                    // RPSGameState transition
                    isRPSPlayerWin = 1;
                    RPSGameState = RPSGAMESET;
                    break;
            }
        }
        if (playerWeapon == PAPER) {

            switch (enemyWeapon) {

                case ROCK:

                    // Win Sound
                    playSoundB(RPSWinSound, RPSWINSOUNDLEN, RPSWINSOUNDFREQ, 0);

                    // RPSGameState transition
                    isRPSPlayerWin = 1;
                    RPSGameState = RPSGAMESET;
                    break;

                case PAPER:

                    // Draw Sound
                    playSoundB(RPSDrawSound, RPSDRAWSOUNDLEN, RPSDRAWSOUNDFREQ, 0);

                    // Draw
                    shadowOAM[15].attr0 = 15 | ATTR0_WIDE;
                    shadowOAM[15].attr1 = 105 | ATTR1_MEDIUM;
                    shadowOAM[15].attr2 = ATTR2_TILEID(28, 24);

                    // Enemy Weapon
                    shadowOAM[14].attr0 = playerScissors.screenRow | ATTR0_SQUARE;
                    shadowOAM[14].attr1 = (playerScissors.screenCol + 64) | ATTR1_MEDIUM;
                    shadowOAM[14].attr2 = ATTR2_TILEID(28, 4 * enemyWeapon);
                    break;

                case SCISSORS:

                    // Lose Sound
                    playSoundB(RPSLoseSound, RPSLOSESOUNDLEN, RPSLOSESOUNDFREQ, 0);

                    // RPSGameState transition
                    isRPSPlayerWin = 0;
                    RPSGameState = RPSGAMESET;
                    break;
            }
        }
        if (playerWeapon == SCISSORS) {

            switch (enemyWeapon) {

                case ROCK:

                    // Lose Sound
                    playSoundB(RPSLoseSound, RPSLOSESOUNDLEN, RPSLOSESOUNDFREQ, 0);

                    // RPSGameState transition
                    isRPSPlayerWin = 0;
                    RPSGameState = RPSGAMESET;
                    break;

                case PAPER:

                    // Win Sound
                    playSoundB(RPSWinSound, RPSWINSOUNDLEN, RPSWINSOUNDFREQ, 0);

                    // RPSGameState transition
                    isRPSPlayerWin = 1;
                    RPSGameState = RPSGAMESET;
                    break;

                case SCISSORS:

                    // Draw Sound
                    playSoundB(RPSDrawSound, RPSDRAWSOUNDLEN, RPSDRAWSOUNDFREQ, 0);

                    // Draw
                    shadowOAM[15].attr0 = 15 | ATTR0_WIDE;
                    shadowOAM[15].attr1 = 105 | ATTR1_MEDIUM;
                    shadowOAM[15].attr2 = ATTR2_TILEID(28, 24);

                    // Enemy Weapon
                    shadowOAM[14].attr0 = playerScissors.screenRow | ATTR0_SQUARE;
                    shadowOAM[14].attr1 = (playerScissors.screenCol + 64) | ATTR1_MEDIUM;
                    shadowOAM[14].attr2 = ATTR2_TILEID(28, 4 * enemyWeapon);
                    break;
            }
        }
    }
}


void drawREADY() {

    // Player ROCK
    shadowOAM[10].attr0 = playerRock.screenRow | ATTR0_SQUARE;
    shadowOAM[10].attr1 = playerRock.screenCol | ATTR1_MEDIUM;
    shadowOAM[10].attr2 = ATTR2_TILEID(28, 0);

    // Player PAPER
    shadowOAM[11].attr0 = playerPaper.screenRow | ATTR0_SQUARE;
    shadowOAM[11].attr1 = playerPaper.screenCol | ATTR1_MEDIUM;
    shadowOAM[11].attr2 = ATTR2_TILEID(28, 4);

    // Player SCISSORS
    shadowOAM[12].attr0 = playerScissors.screenRow | ATTR0_SQUARE;
    shadowOAM[12].attr1 = playerScissors.screenCol | ATTR1_MEDIUM;
    shadowOAM[12].attr2 = ATTR2_TILEID(28, 8);

    // PLAYER PICK
    shadowOAM[13].attr0 = playerPick.screenRow | ATTR0_SQUARE;
    shadowOAM[13].attr1 = playerPick.screenCol | ATTR1_MEDIUM;
    shadowOAM[13].attr2 = ATTR2_TILEID(28, 12);
}

void drawGAMESET() {

    // Enemy Weapon
    shadowOAM[14].attr0 = playerScissors.screenRow | ATTR0_SQUARE;
    shadowOAM[14].attr1 = (playerScissors.screenCol + 64) | ATTR1_MEDIUM;
    shadowOAM[14].attr2 = ATTR2_TILEID(28, 4 * enemyWeapon);

    // Show result
    shadowOAM[15].attr0 = 15 | ATTR0_WIDE;
    shadowOAM[15].attr1 = 105 | ATTR1_MEDIUM;
    shadowOAM[15].attr2 = ATTR2_TILEID(28 + 2 * isRPSPlayerWin, 16);

    // Show only B Button
    shadowOAM[35].attr0 = ATTR0_HIDE;
    shadowOAM[36].attr0 = (player.screenRow - 16) | ATTR0_SQUARE;
    shadowOAM[36].attr1 = (player.screenCol - 16) | ATTR1_SMALL;
    shadowOAM[36].attr2 = ATTR2_TILEID(28, 30);
}