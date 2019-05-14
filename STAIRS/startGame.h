#ifndef ST_GAME_H
#define ST_GAME_H

// ============================== Sound Effects ===================================
#include "walkingSound.h"
// ================================================================================

// Constants
#define SG_MAPHEIGHT 160
#define SG_MAPWIDTH 480

// Variables
extern int SG_hOff;
extern int SG_vOff;
extern int isOnMenu;
extern int goingOnMenu;
extern int menuOption;
extern OBJ_ATTR shadowOAM[128];
ANISPRITE player, character_S1, character_T, character_A, character_I, character_R, character_S2, highlighter, buttonB;
int walkingSoundFlag;

// Player animation states for aniState
enum {PLAYERFRONT, PLAYERRIGHT, PLAYERLEFT, PLAYERBACK, PLAYERSTAND};

// Menu Option
enum {NONE, MENU_INSTRUCTION, MENU_GAMESTART};


// ============= Prototypes =============
// for StartGame Control
void initStartGame();
void updateStartGame();
void drawStartGame();

// for Player
void initSGPlayer();
void updateSGPlayer();
void drawSGPlayer();

// for Highlighter
void initHighlighter();
void updateHighlighter();
void drawHighlighter();

// for buttonB
void initButtonB();
void updateButtonB();
void drawButtonB();

// for Title
void initTitle();
void updateTitle();
void drawTitle();

// for moving Screen
void movingScreen();
// ======================================

#endif