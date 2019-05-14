#ifndef RPS_GAME_H
#define RPS_GAME_H

// ============== Sound Effects ===================
#include "choosingSound.h"
#include "walkingSound.h"
#include "RPSLoseSound.h"
#include "RPSWinSound.h"
#include "RPSDrawSound.h"
// ================================================

// Constants
#define RPS_MAPHEIGHT 256
#define RPS_MAPWIDTH 512

// Variables
int RPS0_hOff, RPS0_vOff;
int RPS1_hOff, RPS1_vOff;
int walkingSoundFlag;
extern int RPSGameState, playerWeapon, enemyWeapon, isRPSPlayerWin;
extern OBJ_ATTR shadowOAM[128];
ANISPRITE player, enemy;


// Player animation states for aniState
enum {RPSPLAYERRIGHT = 1, RPSPLAYERLEFT, RPSPLAYERSTAND = 4};

// Enemy animation states for aniState
enum {RPSENEMYSTAND, RPSENEMYLEFT};

// RPS Game State
enum {RPSISNOTREADY, RPSISREADY, RPSGAMESET};

// Rock-Paper-Scissors Option
enum {ROCK, PAPER, SCISSORS};


// ============= Prototypes =============
// for RPSGame Control
void initRPSGame();
void updateRPSGame();
void drawRPSGame();

// for Player
void initRPSPlayer();
void updateRPSPlayer();
void drawRPSPlayer();

// for Enemy
void initRPSEnemy();
void updateRPSEnemy();
void drawRPSEnemy();

// for GameState
void initRPSGameState();
void updateNOTREADY();
void updateREADY();
void drawREADY();
void drawGAMESET();

// ======================================

#endif