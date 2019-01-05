
#include <acknex.h>
#include <stdio.h>

int iNameConv[256];
var vInitialized = 0;
STRING* strParseMsg = "#100";
FILE* inFile  = NULL;
FILE* outFile = NULL;

void convert_resource(STRING* strSrcPathFile, STRING* strTgtPathFile, LIST* pFileList)
{
	long lVersion;
	long lChunkSize;
	var vEnd = 0;
	long lNumFiles = 0;

	convert_init();

	SYSMSG_print(SYSMSG_SYSTEM, "start WRS conversion...");
	inFile = fopen(strSrcPathFile->chars, "rb");
	if (inFile != NULL)
	{
		/* unlinke A3 resources all newer WRS files begin with 'WRS'" */
		lVersion = wrsget32(inFile);
		if (lVersion & 0xFFFFFF == WRS_HEADER)
		{
			#ifdef SYSMSG_ACTIVE
			SYSMSG_print(SYSMSG_ERROR, "Error: Resource file version not supported.");
			#endif
		}
		else
		{
			rewind(inFile); /* make sure to begin from first byte */

			outFile = fopen(strTgtPathFile->chars, "wb");
			if (outFile != NULL)
			{
				
				/* WRS2 header */
				wrsput32(outFile, WRS2_HEADER); 
				do
				{
					vEnd = convert_getfilename(pFileList);
					if (!vEnd)
					{

						/* 4 bytes containing encrypted size */
						lChunkSize = wrsget32(inFile);
						wrsput32(outFile, lChunkSize);
		
						/* 4 bytes containing real size - just copy */
						lChunkSize += 4;
										
						/* copy file data */
						vEnd = convert_copydata(lChunkSize);

						/* file counter */
						lNumFiles++;
					}
				} while (!vEnd);
				
				fclose(outFile);
				#ifdef SYSMSG_ACTIVE
				str_printf(strParseMsg, "%d files found in resource.", lNumFiles);
				SYSMSG_print(SYSMSG_SYSTEM, strParseMsg);
				#endif
			}
			else
			{
				#ifdef SYSMSG_ACTIVE
				str_printf(strParseMsg, "Error: Could not write to target %s", strTgtPathFile->chars);
				SYSMSG_print(SYSMSG_ERROR, strParseMsg);
				#endif
			}
		}
		fclose(inFile);
	}
	else
	{
		#ifdef SYSMSG_ACTIVE
		str_printf(strParseMsg, "Error: Could not read source %s", strSrcPathFile->chars);
		SYSMSG_print(SYSMSG_ERROR, strParseMsg);
		#endif
	}
	SYSMSG_print(SYSMSG_SYSTEM, "WRS conversion done.\r\n");
}

void convert_init()
{
	if (vInitialized != 0)
		return;
		
	vInitialized = 1;
	
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
	
	/* special characters - might need additions */
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

var convert_copydata(long lChunkSize)
{
	char* cBuffer;
	var vEnd = 0; /* end of file detected*/
	int iRet;
	
	if ((inFile != NULL) && (outFile != NULL))
	{
		cBuffer = (char*) malloc(sizeof(char) * lChunkSize);

		iRet = fread(cBuffer, lChunkSize, 1, inFile);		
		if (iRet == 1)
			fwrite(cBuffer, lChunkSize, 1, outFile);
		else
			vEnd = 1;
	  
		free (cBuffer);
	}

	return vEnd;
}

var convert_getfilename(LIST* pFileList)
{
	var i;
	int iLetter;
	var vExt = 0; /* extension not yet found */
	var vEnd = 0; /* end of file detected*/
	char cResourceFile[17];
	char cFill = '0';
	
	if ((inFile != NULL) && (outFile != NULL))
	{
		for (i = 0; i < 17; i++) /* 4 extra letters for .pak ending */
		{
			
			/* A3 only stores 12 letters + \0 */ 
			if (i < 13)
			{
				iLetter = wrsget8(inFile);
				if (iLetter == EOF)
					vEnd = 1;
			}
			else
			{
				iLetter = 0;
			}
				
			if (!vEnd)
			{
				cResourceFile[i] = (char)iLetter;
					
#ifdef blafusel
				switch (vExt)
				{
					/* patch 'pak' extension to resource file */
					case 1:
						iLetter = iNameConv['p'];
						vExt++;
						break;
						
					case 2:
						iLetter = iNameConv['a'];
						vExt++;
						break;
						
					case 3:
						iLetter = iNameConv['k'];
						vExt++;
						break;
	
					/* any letter before file extension is handled here */
					default:
						if (((char)iLetter) == '.')
							vExt = 1; /* extension found */
						iLetter = iNameConv[(iLetter & 0xFF)]; /* decrypt filename */
						break;
						
				}
#endif
#ifndef kacke
				switch (vExt)
				{
					/* patch '.pak' extension to resource file */
					case 1:
						iLetter = iNameConv['p'];
						vExt++;
						break;
						
					case 2:
						iLetter = iNameConv['a'];
						vExt++;
						break;
						
					case 3:
						iLetter = iNameConv['k'];
						vExt++;
						break;
	
					/* any letter befor file extension is handled here */
					default:
						if ((iLetter == 0) && (vExt == 0))
						{
							iLetter = iNameConv['.'];
							vExt = 1; /* end of extension found - now start to append '.pak' */
						}
						else
						{
							iLetter = iNameConv[(iLetter & 0xFF)]; /* decrypt filename */
						}
						break;
							
				}
#endif
				wrsput8(outFile, iLetter);
			}
			else
			{
				cResourceFile[i] = '\0';
			}
		}

		if (!vEnd)
		{
			LIST_append(pFileList, str_create(cResourceFile));
			#ifdef SYSMSG_ACTIVE
			str_printf(strParseMsg, "File found: %s", cResourceFile);
			SYSMSG_print(SYSMSG_ERROR, strParseMsg);
			#endif

			/* file length is 32 byte for A5 - put zeros for 32-13-4=15 bytes */
			fwrite(&cFill, 1, 15, outFile);
		}
	}
	else
	{
		vEnd = 1;
	}
	
	return vEnd;
}
