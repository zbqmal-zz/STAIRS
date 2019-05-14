#ifndef TH_GAME_H
#define TH_GAME_H

// ============================== Sound Effects ==================================
#include "THFailSound.h"
#include "THLoseSound.h"
#include "RPSWinSound.h"
#include "choosingSound.h"
// ===============================================================================

// Constants
#define TH_MAPHEIGHT 256
#define TH_MAPWIDTH 512
#define BUSHNUMBER 9
#define NUMBEROFTRIAL 5
#define CHEAT_NUMBEROFTRIAL 8

// Variables
int TH_hOff;
int TH_vOff;
extern int THGameState, playerLives, isFound;
extern OBJ_ATTR shadowOAM[128];
extern ANISPRITE playerSelect, bushes[BUSHNUMBER], treasure;

// TH Game State
enum {THCHOOSING, THGAMESET};


// ============= Prototypes =============
// for THGame Control
void initTHGame();
void updateTHGame();
void drawTHGame();

// for Bush
void initBush();
void updateBush();
void drawBush(ANISPRITE* bush);

// for Treasure
void initTreasure();
void updateTreasure();
void drawTreasure();

// for Select
void initSelect();
void updateSelect();
void drawSelect();
void drawTHGameSet();

// ======================================

#endif