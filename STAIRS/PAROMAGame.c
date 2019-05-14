#include "myLib.h"
#include "sound.h"
#include "ParomaGame.h"


// Variables
int PR_vOff, PR_hOff;
int PRGameState, remainingEnemies, isGotParoma, enemyBulletTimer, isCheatOn;
OBJ_ATTR shadowOAM[128];
ANISPRITE player, playerBullets[PLAYERBULLETNUMBER], enemies[5], enemyBullet, paromas[PAROMANUMBER];
 

// ================= Game Control ==================
// Initialize the game
void initPAROMAGame() {

	// Set up ParomaGame Screen
    PR_vOff = 0;
    PR_hOff = 0;

    // Initialize remainingEnemies and isGotParoma
    remainingEnemies = ENEMYNUMBER;
    isGotParoma = 0;

    // Paroma Game State
    PRGameState = PRSHOOTING;

    // Initialize EnemyBulletTimer
    enemyBulletTimer = 0;

    // Init isCheatOn
    isCheatOn = 0;

    // Init Objects
    initPRPlayer();
    initPlayerBullets();
    initPREnemies();
    initPREnemyBullet();
    initParomas();
}

// Updates the game each frame
void updatePAROMAGame() {

    switch (PRGameState) {

        case PRSHOOTING:

            // Update objects
            updatePRPlayer();
            for (int i = 0; i < ENEMYNUMBER; i++)
                updatePREnemy(&enemies[i]);
            for (int i = 0; i < PAROMANUMBER; i++)
                updateParoma(&paromas[i]);
            for (int i = 0; i< PLAYERBULLETNUMBER; i++)
                updatePlayerBullet(&playerBullets[i]);
            updatePREnemyBullet();

            // Increment enemyBulletTimer
            if (!enemyBullet.active)
                enemyBulletTimer++;

            // If the object is completed, transition to GAMESET
            if (remainingEnemies == 0) {

                PRGameState = PRGAMESET;
            }

            // If player hit one of paromas, transition to GAMESET as well
            if (isGotParoma) {

                playSoundB(PAROMASound, PAROMASOUNDLEN, PAROMASOUNDFREQ, 0);
                PRGameState = PRGAMESET;
            }

            break;

        case PRGAMESET:
            break;
    }
}

// Draws the game each frame
void drawPAROMAGame() {

    // Draw objects
    drawPRPlayer();
    for (int i = 0; i < ENEMYNUMBER; i++)
        drawPREnemy(&enemies[i]);
    for (int i = 0; i < PAROMANUMBER; i++)
        drawParoma(&paromas[i]);
    for (int i = 0; i< PLAYERBULLETNUMBER; i++)
        drawPlayerBullet(&playerBullets[i]);
    drawPREnemyBullet();

    // Draw the result
    if (PRGameState == PRGAMESET) {

        drawPRGameSet();
    }

    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 128 * 4);

    REG_BG0HOFF = PR_hOff;
    REG_BG0VOFF = PR_vOff;
}


// ==================== Player ====================
void initPRPlayer() {

    // Player Dimension
    player.width = 16;
    player.height = 16;

    // Player location
    player.screenRow = 130;
    player.screenCol = SCREENWIDTH / 2 - player.width / 2;

    // Player Speed
    player.cdel = 2;

    // Player Animation
    player.aniState = PRPLAYERFRONT;
    player.aniCounter = 0;

    // Active
    player.active = 1;

    // Set bulletTimer PLAYERBULLETRELOADINTERVAL
    playerBulletTimer = PLAYERBULLETRELOADINTERVAL;
}

void updatePRPlayer() {

    switch (PRGameState) {

        case PRSHOOTING:

            if (player.active) {

                // If nothing pressed, player shows PLAYERFRONT
                player.aniState = PRPLAYERFRONT;

                // Moving
                if (BUTTON_HELD(BUTTON_LEFT) && (player.screenCol - player.cdel) >= 0) {

                    player.aniState = PRPLAYERLEFT;
                    player.screenCol -= player.cdel;
                }
                if (BUTTON_HELD(BUTTON_RIGHT) && (player.screenCol + (32 - 1) + player.cdel <= SCREENWIDTH)) {

                    player.aniState = PRPLAYERRIGHT;
                    player.screenCol += player.cdel;
                }

                // Shooting
                playerBulletTimer++;
                if (BUTTON_PRESSED(BUTTON_A) && playerBulletTimer > PLAYERBULLETRELOADINTERVAL) {

                    // Set bulletTimer 0 again
                    playerBulletTimer = 0;

                    // Start fireBullet() function
                    fireBullet();
                }

                // Cheat On
                if (BUTTON_PRESSED(BUTTON_L)) {

                    isCheatOn = 1;
                }

            // When player dies, animation
            } else {

                if (++player.aniCounter > 20) {

                    player.aniCounter = 0;

                    if (++player.aniState > PRPLAYERDIE2) {

                        PRGameState = PRGAMESET;
                    }
                }
            }
            
            break;

        case PRGAMESET:
            break;

        default:
            break;
    }
    
}

// initialize an inactive bullet
void fireBullet() {

    // Sound Fire bullet
    stopSoundB();
    playSoundB(PAROMAFireSound, PAROMAFIRESOUNDLEN - 1000, PAROMAFIRESOUNDFREQ, 0);

    // Find the first inactive playerBullet
    for (int i = 0; i < PLAYERBULLETNUMBER; i++) {

        if (!playerBullets[i].active) {

            // Set it active
            playerBullets[i].active = 1;

            // Locate it on the player
            playerBullets[i].screenRow = player.screenRow;
            playerBullets[i].screenCol = player.screenCol + (12);

            // Stop the loop
            i = PLAYERBULLETNUMBER + 1;
        }
    }
}

void drawPRPlayer() {

    if (PRGameState == PRSHOOTING) {
        shadowOAM[6].attr0 = player.screenRow | ATTR0_SQUARE;
        shadowOAM[6].attr1 = player.screenCol | ATTR1_MEDIUM;
        shadowOAM[6].attr2 = ATTR2_TILEID(player.aniState * 4, 14);
    }
}


// ==================== Enemy =====================
// Initialize the enemy
void initPREnemies() {

    for (int i = 0; i < ENEMYNUMBER; i++) {

        // Enemy Index
        enemies[i].index = i;

        // Enemy active
        enemies[i].active = 1;

        // Location
        enemies[i].screenRow = rand() % 100;
        enemies[i].screenCol = rand() % 200;

        // Enemies Speed
        enemies[i].rdel = rand() % 3 + 1;
        enemies[i].cdel = rand() % 3 + 1;

        // Enemies Dimension
        enemies[i].width = 10;
        enemies[i].height = 14;

        // Animation
        enemies[i].aniCounter = rand() % 20;
        enemies[i].aniState = PRENEMYLEFT;
    }
}

void updatePREnemy(ANISPRITE* enemy) {

    switch (PRGameState) {

        case PRSHOOTING:

            if (enemy->active) {

                // When it is alive
                if (enemy->active == 1) {

                    // Fraction at the edges
                    if (enemy->screenRow + enemy->rdel < 0 || enemy->screenRow + enemy->rdel > (SCREENHEIGHT - 40))
                        enemy->rdel *= -1;
                    if (enemy->screenCol + enemy->cdel < 0 || enemy->screenCol + enemy->cdel > SCREENWIDTH)
                        enemy->cdel *= -1;

                    // Move
                    enemy->screenRow += enemy->rdel;
                    enemy->screenCol += enemy->cdel;

                    // Animation
                    if (++enemy->aniCounter > 20) {

                        enemy->aniCounter = 0;

                        if (++enemy->aniState > PRENEMYRIGHT) {

                            enemy->aniState = PRENEMYLEFT;
                        }
                    }

                    // Fire Bullet
                    if (enemyBulletTimer >= 30 && !enemyBullet.active) {

                        // reset enemyBulletTimer
                        enemyBulletTimer = 0;

                        // set it active
                        enemyBullet.active = 1;

                        // set bullet's location
                        enemyBullet.screenRow = enemy->screenRow;
                        enemyBullet.screenCol = enemy->screenCol + 4;
                    }

                // When it is dying
                } else {

                    // Animation
                    if (++enemy->aniCounter > 20) {

                        enemy->aniCounter = 0;

                        if (++enemy->aniState > PRENEMYDIE3) {

                            enemy->active = 0;
                        }
                    }
                }
            }

            break;

        case PRGAMESET:
            break;
    } 
}

void drawPREnemy(ANISPRITE* enemy) {

    if (enemy->active) {

        shadowOAM[enemy->index + 27].attr0 = enemy->screenRow | ATTR0_SQUARE;
        shadowOAM[enemy->index + 27].attr1 = enemy->screenCol | ATTR1_SMALL;
        shadowOAM[enemy->index + 27].attr2 = ATTR2_TILEID(2 * enemy->aniState, 18);

    } else if (enemy->active == 0) {

        shadowOAM[enemy->index + 27].attr0 = ATTR0_HIDE;
    }
}


// ==================== Paromas =====================
void initParomas() {

    for (int i = 0; i < PAROMANUMBER; i++) {

        // Paroma index
        paromas[i].index = i;

        // Paroma active
        paromas[i].active = 0;

        // Location
        paromas[i].screenRow = rand() % 100;
        paromas[i].screenCol = rand() % 200;

        // Paroma Dimension
        paromas[i].width = 15;
        paromas[i].height = 15;

        // Paroma appearance timer
        paromas[i].timer = 10 + 10 * i;

        // Animation
        paromas[i].aniCounter = 0;
        paromas[i].aniState = PAROMAMOTION1;
    }
}

void updateParoma(ANISPRITE* paroma) {

    // Keep incrementing paroma Timer
    paroma->timer++;

    // Switch each paroma's active state
    if (paroma->timer >= PAROMATIMEINTERVAL) {

        // Initialize paroma's timer
        paroma->timer = 0;

        // Transition the active state
        if (paroma->active) {

            paroma->active = 0;

        } else {

            paroma->active = 1;

            // Re-initialize location
            paroma->screenRow = rand() % 100;
            paroma->screenCol = rand() % 200;

            // Re-initialize animation
            paroma->aniCounter = 0;
            paroma->aniState = PAROMAMOTION1;
        }
    }

    // Animation
    if (paroma->active) {

        // Increment aniCounter for animation
        paroma->aniCounter++;

        if (paroma->aniCounter <= 10)
            paroma->aniState = PAROMAMOTION2;
        else if (paroma->aniCounter <= 20)
            paroma->aniState = PAROMAMOTION3;
        else if (paroma->aniCounter <= 30)
            paroma->aniState = PAROMAMOTION4;
    }
}

void drawParoma(ANISPRITE* paroma) {

    if (paroma->active) {
        shadowOAM[paroma->index + 32].attr0 = paroma->screenRow | ATTR0_SQUARE;
        shadowOAM[paroma->index + 32].attr1 = paroma->screenCol | ATTR1_SMALL;
        shadowOAM[paroma->index + 32].attr2 = ATTR2_TILEID(2 * paroma->aniState, 20);
    } else {
        shadowOAM[paroma->index + 32].attr0 = ATTR0_HIDE;
    }
}


// ========================= Player Bullet ==============================
void initPlayerBullets() {

    for (int i = 0; i < PLAYERBULLETNUMBER; i++) {

        // Assign an index
        playerBullets[i].index = i;

        // Set inactive first
        playerBullets[i].active = 0;

        // Hide them first
        playerBullets[i].screenRow = 0;
        playerBullets[i].screenCol = 0;

        // Dimension
        playerBullets[i].width = 4;
        playerBullets[i].height = 12;

        // Animation
        playerBullets[i].aniCounter = 0;
        playerBullets[i].aniState = BULLETMOTION1;

        // Speed
        playerBullets[i].rdel = 2;
    }
}

void updatePlayerBullet(ANISPRITE* playerBullet) {

    if (playerBullet->active) {

        if (playerBullet->screenRow - playerBullet->rdel < 0) {

            // When gets the screen top, remove it
            playerBullet->active = 0;

        } else {

            // Moving upward
            playerBullet->screenRow -= playerBullet->rdel;

            // Animation
            if (++playerBullet->aniCounter == 10) {

                // Reset the counter
                playerBullet->aniCounter = 0;

                // Reset the animation state to the first.
                if (++playerBullet->aniState > BULLETMOTION2) {

                    playerBullet->aniState = BULLETMOTION1;
                }
            }
        }

        // Collision with Enemies
        for (int i = 0; i < ENEMYNUMBER; i++) {

            if ((enemies[i].active == 1) && 
                collision(playerBullet->screenRow + 2, playerBullet->screenCol + 2, playerBullet->height, playerBullet->width,
                enemies[i].screenRow + 3, enemies[i].screenCol + 1, enemies[i].height, enemies[i].width)) {

                // play Hit Sound
                stopSoundB();
                playSoundB(getHitSound, GETHITSOUNDLEN, GETHITSOUNDFREQ, 0);

                // update remaininglife and the objects hit
                remainingEnemies--;
                playerBullet->active = 0;
                enemies[i].active = 2;
                enemies[i].aniCounter = 0;
                enemies[i].aniState = PRENEMYDIE1;

                // play Win Sound
                if (remainingEnemies == 0) {

                    stopSound();
                    playSoundB(RPSWinSound, RPSWINSOUNDLEN, RPSWINSOUNDFREQ, 0);
                }
            }
        }

        // Collision with Paroma (no Cheat)
        if (!isCheatOn) {
            for (int i = 0; i < PAROMANUMBER; i++) {

                if (paromas[i].active && 
                    collision(playerBullet->screenRow + 2, playerBullet->screenCol + 2, playerBullet->height, playerBullet->width,
                    paromas[i].screenRow + 1, paromas[i].screenCol + 1, paromas[i].height, paromas[i].width)) {

                    isGotParoma = 1;
                }
            }
        }
    }
}

void drawPlayerBullet(ANISPRITE* playerBullet) {

    if (playerBullet->active) {

        shadowOAM[41 + playerBullet->index].attr0 = playerBullet->screenRow | ATTR0_TALL;
        shadowOAM[41 + playerBullet->index].attr1 = playerBullet->screenCol | ATTR1_TINY;
        shadowOAM[41 + playerBullet->index].attr2 = ATTR2_TILEID(playerBullet->aniState * 2, 22);
    } else {
        shadowOAM[41 + playerBullet->index].attr0 = ATTR0_HIDE;
    }
}


// =============================== ENEMY BULLET ===============================
void initPREnemyBullet() {

    // Active
    enemyBullet.active = 0;

    // Location
    enemyBullet.screenRow = 0;
    enemyBullet.screenCol = 0;

    // Dimension
    enemyBullet.width = 4;
    enemyBullet.height = 10;

    // Speed
    enemyBullet.rdel = 1;
}

void updatePREnemyBullet() {

    if (enemyBullet.active) {

        // Move downward
        enemyBullet.screenRow += enemyBullet.rdel;

        // When it hits the ground, set it inactive
        if (enemyBullet.screenRow + enemyBullet.height - 1 >= SCREENHEIGHT) {

            enemyBullet.active = 0;
        }

        // Collision with Player
        if (player.active &&
            collision(player.screenRow + 8, player.screenCol + 8, player.height, player.width,
            enemyBullet.screenRow + 3, enemyBullet.screenCol + 2, enemyBullet.height, enemyBullet.width)) {

            // play Hit Sound
            stopSoundB();
            playSoundB(getHitSound, GETHITSOUNDLEN, GETHITSOUNDFREQ, 0);

            player.active = 0;
            player.aniState = PRPLAYERDIE1;
        }
    }
}

void drawPREnemyBullet() {

    if (enemyBullet.active) {

        shadowOAM[46].attr0 = enemyBullet.screenRow | ATTR0_TALL;
        shadowOAM[46].attr1 = enemyBullet.screenCol | ATTR1_TINY;
        shadowOAM[46].attr2 = ATTR2_TILEID(0, 23);
    } else {
        shadowOAM[46].attr0 = ATTR0_HIDE;
    }
}


// =========================== GAMESET =============================
void drawPRGameSet() {

    // Win or Lose
    shadowOAM[15].attr0 = 20 | ATTR0_WIDE;
    shadowOAM[15].attr1 = (SCREENWIDTH / 2 - 16) | ATTR1_MEDIUM;
    if (remainingEnemies == 0) {

        // Draw WIN
        shadowOAM[15].attr2 = ATTR2_TILEID(30, 16);

    } else {

        // Draw LOSE
        shadowOAM[15].attr2 = ATTR2_TILEID(28, 16);
    }

    // Button B
    shadowOAM[36].attr0 = (player.screenRow - 16) | ATTR0_SQUARE;
    shadowOAM[36].attr1 = (player.screenCol + 16) | ATTR1_SMALL;
    shadowOAM[36].attr2 = ATTR2_TILEID(28, 30);
}