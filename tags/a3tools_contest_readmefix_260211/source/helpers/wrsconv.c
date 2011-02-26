#include <acknex.h>
#include <default.c>

/* converts A3 WRS to A5 WRS
 * quick and dirty, but good. 
 */

#define put8(f,d) file_asc_write(f,d&0xFF)
#define put32(f,d) file_asc_write(f,(d>>24)&0xFF); file_asc_write(f,(d>>16)&0xFF); file_asc_write(f,(d>>8)&0xFF); file_asc_write(f,d&0xFF)   

#define get8(f)   (file_asc_read(f))
#define get32(f) (((long)file_asc_read(f))<<24) | (((long)file_asc_read(f))<<16) | (((long)file_asc_read(f))<<8) | ((long)file_asc_read(f))
 
#define EOF -1

STRING* strSrcPath = "E:\\a3games\\opdemo3_src\\demo3.wrs";
STRING* strTgtPath = "E:\\a3games\\opdemo3_src\\demo3_a5.wrs";

int iNameConv[256];

void lookup_init()
{
	/* nullify everything */
	memset(iNameConv, 0x0, sizeof(int) * 256);
	
	/* there certainly IS some logic inside... but.. lookup tables ftw! */
	iNameConv['a'] = 0xC4;
	iNameConv['b'] = 0xC7;
	iNameConv['c'] = 0xC6;
	iNameConv['d'] = 0xC1;
	iNameConv['e'] = 0xC0;
	iNameConv['f'] = 0xC3;
	iNameConv['g'] = 0xC2;
	iNameConv['h'] = 0xCD;
	iNameConv['i'] = 0xCC;
	iNameConv['j'] = 0xCF;
	iNameConv['k'] = 0xCE;
	iNameConv['l'] = 0xC9;
	iNameConv['m'] = 0xC8;
	iNameConv['n'] = 0xCB;
	iNameConv['o'] = 0xCA;
	iNameConv['p'] = 0xD5;
	iNameConv['q'] = 0xD4;
	iNameConv['r'] = 0xD7;
	iNameConv['s'] = 0xD6;
	iNameConv['t'] = 0xD1;
	iNameConv['u'] = 0xD0;
	iNameConv['v'] = 0xD3;
	iNameConv['w'] = 0xD2;
	iNameConv['x'] = 0xDD;
	iNameConv['y'] = 0xDC;
	iNameConv['z'] = 0xDF;
	
	iNameConv['A'] = 0xC4;
	iNameConv['B'] = 0xC7;
	iNameConv['C'] = 0xC6;
	iNameConv['D'] = 0xC1;
	iNameConv['E'] = 0xC0;
	iNameConv['F'] = 0xC3;
	iNameConv['G'] = 0xC2;
	iNameConv['H'] = 0xCD;
	iNameConv['I'] = 0xCC;
	iNameConv['J'] = 0xCF;
	iNameConv['K'] = 0xCE;
	iNameConv['L'] = 0xC9;
	iNameConv['M'] = 0xC8;
	iNameConv['N'] = 0xCB;
	iNameConv['O'] = 0xCA;
	iNameConv['P'] = 0xD5;
	iNameConv['Q'] = 0xD4;
	iNameConv['R'] = 0xD7;
	iNameConv['S'] = 0xD6;
	iNameConv['T'] = 0xD1;
	iNameConv['U'] = 0xD0;
	iNameConv['V'] = 0xD3;
	iNameConv['W'] = 0xD2;
	iNameConv['X'] = 0xDD;
	iNameConv['Y'] = 0xDC;
	iNameConv['Z'] = 0xDF;
	
	/* something seems to be wrong here... use small letters instead
	iNameConv['A'] = 0xE4;
	iNameConv['B'] = 0xE7;
	iNameConv['C'] = 0xE6;
	iNameConv['D'] = 0xE1;
	iNameConv['E'] = 0xE0;
	iNameConv['F'] = 0xE3;
	iNameConv['G'] = 0xE2;
	iNameConv['H'] = 0xED;
	iNameConv['I'] = 0xEC;
	iNameConv['J'] = 0xEF;
	iNameConv['K'] = 0xEE;
	iNameConv['L'] = 0xE9;
	iNameConv['M'] = 0xE8;
	iNameConv['N'] = 0xFB;
	iNameConv['O'] = 0xFA;
	iNameConv['P'] = 0xF5;
	iNameConv['Q'] = 0xF4;
	iNameConv['R'] = 0xF7;
	iNameConv['S'] = 0xF6;
	iNameConv['T'] = 0xF1;
	iNameConv['U'] = 0xF0;
	iNameConv['V'] = 0xF3;
	iNameConv['W'] = 0xF2;
	iNameConv['X'] = 0xFD;
	iNameConv['Y'] = 0xFC;
	iNameConv['Z'] = 0xFF;
	*/
	
	iNameConv['.'] = 0x8B;
	iNameConv['+'] = 0x8E;
	iNameConv['_'] = 0xFA;
	iNameConv['\\'] = 0xE9;
	iNameConv[']'] = 0xE8;
	
	iNameConv['0'] = 0x95;
	iNameConv['1'] = 0x94;
	iNameConv['2'] = 0x97;
	iNameConv['3'] = 0x96;
	iNameConv['4'] = 0x91;
	iNameConv['5'] = 0x90;
	iNameConv['6'] = 0x93;
	iNameConv['7'] = 0x92;
	iNameConv['8'] = 0x9D;
	iNameConv['9'] = 0x9C;
}


void main()
{
	int x;
	long i;
	long l;
	long s;
	
	var vHandleR = file_open_read(strSrcPath);
	var vHandleW = file_open_write(strTgtPath);

	wait(1);
	if (vHandleR)
	{
		if (vHandleW)
		{
			printf("Start patching... Don't panic, just wait!");
	
			/* set lookup table for filenames */
			lookup_init();
			
			/* WRS2 header */
			put8(vHandleW, 0x57); /* W */
			put8(vHandleW, 0x52); /* R */
			put8(vHandleW, 0x53); /* S */
			put8(vHandleW, 0x32); /* 2 */

			do
			{
				/* read file info */
				for (i = 0; i < 13; i++)
				{
					x = get8(vHandleR);
					if (x != EOF)
					{
//						printf("%c", x&0xFF);
						x = iNameConv[(x & 0xFF)]; /* decrypt filename */
						put8(vHandleW, x);
					}
				}

				if (x != EOF)
				{
					/* file length is 32 byte for A5 - put zeros */
					for (i = 0; i < 19; i++)
						put8(vHandleW, 0);

					/* 4 bytes containing encrypted size */
					l = get32(vHandleR);
					put32(vHandleW, l);
//					printf("%d %x", l, l);
	
					/* 4 bytes containing real size */
					s = get32(vHandleR);
					put32(vHandleW, s);
									
					/* data section */
					for (i = 0; i < l; i++)
					{
						x = get8(vHandleR);
						put8(vHandleW, x);
					}
				}					
			}while(x != EOF);
			
			file_close(vHandleW);
		}
		else
		{
			error("Could not create target");
		}
		file_close(vHandleR);
	}
	else
	{
		error("Could not read from soruce");
	}

	printf("done.");
	sys_exit("");
}