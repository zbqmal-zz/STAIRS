#ifndef PR_GAME_H
#define PR_GAME_H

// ============== Sound Effects ===================
#include "PAROMAFireSound.h"
#include "PAROMALoseSound.h"
#include "getHitSound.h"
#include "PAROMASound.h"
#include "RPSWinSound.h"
// ================================================

// Constants
#define PR_MAPHEIGHT 160
#define PR_MAPWIDTH 240
#define ENEMYNUMBER 5
#define PAROMANUMBER 3
#define PLAYERBULLETNUMBER 5
#define PAROMATIMEINTERVAL 50
#define PLAYERBULLETRELOADINTERVAL 20

// Variables
int PR_hOff;
int PR_vOff;
int playerBulletTimer, enemyBulletTimer, isCheatOn;
ANISPRITE player, playerBullets[PLAYERBULLETNUMBER], enemies[ENEMYNUMBER], enemyBullet, paromas[PAROMANUMBER];
extern int PRGameState, remainingEnemies,isGotParoma;
extern OBJ_ATTR shadowOAM[128];

// PAROMA Game State
enum {PRSHOOTING, PRGAMESET};

// Sprites Animation
enum {PRPLAYERFRONT, PRPLAYERLEFT, PRPLAYERRIGHT, PRPLAYERDIE1, PRPLAYERDIE2};
enum {PRENEMYLEFT, PRENEMYRIGHT, PRENEMYDIE1, PRENEMYDIE2, PRENEMYDIE3};
enum {PAROMAMOTION1, PAROMAMOTION2, PAROMAMOTION3, PAROMAMOTION4};
enum {BULLETMOTION1, BULLETMOTION2};


// ============= Prototypes =============
// for PAROMAGame Control
void initPAROMAGame();
void updatePAROMAGame();
void fireBullet();
void drawPAROMAGame();

// for Player
void initPRPlayer();
void updatePRPlayer();
void drawPRPlayer();

// for PlayerBullets
void initPlayerBullets();
void updatePlayerBullet(ANISPRITE* playerBullet);
void drawPlayerBullet(ANISPRITE* playerBullet);

// for Enemies
void initPREnemies();
void updatePREnemy(ANISPRITE* enemy);
void drawPREnemy(ANISPRITE* enemy);

// for EnemyBullet
void initPREnemyBullet();
void updatePREnemyBullet();
void drawPREnemyBullet();

// for Paromas
void initParomas();
void updateParoma(ANISPRITE* paroma);
void drawParoma(ANISPRITE* paroma);

// for GAMESET
void drawPRGameSet();

// ======================================

#endif