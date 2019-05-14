
//{{BLOCK(mainGameBG)

//======================================================================
//
//	mainGameBG, 512x256@4, 
//	+ palette 256 entries, not compressed
//	+ 17 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 64x32 
//	Total size: 512 + 544 + 4096 = 5152
//
//	Time-stamp: 2019-04-07, 17:40:07
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_MAINGAMEBG_H
#define GRIT_MAINGAMEBG_H

#define mainGameBGTilesLen 544
extern const unsigned short mainGameBGTiles[272];

#define mainGameBGMapLen 4096
extern const unsigned short mainGameBGMap[2048];

#define mainGameBGPalLen 512
extern const unsigned short mainGameBGPal[256];

#endif // GRIT_MAINGAMEBG_H

//}}BLOCK(mainGameBG)
