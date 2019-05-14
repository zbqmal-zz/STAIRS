
//{{BLOCK(startBG)

//======================================================================
//
//	startBG, 512x256@4, 
//	+ palette 256 entries, not compressed
//	+ 968 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 64x32 
//	Total size: 512 + 30976 + 4096 = 35584
//
//	Time-stamp: 2019-04-14, 21:55:53
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_STARTBG_H
#define GRIT_STARTBG_H

#define startBGTilesLen 30976
extern const unsigned short startBGTiles[15488];

#define startBGMapLen 4096
extern const unsigned short startBGMap[2048];

#define startBGPalLen 512
extern const unsigned short startBGPal[256];

#endif // GRIT_STARTBG_H

//}}BLOCK(startBG)
