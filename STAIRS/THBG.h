
//{{BLOCK(THBG)

//======================================================================
//
//	THBG, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 65 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 2080 + 2048 = 4640
//
//	Time-stamp: 2019-04-07, 23:39:45
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_THBG_H
#define GRIT_THBG_H

#define THBGTilesLen 2080
extern const unsigned short THBGTiles[1040];

#define THBGMapLen 2048
extern const unsigned short THBGMap[1024];

#define THBGPalLen 512
extern const unsigned short THBGPal[256];

#endif // GRIT_THBG_H

//}}BLOCK(THBG)
