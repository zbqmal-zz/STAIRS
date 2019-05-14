
//{{BLOCK(PRBG)

//======================================================================
//
//	PRBG, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 24 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 768 + 2048 = 3328
//
//	Time-stamp: 2019-04-11, 01:10:30
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_PRBG_H
#define GRIT_PRBG_H

#define PRBGTilesLen 768
extern const unsigned short PRBGTiles[384];

#define PRBGMapLen 2048
extern const unsigned short PRBGMap[1024];

#define PRBGPalLen 512
extern const unsigned short PRBGPal[256];

#endif // GRIT_PRBG_H

//}}BLOCK(PRBG)
