#include "myLib.h"
#include "SRGame.h"


// Variables
int SR_vOff, SR_hOff;
int SRGameState, isSRPlayerWin;
OBJ_ATTR shadowOAM[128];
ANISPRITE player, SRComputers[2];
 

// ================= Game Control ==================
// Initialize the game
void initSRGame() {

	// Set up camera Location
    SR_vOff = 0;
    SR_hOff = 0;

    // Initialize isSRPlayerWin
    isSRPlayerWin = 0;

    // Game State
    SRGameState = SRRACING;

    // Init Objects
    initSRPlayer();
    initSRComputers();
}

// Updates the game each frame
void updateSRGame() {

    switch (SRGameState) {

        case SRRACING:

            // Update objects
            updateSRPlayer();
            for (int i = 0; i < 2; i++)
                updateSRComputer(&SRComputers[i]);

            break;

        case SRGAMESET:
            break;
    }
}

// Draws the game each frame
void drawSRGame() {

    switch (SRGameState) {

        case SRRACING:

            // Draw objects
            drawSRPlayer();
            for (int i = 0; i < 2; i++)
                drawSRComputer(&SRComputers[i]);

            break;

        case SRGAMESET:

            drawSRGameSet();
            break;

        default:
            break;
    }
    
    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 128 * 4);

    REG_BG0HOFF = SR_hOff;
    REG_BG0VOFF = SR_vOff;
}


// ==================== Player ====================
void initSRPlayer() {

    // location
    player.worldRow = SCREENHEIGHT / 2 - 16;
    player.worldCol = 0;
    player.screenRow = 0;
    player.screenCol = 0;

    // Dimension
    player.width = 32;
    player.height = 16;

    // Speed
    player.cdel = 4;

    // Animation Factors
    player.aniState = SRMOTION1;
}

void updateSRPlayer() {

    switch (SRGameState) {

        case SRRACING:

            // Moving
            if (BUTTON_PRESSED(BUTTON_A)) {

                // Go forward first with animation
                player.worldCol += player.cdel;
                if (++player.aniState > SRMOTION4)
                    player.aniState = SRMOTION1;

                // For Screen Moving
                if (player.screenCol + player.width / 2 >= SCREENWIDTH / 2
                    && SR_hOff + SCREENWIDTH - 1 <= SR_MAPWIDTH)
                    SR_hOff += player.cdel;

                // if player touches the rightmost, game is set
                if ((player.worldCol + player.width / 2) > SR_MAPWIDTH) {

                    SRGameState = SRGAMESET;
                    isSRPlayerWin = 1;
                }
            }

            // Cheat
            if (BUTTON_PRESSED(BUTTON_L)) {

                player.cdel = SR_CHEATSPEED;
            }

            // Update player's screen Location
            player.screenRow = player.worldRow - SR_vOff;
            player.screenCol = player.worldCol - SR_hOff;

            break;

        case SRGAMESET:
            break;

        default:
            break;
    }
    
}

void drawSRPlayer() {

    shadowOAM[47].attr0 = player.screenRow | ATTR0_WIDE;
    shadowOAM[47].attr1 = player.screenCol | ATTR1_MEDIUM;
    shadowOAM[47].attr2 = ATTR2_TILEID(22, 12 + 4 * player.aniState);
}


// ==================== Computers =====================
// Initialize the computers
void initSRComputers() {

    for (int i = 0; i < 2; i++) {

        // index
        SRComputers[i].index = i;

        // Location
        SRComputers[i].worldRow = 20 + 100 * i;
        SRComputers[i].worldCol = 0;
        SRComputers[i].screenRow = 0;
        SRComputers[i].screenCol = 0;

        // Dimension
        SRComputers[i].width = 32;
        SRComputers[i].height = 16;

        // Speed
        SRComputers[i].cdel = rand() % 10 + 1;

        // Animation Factors
        SRComputers[i].aniCounter = rand() % SR_COMPUTERSPEED + 1;
        SRComputers[i].aniState = SRMOTION1;
    }
}

void updateSRComputer(ANISPRITE * computer) {

    switch (SRGameState) {

        case SRRACING:

            // Moving automatically 
            if (++computer->aniCounter > SR_COMPUTERSPEED) {

                // Move forward
                computer->worldCol += computer->cdel;

                // Animation
                if (++computer->aniState > SRMOTION4) {
                    computer->aniState = SRMOTION1;
                }

                // Reset aniCounter
                computer->aniCounter = 0;
            }

            // If a computer touched the final, the player lose
            if (computer->worldCol + computer->width / 2 >= SR_MAPWIDTH) {

                SRGameState = SRGAMESET;
                isSRPlayerWin = 0;
            }

            // Update Screen location
            computer->screenRow = computer->worldRow - SR_vOff;
            computer->screenCol = computer->worldCol - SR_hOff;

            break;

        case SRGAMESET:
            break;
    } 
}

void drawSRComputer(ANISPRITE* computer) {

    if (computer->worldCol >= SR_hOff
        && (computer->worldCol <= SR_hOff + SCREENWIDTH - 1)) {

        shadowOAM[computer->index + 48].attr0 = computer->screenRow | ATTR0_WIDE;
        shadowOAM[computer->index + 48].attr1 = computer->screenCol | ATTR1_MEDIUM;
        shadowOAM[computer->index + 48].attr2 = ATTR2_TILEID(24 + 2 * computer->index, 12 + 4 * computer->aniState);

    } else {

        shadowOAM[computer->index + 48].attr0 = ATTR0_HIDE;
    }
}


// =========================== GAMESET =============================
void drawSRGameSet() {

    // Win or Lose
    shadowOAM[15].attr0 = 20 | ATTR0_WIDE;
    shadowOAM[15].attr1 = (SCREENWIDTH / 2 - 16) | ATTR1_MEDIUM;
    if (isSRPlayerWin)
        shadowOAM[15].attr2 = ATTR2_TILEID(30, 16);
    else 
        shadowOAM[15].attr2 = ATTR2_TILEID(28, 16);

    // B Button
    shadowOAM[36].attr0 = (player.screenRow - 16) | ATTR0_SQUARE;
    shadowOAM[36].attr1 = (player.screenCol - 16) | ATTR1_SMALL;
    shadowOAM[36].attr2 = ATTR2_TILEID(28, 30);
}