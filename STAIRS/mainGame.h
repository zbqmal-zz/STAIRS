#ifndef MN_GAME_H
#define MN_GAME_H

// ============================== Sound Effects ====================================
#include "gameEntranceSound.h"
#include "rollingDiceSound.h"
#include "walkingSound.h"
// =================================================================================

// Constants
#define MG_MAPHEIGHT 256
#define MG_MAPWIDTH 512

// Variables
int MG0_hOff, MG0_vOff;
int MG1_hOff, MG1_vOff;
int MG2_hOff, MG2_vOff;
int randSeed, destRow, destCol, firstNum, secondNum, thirdNum, walkingSoundFlag;
OBJ_ATTR shadowOAM[128];
ANISPRITE player, dice, buttonA, buttonB, door;
extern int diceNum, isRolling, isRolled, randGame, isAtDoor, currentLevel;

// Player animation states for aniState
enum {MGPLAYERRIGHT = 1, MGPLAYERLEFT, MGPLAYERSTAND = 4};

// ============= Prototypes =============
// for StartGame Control
void initMainGame();
void updateMainGame();
void drawMainGame();

// for Player
void initMGPlayer();
void updateMGPlayer();
void drawMGPlayer();

// for Dice
void initDice();
void updateDice();
void drawDice();

// for next stages
void initStages();
void updateStages();
void drawStages();

// for Door
void initDoor();
void updateDoor();
void drawDoor();

// for levels
void drawLevel();

// ======================================

#endif