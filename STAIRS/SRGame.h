#ifndef SR_GAME_H
#define SR_GAME_H

// Constants
#define SR_MAPHEIGHT 160
#define SR_MAPWIDTH 512
#define SR_COMPUTERSPEED 20
#define SR_CHEATSPEED 10

// Variables
int SR_hOff;
int SR_vOff;
ANISPRITE player, SRComputer[2];
extern int SRGameState, isSRPlayerWin;
extern OBJ_ATTR shadowOAM[128];

// Swimming Race Game State
enum {SRRACING, SRGAMESET};

// Swimming Animation
enum {SRMOTION1, SRMOTION2, SRMOTION3, SRMOTION4};


// ============= Prototypes =============
// for Swimming Race Game Control
void initSRGame();
void updateSRGame();
void drawSRGame();

// for Player
void initSRPlayer();
void updateSRPlayer();
void drawSRPlayer();

// for Computers
void initSRComputers();
void updateSRComputer(ANISPRITE * computer);
void drawSRComputer(ANISPRITE * computer);

// for GAMESET
void drawSRGameSet();

// ======================================

#endif