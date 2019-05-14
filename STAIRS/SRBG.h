
//{{BLOCK(SRBG)

//======================================================================
//
//	SRBG, 512x256@4, 
//	+ palette 256 entries, not compressed
//	+ 9 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 64x32 
//	Total size: 512 + 288 + 4096 = 4896
//
//	Time-stamp: 2019-04-14, 21:13:04
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_SRBG_H
#define GRIT_SRBG_H

#define SRBGTilesLen 288
extern const unsigned short SRBGTiles[144];

#define SRBGMapLen 4096
extern const unsigned short SRBGMap[2048];

#define SRBGPalLen 512
extern const unsigned short SRBGPal[256];

#endif // GRIT_SRBG_H

//}}BLOCK(SRBG)
