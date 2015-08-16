/* Search for dos, bios and mouse functions */
/* Made by Atle Holm */

#include <iostream.h>
#include <stdio.h>
#include <conio.h>
#include <string.h>
#include <ctype.h>
#include <stdlib.h>
#include <dos.h>
#include "dosf.h"

#define CR 0x0d
#define BC 0x08
#define LF 0x0a
#define ESC 0x1b

void dos(void);
void bios(void);
void mouse(void);
void main(void);
void database(char *ftype);
void futypes(void);
void endprog(void);
void mainer(void);
void iregs(void);
void lfunc(void);

int author=1;

void main()
{
	char ftype[7];
   char *funcer[3]={"bios","mouse","dos"};
   int x;

   ms_init();
	if(rodent.exists)delay(100);
   else
   {
   	printf("ERROR: Mouse not present or mouse driver not loaded.\n");
      exit(0);
   }
   if(author--)
   {
      clrscr();
      locate(10,12);
   	puts("Function Search Program, by Atle Holm.\n");
      locate(14,13);
      puts("(Hit a mouse button to continue)");
		waitclick(EITHER);
      clrscr();
   }
   /* Clear the input buffer */
   inregs.h.ah=0x0C;
   int86(0x21,&inregs,&outregs);
   ms_setvrange(6*8,25*8);
   ms_sethrange(0*8,67*8);
   ms_movecrsr(1*8,1*8);
   ms_showcrsr();
   clrscr();

   locate(1,4);
   for(x=0;x<80;x++)putch('_');
   locate(2,6);
   printf("Current Status:");
   locate(45,14);
   printf("List of Function Types");
   locate(45,15);
   printf("Processor Registers");
   locate(45,16);
   printf("List of Functions");
   locate(45,17);
   printf("Type in Function Type");
   locate(45,18);
   printf("Quit");
   locate(1,25);
   printf("\(Click mouse to continue from a menu\)");
   locate(1,2);
   puts("Enter the type of function you are going to search for(feks. bios):");

	do
   {
   	ms_getstatus();
      if(rodent.btnstatus==1 && (rodent.row/8+1)==14 && (rodent.column/8+1)==66)futypes();
      if(rodent.btnstatus==1 && (rodent.row/8+1)==14 && (rodent.column/8+1)==65)futypes();
      if(rodent.btnstatus==1 && (rodent.row/8+1)==14 && (rodent.column/8+1)==64)futypes();
      if(rodent.btnstatus==1 && (rodent.row/8+1)==14 && (rodent.column/8+1)==63)futypes();
      if(rodent.btnstatus==1 && (rodent.row/8+1)==14 && (rodent.column/8+1)==62)futypes();
      if(rodent.btnstatus==1 && (rodent.row/8+1)==14 && (rodent.column/8+1)==61)futypes();
      if(rodent.btnstatus==1 && (rodent.row/8+1)==14 && (rodent.column/8+1)==60)futypes();
      if(rodent.btnstatus==1 && (rodent.row/8+1)==14 && (rodent.column/8+1)==59)futypes();
      if(rodent.btnstatus==1 && (rodent.row/8+1)==14 && (rodent.column/8+1)==58)futypes();
      if(rodent.btnstatus==1 && (rodent.row/8+1)==14 && (rodent.column/8+1)==57)futypes();
      if(rodent.btnstatus==1 && (rodent.row/8+1)==14 && (rodent.column/8+1)==56)futypes();
      if(rodent.btnstatus==1 && (rodent.row/8+1)==14 && (rodent.column/8+1)==55)futypes();
      if(rodent.btnstatus==1 && (rodent.row/8+1)==14 && (rodent.column/8+1)==54)futypes();
      if(rodent.btnstatus==1 && (rodent.row/8+1)==14 && (rodent.column/8+1)==53)futypes();
      if(rodent.btnstatus==1 && (rodent.row/8+1)==14 && (rodent.column/8+1)==52)futypes();
      if(rodent.btnstatus==1 && (rodent.row/8+1)==14 && (rodent.column/8+1)==51)futypes();
      if(rodent.btnstatus==1 && (rodent.row/8+1)==14 && (rodent.column/8+1)==50)futypes();
      if(rodent.btnstatus==1 && (rodent.row/8+1)==14 && (rodent.column/8+1)==49)futypes();
      if(rodent.btnstatus==1 && (rodent.row/8+1)==14 && (rodent.column/8+1)==48)futypes();
      if(rodent.btnstatus==1 && (rodent.row/8+1)==14 && (rodent.column/8+1)==47)futypes();
      if(rodent.btnstatus==1 && (rodent.row/8+1)==14 && (rodent.column/8+1)==46)futypes();
      if(rodent.btnstatus==1 && (rodent.row/8+1)==14 && (rodent.column/8+1)==45)futypes();
      if(rodent.btnstatus==1 && (rodent.row/8+1)==14 && (rodent.column/8+1)==44)futypes();
      if(rodent.btnstatus==1 && (rodent.row/8+1)==16 && (rodent.column/8+1)==44)lfunc();
      if(rodent.btnstatus==1 && (rodent.row/8+1)==16 && (rodent.column/8+1)==45)lfunc();
      if(rodent.btnstatus==1 && (rodent.row/8+1)==16 && (rodent.column/8+1)==46)lfunc();
      if(rodent.btnstatus==1 && (rodent.row/8+1)==16 && (rodent.column/8+1)==47)lfunc();
      if(rodent.btnstatus==1 && (rodent.row/8+1)==16 && (rodent.column/8+1)==48)lfunc();
      if(rodent.btnstatus==1 && (rodent.row/8+1)==16 && (rodent.column/8+1)==49)lfunc();
      if(rodent.btnstatus==1 && (rodent.row/8+1)==16 && (rodent.column/8+1)==50)lfunc();
      if(rodent.btnstatus==1 && (rodent.row/8+1)==16 && (rodent.column/8+1)==51)lfunc();
      if(rodent.btnstatus==1 && (rodent.row/8+1)==16 && (rodent.column/8+1)==52)lfunc();
      if(rodent.btnstatus==1 && (rodent.row/8+1)==16 && (rodent.column/8+1)==53)lfunc();
      if(rodent.btnstatus==1 && (rodent.row/8+1)==16 && (rodent.column/8+1)==54)lfunc();
      if(rodent.btnstatus==1 && (rodent.row/8+1)==16 && (rodent.column/8+1)==55)lfunc();
      if(rodent.btnstatus==1 && (rodent.row/8+1)==16 && (rodent.column/8+1)==56)lfunc();
      if(rodent.btnstatus==1 && (rodent.row/8+1)==16 && (rodent.column/8+1)==57)lfunc();
      if(rodent.btnstatus==1 && (rodent.row/8+1)==16 && (rodent.column/8+1)==58)lfunc();
      if(rodent.btnstatus==1 && (rodent.row/8+1)==16 && (rodent.column/8+1)==59)lfunc();
      if(rodent.btnstatus==1 && (rodent.row/8+1)==16 && (rodent.column/8+1)==60)lfunc();
      if(rodent.btnstatus==1 && (rodent.row/8+1)==16 && (rodent.column/8+1)==61)lfunc();
      if(rodent.btnstatus==1 && (rodent.row/8+1)==17 && (rodent.column/8+1)==66)break;
      if(rodent.btnstatus==1 && (rodent.row/8+1)==17 && (rodent.column/8+1)==65)break;
      if(rodent.btnstatus==1 && (rodent.row/8+1)==17 && (rodent.column/8+1)==64)break;
      if(rodent.btnstatus==1 && (rodent.row/8+1)==17 && (rodent.column/8+1)==63)break;
      if(rodent.btnstatus==1 && (rodent.row/8+1)==17 && (rodent.column/8+1)==62)break;
      if(rodent.btnstatus==1 && (rodent.row/8+1)==17 && (rodent.column/8+1)==61)break;
      if(rodent.btnstatus==1 && (rodent.row/8+1)==17 && (rodent.column/8+1)==60)break;
      if(rodent.btnstatus==1 && (rodent.row/8+1)==17 && (rodent.column/8+1)==59)break;
      if(rodent.btnstatus==1 && (rodent.row/8+1)==17 && (rodent.column/8+1)==58)break;
      if(rodent.btnstatus==1 && (rodent.row/8+1)==17 && (rodent.column/8+1)==57)break;
      if(rodent.btnstatus==1 && (rodent.row/8+1)==17 && (rodent.column/8+1)==56)break;
      if(rodent.btnstatus==1 && (rodent.row/8+1)==17 && (rodent.column/8+1)==55)break;
      if(rodent.btnstatus==1 && (rodent.row/8+1)==17 && (rodent.column/8+1)==54)break;
      if(rodent.btnstatus==1 && (rodent.row/8+1)==17 && (rodent.column/8+1)==53)break;
      if(rodent.btnstatus==1 && (rodent.row/8+1)==17 && (rodent.column/8+1)==52)break;
      if(rodent.btnstatus==1 && (rodent.row/8+1)==17 && (rodent.column/8+1)==51)break;
      if(rodent.btnstatus==1 && (rodent.row/8+1)==17 && (rodent.column/8+1)==50)break;
      if(rodent.btnstatus==1 && (rodent.row/8+1)==17 && (rodent.column/8+1)==49)break;
      if(rodent.btnstatus==1 && (rodent.row/8+1)==17 && (rodent.column/8+1)==48)break;
      if(rodent.btnstatus==1 && (rodent.row/8+1)==17 && (rodent.column/8+1)==47)break;
      if(rodent.btnstatus==1 && (rodent.row/8+1)==17 && (rodent.column/8+1)==46)break;
      if(rodent.btnstatus==1 && (rodent.row/8+1)==17 && (rodent.column/8+1)==45)break;
      if(rodent.btnstatus==1 && (rodent.row/8+1)==17 && (rodent.column/8+1)==44)break;
      if(rodent.btnstatus==1 && (rodent.row/8+1)==18 && (rodent.column/8+1)==48)endprog();
      if(rodent.btnstatus==1 && (rodent.row/8+1)==18 && (rodent.column/8+1)==47)endprog();
      if(rodent.btnstatus==1 && (rodent.row/8+1)==18 && (rodent.column/8+1)==46)endprog();
      if(rodent.btnstatus==1 && (rodent.row/8+1)==18 && (rodent.column/8+1)==45)endprog();
      if(rodent.btnstatus==1 && (rodent.row/8+1)==18 && (rodent.column/8+1)==44)endprog();
      if(rodent.btnstatus==1 && (rodent.row/8+1)==15 && (rodent.column/8+1)==44)iregs();
      if(rodent.btnstatus==1 && (rodent.row/8+1)==15 && (rodent.column/8+1)==45)iregs();
		if(rodent.btnstatus==1 && (rodent.row/8+1)==15 && (rodent.column/8+1)==46)iregs();
      if(rodent.btnstatus==1 && (rodent.row/8+1)==15 && (rodent.column/8+1)==47)iregs();
      if(rodent.btnstatus==1 && (rodent.row/8+1)==15 && (rodent.column/8+1)==48)iregs();
      if(rodent.btnstatus==1 && (rodent.row/8+1)==15 && (rodent.column/8+1)==49)iregs();
      if(rodent.btnstatus==1 && (rodent.row/8+1)==15 && (rodent.column/8+1)==50)iregs();
      if(rodent.btnstatus==1 && (rodent.row/8+1)==15 && (rodent.column/8+1)==51)iregs();
      if(rodent.btnstatus==1 && (rodent.row/8+1)==15 && (rodent.column/8+1)==52)iregs();
      if(rodent.btnstatus==1 && (rodent.row/8+1)==15 && (rodent.column/8+1)==53)iregs();
      if(rodent.btnstatus==1 && (rodent.row/8+1)==15 && (rodent.column/8+1)==54)iregs();
      if(rodent.btnstatus==1 && (rodent.row/8+1)==15 && (rodent.column/8+1)==55)iregs();
      if(rodent.btnstatus==1 && (rodent.row/8+1)==15 && (rodent.column/8+1)==56)iregs();
      if(rodent.btnstatus==1 && (rodent.row/8+1)==15 && (rodent.column/8+1)==57)iregs();
      if(rodent.btnstatus==1 && (rodent.row/8+1)==15 && (rodent.column/8+1)==58)iregs();
      if(rodent.btnstatus==1 && (rodent.row/8+1)==15 && (rodent.column/8+1)==59)iregs();
      if(rodent.btnstatus==1 && (rodent.row/8+1)==15 && (rodent.column/8+1)==60)iregs();
      if(rodent.btnstatus==1 && (rodent.row/8+1)==15 && (rodent.column/8+1)==61)iregs();
      if(rodent.btnstatus==1 && (rodent.row/8+1)==15 && (rodent.column/8+1)==62)iregs();
      if(rodent.btnstatus==1 && (rodent.row/8+1)==15 && (rodent.column/8+1)==63)iregs();
	}while(1);
   for(x=0;x<7;x++)ftype[x]='?';
   x=0;
   locate(4,7);
   printf("Getting Function Type");
   locate(1,3);
   inregs.h.ah=0x0C;
   int86(0x21,&inregs,&outregs);
   do
   {
      if(x==6)
      {
         puts("\n\nInput buffer full(only 6 bytes allowed).");
         getch();
      	ftype[x]=NULL;
         clrscr();
      }
      if(x!=6)ftype[x]=getch();
		switch(ftype[x])
      {
         case(ESC):
         		ms_init();
               ms_hidecrsr();
					endprog();
      	case(CR):
         		ftype[x]=NULL;
               putch(LF);
               break;
         case(BC):
               if(x==0)break;
               putch(BC);
               putch(' ');
               putch(BC);
               x--;
               break;
         case(NULL):
         		break;
			default:
         		putch(ftype[x]);
               x++;
               break;
      }
   }
   while(ftype[x]!=NULL);
   x=0;
   do
   {
   	if(x==3)break;
   }while(strcmpi(ftype,funcer[x++])!=0);
   if(strcmpi(ftype,funcer[--x])==0)database(funcer[x]); //database() gets the memory adress to funcer[x]
   else
   {
		clrscr();
   	printf("ERROR: Did not find that function type!\n");
      ms_init();
      ms_hidecrsr();
      exit(0);
   }
}
void mainer()			/* I did not want to, but I had to copy the main function and call it mainer. So that all the other functions could call it without having variabel author put back to 1(and displaying authors name each time main was called) */
{
	char ftype[7];
   char *funcer[3]={"bios","mouse","dos"};
   int x;

   /* Clear the input buffer */
   inregs.h.ah=0x0C;
   int86(0x21,&inregs,&outregs);
   ms_showcrsr();
   clrscr();
   locate(1,4);
   for(x=0;x<80;x++)putch('_');
   locate(2,6);
   printf("Current Status:");
   locate(45,14);
   printf("List of Function Types");
   locate(45,15);
   printf("Processor Registers");
   locate(45,16);
   printf("List of Functions");
   locate(45,17);
   printf("Type in Function type");
   locate(45,18);
   printf("Quit");
   locate(1,25);
   printf("\(Click mouse to continue from a menu\)");
   locate(1,2);
   puts("Enter the type of function you are going to search for(feks. bios):");
	do
   {
   	ms_getstatus();
      if(rodent.btnstatus==1 && (rodent.row/8+1)==14 && (rodent.column/8+1)==66)futypes();
      if(rodent.btnstatus==1 && (rodent.row/8+1)==14 && (rodent.column/8+1)==65)futypes();
      if(rodent.btnstatus==1 && (rodent.row/8+1)==14 && (rodent.column/8+1)==64)futypes();
      if(rodent.btnstatus==1 && (rodent.row/8+1)==14 && (rodent.column/8+1)==63)futypes();
      if(rodent.btnstatus==1 && (rodent.row/8+1)==14 && (rodent.column/8+1)==62)futypes();
      if(rodent.btnstatus==1 && (rodent.row/8+1)==14 && (rodent.column/8+1)==61)futypes();
      if(rodent.btnstatus==1 && (rodent.row/8+1)==14 && (rodent.column/8+1)==60)futypes();
      if(rodent.btnstatus==1 && (rodent.row/8+1)==14 && (rodent.column/8+1)==59)futypes();
      if(rodent.btnstatus==1 && (rodent.row/8+1)==14 && (rodent.column/8+1)==58)futypes();
      if(rodent.btnstatus==1 && (rodent.row/8+1)==14 && (rodent.column/8+1)==57)futypes();
      if(rodent.btnstatus==1 && (rodent.row/8+1)==14 && (rodent.column/8+1)==56)futypes();
      if(rodent.btnstatus==1 && (rodent.row/8+1)==14 && (rodent.column/8+1)==55)futypes();
      if(rodent.btnstatus==1 && (rodent.row/8+1)==14 && (rodent.column/8+1)==54)futypes();
      if(rodent.btnstatus==1 && (rodent.row/8+1)==14 && (rodent.column/8+1)==53)futypes();
      if(rodent.btnstatus==1 && (rodent.row/8+1)==14 && (rodent.column/8+1)==52)futypes();
      if(rodent.btnstatus==1 && (rodent.row/8+1)==14 && (rodent.column/8+1)==51)futypes();
      if(rodent.btnstatus==1 && (rodent.row/8+1)==14 && (rodent.column/8+1)==50)futypes();
      if(rodent.btnstatus==1 && (rodent.row/8+1)==14 && (rodent.column/8+1)==49)futypes();
      if(rodent.btnstatus==1 && (rodent.row/8+1)==14 && (rodent.column/8+1)==48)futypes();
      if(rodent.btnstatus==1 && (rodent.row/8+1)==14 && (rodent.column/8+1)==47)futypes();
      if(rodent.btnstatus==1 && (rodent.row/8+1)==14 && (rodent.column/8+1)==46)futypes();
      if(rodent.btnstatus==1 && (rodent.row/8+1)==14 && (rodent.column/8+1)==45)futypes();
      if(rodent.btnstatus==1 && (rodent.row/8+1)==14 && (rodent.column/8+1)==44)futypes();
      if(rodent.btnstatus==1 && (rodent.row/8+1)==17 && (rodent.column/8+1)==66)break;
      if(rodent.btnstatus==1 && (rodent.row/8+1)==17 && (rodent.column/8+1)==65)break;
      if(rodent.btnstatus==1 && (rodent.row/8+1)==17 && (rodent.column/8+1)==64)break;
      if(rodent.btnstatus==1 && (rodent.row/8+1)==17 && (rodent.column/8+1)==63)break;
      if(rodent.btnstatus==1 && (rodent.row/8+1)==17 && (rodent.column/8+1)==62)break;
      if(rodent.btnstatus==1 && (rodent.row/8+1)==17 && (rodent.column/8+1)==61)break;
      if(rodent.btnstatus==1 && (rodent.row/8+1)==17 && (rodent.column/8+1)==60)break;
      if(rodent.btnstatus==1 && (rodent.row/8+1)==17 && (rodent.column/8+1)==59)break;
      if(rodent.btnstatus==1 && (rodent.row/8+1)==17 && (rodent.column/8+1)==58)break;
      if(rodent.btnstatus==1 && (rodent.row/8+1)==17 && (rodent.column/8+1)==57)break;
      if(rodent.btnstatus==1 && (rodent.row/8+1)==17 && (rodent.column/8+1)==56)break;
      if(rodent.btnstatus==1 && (rodent.row/8+1)==17 && (rodent.column/8+1)==55)break;
      if(rodent.btnstatus==1 && (rodent.row/8+1)==17 && (rodent.column/8+1)==54)break;
      if(rodent.btnstatus==1 && (rodent.row/8+1)==17 && (rodent.column/8+1)==53)break;
      if(rodent.btnstatus==1 && (rodent.row/8+1)==17 && (rodent.column/8+1)==52)break;
      if(rodent.btnstatus==1 && (rodent.row/8+1)==17 && (rodent.column/8+1)==51)break;
      if(rodent.btnstatus==1 && (rodent.row/8+1)==17 && (rodent.column/8+1)==50)break;
      if(rodent.btnstatus==1 && (rodent.row/8+1)==17 && (rodent.column/8+1)==49)break;
      if(rodent.btnstatus==1 && (rodent.row/8+1)==17 && (rodent.column/8+1)==48)break;
      if(rodent.btnstatus==1 && (rodent.row/8+1)==17 && (rodent.column/8+1)==47)break;
      if(rodent.btnstatus==1 && (rodent.row/8+1)==17 && (rodent.column/8+1)==46)break;
      if(rodent.btnstatus==1 && (rodent.row/8+1)==17 && (rodent.column/8+1)==45)break;
      if(rodent.btnstatus==1 && (rodent.row/8+1)==17 && (rodent.column/8+1)==44)break;
      if(rodent.btnstatus==1 && (rodent.row/8+1)==18 && (rodent.column/8+1)==48)endprog();
      if(rodent.btnstatus==1 && (rodent.row/8+1)==18 && (rodent.column/8+1)==47)endprog();
      if(rodent.btnstatus==1 && (rodent.row/8+1)==18 && (rodent.column/8+1)==46)endprog();
      if(rodent.btnstatus==1 && (rodent.row/8+1)==18 && (rodent.column/8+1)==45)endprog();
      if(rodent.btnstatus==1 && (rodent.row/8+1)==18 && (rodent.column/8+1)==44)endprog();
      if(rodent.btnstatus==1 && (rodent.row/8+1)==15 && (rodent.column/8+1)==44)iregs();
      if(rodent.btnstatus==1 && (rodent.row/8+1)==15 && (rodent.column/8+1)==45)iregs();
		if(rodent.btnstatus==1 && (rodent.row/8+1)==15 && (rodent.column/8+1)==46)iregs();
      if(rodent.btnstatus==1 && (rodent.row/8+1)==15 && (rodent.column/8+1)==47)iregs();
      if(rodent.btnstatus==1 && (rodent.row/8+1)==15 && (rodent.column/8+1)==48)iregs();
      if(rodent.btnstatus==1 && (rodent.row/8+1)==15 && (rodent.column/8+1)==49)iregs();
      if(rodent.btnstatus==1 && (rodent.row/8+1)==15 && (rodent.column/8+1)==50)iregs();
      if(rodent.btnstatus==1 && (rodent.row/8+1)==15 && (rodent.column/8+1)==51)iregs();
      if(rodent.btnstatus==1 && (rodent.row/8+1)==15 && (rodent.column/8+1)==52)iregs();
      if(rodent.btnstatus==1 && (rodent.row/8+1)==15 && (rodent.column/8+1)==53)iregs();
      if(rodent.btnstatus==1 && (rodent.row/8+1)==15 && (rodent.column/8+1)==54)iregs();
      if(rodent.btnstatus==1 && (rodent.row/8+1)==15 && (rodent.column/8+1)==55)iregs();
      if(rodent.btnstatus==1 && (rodent.row/8+1)==15 && (rodent.column/8+1)==56)iregs();
      if(rodent.btnstatus==1 && (rodent.row/8+1)==15 && (rodent.column/8+1)==57)iregs();
      if(rodent.btnstatus==1 && (rodent.row/8+1)==15 && (rodent.column/8+1)==58)iregs();
      if(rodent.btnstatus==1 && (rodent.row/8+1)==15 && (rodent.column/8+1)==59)iregs();
      if(rodent.btnstatus==1 && (rodent.row/8+1)==15 && (rodent.column/8+1)==60)iregs();
      if(rodent.btnstatus==1 && (rodent.row/8+1)==15 && (rodent.column/8+1)==61)iregs();
      if(rodent.btnstatus==1 && (rodent.row/8+1)==15 && (rodent.column/8+1)==62)iregs();
      if(rodent.btnstatus==1 && (rodent.row/8+1)==15 && (rodent.column/8+1)==63)iregs();
      if(rodent.btnstatus==1 && (rodent.row/8+1)==16 && (rodent.column/8+1)==44)lfunc();
      if(rodent.btnstatus==1 && (rodent.row/8+1)==16 && (rodent.column/8+1)==45)lfunc();
      if(rodent.btnstatus==1 && (rodent.row/8+1)==16 && (rodent.column/8+1)==46)lfunc();
      if(rodent.btnstatus==1 && (rodent.row/8+1)==16 && (rodent.column/8+1)==47)lfunc();
      if(rodent.btnstatus==1 && (rodent.row/8+1)==16 && (rodent.column/8+1)==48)lfunc();
      if(rodent.btnstatus==1 && (rodent.row/8+1)==16 && (rodent.column/8+1)==49)lfunc();
      if(rodent.btnstatus==1 && (rodent.row/8+1)==16 && (rodent.column/8+1)==50)lfunc();
      if(rodent.btnstatus==1 && (rodent.row/8+1)==16 && (rodent.column/8+1)==51)lfunc();
      if(rodent.btnstatus==1 && (rodent.row/8+1)==16 && (rodent.column/8+1)==52)lfunc();
      if(rodent.btnstatus==1 && (rodent.row/8+1)==16 && (rodent.column/8+1)==53)lfunc();
      if(rodent.btnstatus==1 && (rodent.row/8+1)==16 && (rodent.column/8+1)==54)lfunc();
      if(rodent.btnstatus==1 && (rodent.row/8+1)==16 && (rodent.column/8+1)==55)lfunc();
      if(rodent.btnstatus==1 && (rodent.row/8+1)==16 && (rodent.column/8+1)==56)lfunc();
      if(rodent.btnstatus==1 && (rodent.row/8+1)==16 && (rodent.column/8+1)==57)lfunc();
      if(rodent.btnstatus==1 && (rodent.row/8+1)==16 && (rodent.column/8+1)==58)lfunc();
      if(rodent.btnstatus==1 && (rodent.row/8+1)==16 && (rodent.column/8+1)==59)lfunc();
      if(rodent.btnstatus==1 && (rodent.row/8+1)==16 && (rodent.column/8+1)==60)lfunc();
      if(rodent.btnstatus==1 && (rodent.row/8+1)==16 && (rodent.column/8+1)==61)lfunc();
	}while(1);
   for(x=0;x<7;x++)ftype[x]='?';
   x=0;
   locate(4,7);
   printf("Getting Function Type");
   locate(1,3);
   inregs.h.ah=0x0C;
   int86(0x21,&inregs,&outregs);
   do
   {
      if(x==6)
      {
         puts("\n\nInput buffer full(only 6 bytes allowed).");
         getch();
      	ftype[x]=NULL;
         clrscr();
      }
      if(x!=6)ftype[x]=getch();
		switch(ftype[x])
      {
         case(ESC):
         		ms_init();
               ms_hidecrsr();
					endprog();
      	case(CR):
         		ftype[x]=NULL;
               putch(LF);
               break;
         case(BC):
               if(x==0)break;
               putch(BC);
               putch(' ');
               putch(BC);
               x--;
               break;
         case(NULL):
         		break;
			default:
         		putch(ftype[x]);
               x++;
               break;
      }
   }
   while(ftype[x]!=NULL);
   x=0;
   do
   {
   	if(x==3)break;
   }while(strcmpi(ftype,funcer[x++])!=0);
   if(strcmpi(ftype,funcer[--x])==0)database(funcer[x]); //database() gets the memory adress to funcer[x]
   else
   {
      clrscr();
   	printf("ERROR: Did not find that function type!\n");
      ms_init();
      ms_hidecrsr();
      exit(0);
   }
}
void database(char *ftype)
{
	

	if(strcmpi(ftype,"dos")==0)dos();
	if(strcmpi(ftype,"bios")==0)bios();
	if(strcmpi(ftype,"mouse")==0)mouse();
  	else
  	{
  		puts("\nUnknown Error!");
  		exit(0);
  	}
}
void dos(void)
{
	char buf[5];
   int x,xb,xu;
   char *func[8]={"01H","06H","07H","08H","0AH","0BH","0CH","33H"};

   locate(4,7);
   for(x=0;x<80;x++)putch(' ');
   locate(4,7);
   printf("Getting Function");
	locate(1,1);
   for(x=0;x<80;x++)putch(' ');
   locate(1,2);
   for(x=0;x<80;x++)putch(' ');
	locate(1,3);
   for(x=0;x<80;x++)putch(' ');
   locate(1,2);
	puts("Enter the dos function you want to view(feks. 07H):");
   locate(1,3);

   for(x=0;x<5;x++)buf[x]='?';
   x=0;
   do
   {
      if(x==4)
      {
         puts("\n\nInput buffer full(only 4 bytes allowed).");
         getch();
      	buf[x]=NULL;
         locate(1,4);
         for(xu=0;xu<80;xu++)putch('_');
      }
      if(x!=4)buf[x]=getch();
		switch(buf[x])
      {
         case(ESC):
               ms_init();
               ms_hidecrsr();
					endprog();
      	case(CR):
         		buf[x]=NULL;
               putch(LF);
               break;
         case(BC):
               if(x==0)break;
               putch(BC);
               putch(' ');
               putch(BC);
               x--;
               break;
         case(NULL):
         		break;
			default:
         		putch(buf[x]);
               x++;
               break;
      }
   }
   while(buf[x]!=NULL);
   x=0;
   do
   {
   	if(x==8)break;
   }while(strcmpi(buf,func[x++])!=0);
   if(strcmpi(buf,func[--x])==0)
   {
   	if(x==0)
      {
         clrscr();
      	puts("INT 21H FUNCTION 01H");
         puts("Character input with echo");
         for(xb=0;xb<80;xb++)putch('-');
         puts("Action:		Reads a character from stdin and echoes it to stdout; responds");
         puts("		to Ctrl-C and Ctrl-Break; waits until a character is available\n");
         puts("Call with:	AH = 01H");
         puts("Returns:	AL = ASCII character code");
         for(xb=0;xb<80;xb++)putch('-');
         puts("NOTES:");
         puts("If stdin is not redirected, this service responds to the Ctrl-C or Ctrl-Break");
         puts("key combination by issuing Int 23H. If stdin is redirected, it responds to");
         puts("Ctrl-C or Ctrl-Break by issuing Int 23H only if the break flag is set to 1.");
         waitclick(EITHER);
         mainer();
      }
      if(x==1)
      {
         clrscr();
      	puts("INT 21H FUNCTION 06H");
         puts("Direct I/O without echo");
         for(xb=0;xb<80;xb++)putch('-');
         puts("Action:		Reads a character from stdin; does not filter input,");
         puts("	        allowing input of all possible characters and control codes;");
         puts("		ignores Ctrl-C and Ctrl-Break; does not wait if no character");
         puts("		is available\n");
         puts("Call with:	AH = 06H");
         puts("		DL = FFH");
         puts("Returns:");
         puts("		If a character is available:");
         puts("			Zero flag = 0");
         puts("			AL = ASCII character code");
         puts("		If no character is available:");
         puts("			Zero Flag = 1");
         waitclick(EITHER);
         for(xb=0;xb<80;xb++)putch('-');
         puts("NOTES:");
         puts("Use this service when your program needs to have access to all possible");
         puts("keystrokes without interference from MS-DOS. This service is the same as");
         puts("Int 21H Function 07H except that it does not wait for a character if one is not");
         puts("immediately available.\n");
         puts("You cannot use this service in C because the REGS union does not provide");
         puts("access to zero flag.\n");
         puts("In addition to performing character input, this service can also perform");
         puts("character output.");
         waitclick(EITHER);
         mainer();
      }
      if(x==2)
      {
         clrscr();
   		puts("INT 21H FUNCTION 07H");
         puts("Direct character input without echo");
         for(xb=0;xb<80;xb++)putch('-');
         puts("Action:		Reads a character from stdin; does not filter input,");
         puts("	        allowing input of all possible characters and control codes;");
         puts("		ignores Ctrl-C and Ctrl-Break; waits until a character");
         puts("		is available\n");
         puts("Call with:	AH = 07H");
         puts("Returns:	AL = ASCII character code");
         for(xb=0;xb<80;xb++)putch('-');
         puts("NOTES:");
      	puts("Use this service when your program needs to have access to all possible");
         puts("keystrokes without interference from MS-DOS. This service is the same as");
         puts("Int 21H Function 06H except that it does wait for a character if one is not");
         puts("immediately available.\n");
         waitclick(EITHER);
         mainer();
      }
      if(x==3)
      {
         clrscr();
      	puts("INT 21H FUNCTION 08H");
         puts("Character input without echo");
         for(xb=0;xb<80;xb++)putch('-');
         puts("Action:		Reads a character from stdin; responds");
         puts("		to Ctrl-C and Ctrl-Break; waits until a character is available\n");
         puts("Call with:	AH = 08H");
         puts("Returns:	AL = ASCII character code");
         for(xb=0;xb<80;xb++)putch('-');
         puts("NOTES:");
         puts("If stdin is not redirected, this service responds to the Ctrl-C or Ctrl-Break");
         puts("key combination by issuing Int 23H. If stdin is redirected, it responds to");
         puts("Ctrl-C or Ctrl-Break by issuing Int 23H only if the break flag is set to 1.");
         puts("It does not echo input.");
         waitclick(EITHER);
         mainer();
      }
      if(x==4)
      {
         clrscr();
      	puts("INT 21H FUNCTION 0AH");
         puts("Read line from stdin");
         for(xb=0;xb<80;xb++)putch('-');
         puts("Action:		Reads a line of input from standard input-up to and including a");
         puts("		carriage return-and places it in a user-designated buffer.");
         puts("Call with:	AH = 0AH");
         puts("		DS = segment of buffer");
         puts("		DX = offset of buffer");
         puts("Returns:		Nothing");
         for(xb=0;xb<80;xb++)putch('-');
         puts("NOTES:");
         puts("The first byte of the user-designated buffer must contain a value n in the");
         puts("range 1 through 255 that specifies the maximum number of characters to");
         puts("be read. If n-1 characters are input, subsequent characters are ignored un-");
         puts("til the user enters a carriage return.\n");
         puts("Upon return from this service, the second byte of the user-designated buffer");
         puts("contains the number of characters actually read(excluding the carriage");
         puts("return). Actual data begins at position 3 in the buffer.");
         puts("If stdin is not redirected, this service responds to the Ctrl-C or Ctrl-Break");
         puts("key combination by issuing Int 23H. If stdin is redirected, it responds to");
         puts("Ctrl-C or Ctrl-Break by issuing Int 23H only if the break flag is set to 1.");
         waitclick(EITHER);
         mainer();
      }
      if(x==5)
      {
      	clrscr();
   		puts("INT 21H FUNCTION 0BH");
         puts("Check input status");
         for(xb=0;xb<80;xb++)putch('-');
         puts("Action:		Determines whether a character is available from standard input");
         puts("	        device.");
         puts("Call with:	AH = 0BH");
         puts("Returns:	AL = 00H if no character is available");
         puts("		   = FFH if at least one character is available");
         for(xb=0;xb<80;xb++)putch('-');
         puts("NOTES:");
      	puts("This service is sensitive to input redirection.");
         puts("If a character is available when this service is called, the character is not");
         puts("read. The character remains available in the buffer for reading by Int 21H");
         puts("Function 08H or by any other character input service.");
         puts("If standard input is not redirected, this service responds to the Ctrl-C");
         puts("or Ctrl-Break by issuing Int 23H only if the break flag is set to 1.");
         waitclick(EITHER);
         mainer();
      }
      if(x==6)
      {
      	clrscr();
   		puts("INT 21H FUNCTION 0CH");
         puts("Flush the Input Buffer");
         for(xb=0;xb<80;xb++)putch('-');
         puts("Action:		Clears the input buffer");
         puts("Call with:	AH = 0CH");
         puts("			AL = Number of input service to call(if desired)");
         puts("Returns:	AL = ASCII character code");
         for(xb=0;xb<80;xb++)putch('-');
         puts("NOTES:");
      	puts("This service is sensirive to redirection. Its response to Ctrl-C and");
         puts("Ctrl-Break depends on the input service specified. If a nonvalid input");
         puts("service number is passed in AL, the service simply flushes the inout buffer");
         puts("and returns to the calling program.");
         waitclick(EITHER);
         mainer();
      }
      if(x==7)
      {
      	clrscr();
   		puts("INT 21H FUNCTION 33H");
         puts("Queries or modifies the MS-DOS breakflag");
         for(xb=0;xb<80;xb++)putch('-');
         puts("Action:		Queries or modifies the state of the MS-DOS break flag");
         puts("Call with:	To query break flag:");
         puts("			AH = 33H");
         puts("			AL = 00H");
         puts("				To set break flag:");
         puts("			AH = 33H");
         puts("			AL = 01H");
         puts("			DL = 00H to turn break flag off");
         puts("				= 01H to turn break flag on");
         puts("Returns:	DL = 00H if break flag is off");
         puts("				= 01H if break flag is on");
         for(xb=0;xb<80;xb++)putch('-');
         puts("NOTES:");
      	puts("The break flag status affects all programs, and if your program changes the");
         puts("break flag's setting, that setting remains in effect even after your program");
         puts("terminates. For this reason, you should save the break flag's status before");
         puts("changing it and then restore the original break flag setting before terminating");
         puts("your program.");
         waitclick(EITHER);
         mainer();
      }
   }
   else
   {
      locate(1,3);
   	puts("ERROR! Did not find that function!");
      getch();
   }
dos();
}
void bios(void)
{
   char buf[5];
   int x,xb,xu;
   char *func[5]={"00H","02H","03H","05H","12H"};

   locate(4,7);
   for(x=0;x<80;x++)putch(' ');
   locate(4,7);
   printf("Getting Function");
	locate(1,1);
   for(x=0;x<80;x++)putch(' ');
   locate(1,2);
   for(x=0;x<80;x++)putch(' ');
	locate(1,3);
   for(x=0;x<80;x++)putch(' ');
   locate(1,2);
	puts("Enter the bios function you want to view(feks. 02H):");
   locate(1,3);

   for(x=0;x<5;x++)buf[x]='?';
   x=0;
   do
   {
      if(x==4)
      {
         puts("\nInput buffer full(only 4 bytes allowed).");
         getch();
      	buf[x]=NULL;
         locate(1,4);
         for(xu=0;xu<80;xu++)putch('_');
      }
      if(x!=4)buf[x]=getch();
		switch(buf[x])
      {
         case(ESC):
               ms_init();
               ms_hidecrsr();
					endprog();
      	case(CR):
         		buf[x]=NULL;
               putch(LF);
               break;
         case(BC):
               if(x==0)break;
               putch(BC);
               putch(' ');
               putch(BC);
               x--;
               break;
         case(NULL):
         		break;
			default:
         		putch(buf[x]);
               x++;
               break;
      }
   }
   while(buf[x]!=NULL);
   x=0;
   do
   {
   	if(x==5)break;
   }while(strcmpi(buf,func[x++])!=0);
   if(strcmpi(buf,func[--x])==0)
   {
   	if(x==0)
      {
      	clrscr();
      	puts("\nINT 16H  FUNCTION 00H");
         puts("Read Character From Keyboard\n");
         for(xb=0;xb<80;xb++)putch('-');
         puts("Action:		Reads a character and its scan code from keyboard");
			puts("Call With:	AH = 00H");
         puts("Returns:	AH = keyboard scan code");
         puts("		AL = ASCII character code");
         for(xb=0;xb<80;xb++)putch('-');
         puts("NOTES:");
         puts("This service waits for a character if none are in the keyboard buffer. It does");
         puts("not respond to Ctrl-C or Ctrl-Break and is not sensitive to input redirection.");
         waitclick(EITHER);
         mainer();
      }
      if(x==1)
      {
         clrscr();
      	puts("\nINT 16H  FUNCTION 02H");
         puts("Read Keyboard Flags\n");
         for(xb=0;xb<80;xb++)putch('-');
         puts("Action:		Returns the status of the keyboard flags");
			puts("Call With:	AH = 02H");
         puts("Returns:	AL = the keyboard flags\n");
         puts("Each bit in the flags byte corresponds to one of the Ctrl, Shift, Alt, or");
         puts("\"lock\" keys. A bit value of 1 means the key is pressed and turned on.\n");
         puts("	Bit Number         Corresponding key");
         puts(" 	   0   			Right Shift");
         puts(" 	   1	 		Left Shift");
         puts(" 	   2			Ctrl");
         puts(" 	   3			Alt");
         puts("	   4			Scroll Lock");
         puts(" 	   5			Num Lock");
         puts("	   6			Caps Lock");
         puts("	   7			Insert");
         for(xb=0;xb<80;xb++)putch('-');
         puts("NOTES:");
         puts("This service enables your program to distinguish between the right and left");
         puts("Shift keys.");
         waitclick(EITHER);
         mainer();
      }
      if(x==2)
      {
         clrscr();
      	puts("\nINT 16H  FUNCTION 03H");
         puts("Set Keyboard Repeat\n");
         for(xb=0;xb<80;xb++)putch('-');
         puts("Action:		Sets the rate and delay time for the keyboard repeat");
			puts("Call With:	AH = 03H");
         puts("		AL = 05H");
         puts("		BH = delay time\(see \"NOTES\"\)");
         puts("		BL = repeat rate\(see \"NOTES\"\) ");
         puts("Returns:	Nothing");
         for(xb=0;xb<80;xb++)putch('-');
         puts("NOTES:");
         puts("The delay time is the amount of time a key must be pressed before it begins");
         puts("to repeat. Specify one of the four available delay values by placing one of the");
         puts("following values in the BH register:\n");
         puts("	BH		Delay (milliseconds)");
         puts("	00H		250");
         puts("	01H		500");
         puts("	02H		750");
         puts("	03H	  	1000");
         puts("Specify the repeat rate by placing a value in the BL register. The follow-");
         puts("ing values area available:\n");
         waitclick(EITHER);
         puts("			Repeat rate");
         puts("BL		(character per second)");
         puts("00H		  30.0");
         puts("01H		  26.7");
         puts("02H		  24.0");
         puts("03H		  21.8");
         puts("04H		  20.0");
         puts("05H		  18.5");
         puts("06H		  17.1");
         puts("07H		  16.0");
         puts("08H		  15.0");
         puts("09H		  13.3");
         puts("0AH		  12.0");
         puts("0BH		  10.9");
         puts("0CH		  10.0");
         puts("0DH		  9.2");
         puts("0EH		  8.6");
         puts("0FH		  8.0");
         waitclick(EITHER);
         puts("10H		  7.5");
         puts("11H		  6.7");
         puts("12H		  6.0");
         puts("13H		  5.5");
         puts("14H		  5.0");
         puts("15H		  4.6");
         puts("16H		  4.3");
         puts("17H		  4.0");
         puts("18H		  3.7");
         puts("19H		  3.3");
         puts("1AH		  3.0");
         puts("1BH		  2.7");
         puts("1CH		  2.5");
         puts("1DH		  2.3");
         puts("1EH		  2.1");
         puts("1FH		  2.0");
         waitclick(EITHER);
         mainer();
      }
      if(x==3)
      {
         clrscr();
      	puts("\nINT 16H  FUNCTION 05H");
         puts("Place Character & Scan Code\n");
         for(xb=0;xb<80;xb++)putch('-');
         puts("Action:		Place a character and a scan code in the keyboard buffer");
			puts("Call With:	AH = 05H");
         puts("		CH = keyboard scan code");
         puts("		CL = ASCII character code");
         puts("Returns:");
         puts("		On Success:");
         puts("	 AL	    = 00H");
         puts("	 Carry Flag = 0\n");
         puts("On failure(buffer full):");
         puts("	 AL 	    = 01H");
         puts("	 Carry Flag = 1");
         for(xb=0;xb<80;xb++)putch('-');
         puts("NOTES:");
         puts("The character and scan code combination that this service puts in the key-");
         puts("board buffer is placed behind any other characters that are already waiting");
         puts("in the buffer.");
         waitclick(EITHER);
         mainer();
      }
      if(x==4)
      {
         clrscr();
      	puts("\nINT 16H  FUNCTION 12H");
         puts("Read Keyboard Flags\n");
         for(xb=0;xb<80;xb++)putch('-');
         puts("Action:		Returns the status of the enhanced keyboard flags");
			puts("Call With:	AH = 12H");
         puts("Returns:	AX = the keyboard flags\n");
         puts("Each bit in the flag word(2 bytes) corresponds to one of the Ctrl, Shift, Alt,");
         puts("or \"lock\" keys. A bit value of 1 means the key is pressed or turned on\n");
         waitclick(EITHER);
         puts("	Bit Number         Corresponding key");
         puts(" 	   0   			Right Shift");
         puts(" 	   1	 		Left Shift");
         puts(" 	   2			Ctrl");
         puts(" 	   3			Alt");
         puts("	   4			Scroll Lock");
         puts(" 	   5			Num Lock");
         puts("	   6			Caps Lock");
         puts("	   7			Insert");
         puts("	   8			Left Ctrl");
         puts("	   9			Left Alt");
         puts("	  10			Right Ctrl");
         puts("	  11			Right Alt");
         puts("	  12			Scroll Lock pressed");
         puts("     	  13		 	Num Lock pressed");
         puts("	  14			Caps Lock pressed");
         puts("	  15			SysRq pressed");
         for(xb=0;xb<80;xb++)putch('-');
         puts("NOTES:");
         puts("This service can distinguish between the left and right Shift, CTRL, and Alt");
         puts("keys. In addition to checking whether the Scroll Lock, Num Lock, and Caps");
         puts("Lock keys are turned on or off, this service can check whether any of these");
         puts("keys are currently being pressed.");
         waitclick(EITHER);
         mainer();
      }
   }
   else
   {
      locate(1,3);
   	puts("ERROR! Did not find that function!");
      getch();
   }
bios();
}
void mouse(void)
{
	char buf[5];
   int x,xb,xu;
   char *func[28]={"00H","01H","02H","03H","04H","05H","06H","07H","08H","09H","0AH","0BH","0CH","0DH","0EH","0FH","10H","13H","15H","16H","17H","1AH","1BH","1CH","1DH","1EH","21H","2AH"};

   locate(4,7);
   for(x=0;x<80;x++)putch(' ');
   locate(4,7);
   printf("Getting Function");
	locate(1,1);
   for(x=0;x<80;x++)putch(' ');
   locate(1,2);
   for(x=0;x<80;x++)putch(' ');
	locate(1,3);
   for(x=0;x<80;x++)putch(' ');
   locate(1,2);
	puts("Enter the mouse function you want to view(feks. 02H):");
   locate(1,3);

   for(x=0;x<5;x++)buf[x]='?';
   x=0;
   do
   {
      if(x==4)
      {
         puts("\nInput buffer full(only 4 bytes allowed).");
         getch();
      	buf[x]=NULL;
         locate(1,4);
         for(xu=0;xu<80;xu++)putch('_');
      }
      if(x!=4)buf[x]=getch();
		switch(buf[x])
      {
         case(ESC):
               ms_init();
               ms_hidecrsr();
					endprog();
      	case(CR):
         		buf[x]=NULL;
               putch(LF);
               break;
         case(BC):
               if(x==0)break;
               putch(BC);
               putch(' ');
               putch(BC);
               x--;
               break;
         case(NULL):
         		break;
			default:
         		putch(buf[x]);
               x++;
               break;
      }
   }
   while(buf[x]!=NULL);
   x=0;
   do
   {
   	if(x==28)break;
   }while(strcmpi(buf,func[x++])!=0);
   if(strcmpi(buf,func[--x])==0)
   {
   	if(x==0)
      {
         clrscr();
         locate(1,1);
      	cout << "INT 33H Function 00H\n"
              << "Reset mouse and get status\n";
         for(xb=0;xb<80;xb++)putch('-');
         cout << "\nAction:	Determines whether a mouse is available and, if it is, initializes\n	the mouse driver\n"
              << "Call With:	AX = 0000H\n"
              << "Returns:\n    If a mouse is installed:\n"
              << "		AX = nonzero\n"
              << "		BX = number of mouse buttons\n\n"
              << "		If a mouse is not installed:\n"
              << "		AX = 0000H\n";
         for(xb=0;xb<80;xb++)putch('-');
         waitclick(EITHER);
         cout << "\nNOTES:\n"
              << "The following list shows how a call to this service initializes the mouse\n"
              << "driver. The reference in parantheses following each item specify the Int\n"
              << "33H service or services that control the specific item.\n\n"
              << "-	Mouse cursor hidden(services 01H, 02H, 10H, and 2AH)\n\n"
              << "-	Mouse cursor located at screen center(services 03H and 04H)\n\n"
              << "-	Mouse cursor located on display page 0(services 1DH and 1EH)\n\n"
              << "-	Mouse cursor shape set to reverse block(text mode)or default arrow\n   	(graphics mode)(services 09H and 0AH)\n\n"
              << "-	User-Installed mouse event handler(if any)disabled (services 0CH\n"
              << "	and 14H)\n\n"
              << "-	Light-pen emulation enabled (services 0DH and 0EH)\n\n"
              << "-	Mickeys-to-pixel ratio set to 8:8 horizontal and 16:8 vertical (ser-\n"
              << "   	vice 0FH\n\n"
              << "-	Double-speed threshold set to 64 mickeys per second(services 13H)\n\n"
              << "-	Cursor position limits set to entire screen(services 07H and 08H)";
         waitclick(EITHER);
         mainer();
      }
      if(x==1)
      {
         clrscr();
         locate(1,1);
      	cout << "INT 33H Function 01H\n"
              << "Show mouse cursor\n";
         for(xb=0;xb<80;xb++)putch('-');
         cout << "Action:	Display the mouse cursor on screen\n"
              << "Call With:	AX = 0001H\n"
              << "Returns:	Nothing.\n";
         for(xb=0;xb<80;xb++)putch('-');
         cout << "\nNOTES:\n"
              << "Calling this service cancels any cursor exclusion area previously set using\n"
              << "Int 33H Function 10H.\n\n"
              << "The mouse driver maintains a counter whose value determines whether the\n"
              << "mouse cursor is displayed. If the counter has a value of 0, the cursor is\n"
              << "displayed; if the counter has a value less than 0, the cursor is hidden.\n"
              << "Calls to this service increment the counter by 1 if it has a value less\n"
              << "than 0 and have no effect on the counter if it has a value of 0. Calls\n"
              << "to Int 33H Function 02H(which hides the mouse cursor)always decrement\n"
              << "the counter by 1. If a program makes two consecutive calls to Int 33H\n"
              << "Function 02H, the counter has a value of -2. It then takes two calls\n"
              << "to Int 33H Function 01H to increment the counter to 0 and to display the\n"
              << "cursor. A program can read the value of the counter by calling Int 33H\n"
              << "Function 2AH, which is available in versions 7.02 and later of the\n"
              << "Microsoft Mouse Driver.";
         waitclick(EITHER);
         mainer();
      }
      if(x==2)
      {
         clrscr();
         locate(1,1);
      	cout << "INT 33H Function 02H\n"
              << "Hide mouse cursor\n";
         for(xb=0;xb<80;xb++)putch('-');
         cout << "Action:	Removes the cursor from the screen.\n"
              << "Call With:	AX = 0002H\n"
              << "Returns:	Nothing.\n";
         for(xb=0;xb<80;xb++)putch('-');
         cout << "\nNOTES:\n"
              << "Even if the mouse cursor is hidden, the mouse driver tracks its\n"
              << "position. This service decrements the counter whose value determines\n"
              << "whether the mouse cursor is displayed. See \"Notes\" for Int 33H\n"
              << "Function 01H.";
         waitclick(EITHER);
         mainer();
      }
      if(x==3)
      {
         clrscr();
         locate(1,1);
      	cout << "INT 33H Function 03H\n"
              << "Get mouse cursor position and button status\n";
         for(xb=0;xb<80;xb++)putch('-');
         cout << "Action:	Returns the current mouse cursor position and button status\n"
              << "Call With:	AX = 0003H\n"
              << "Returns:	BX = button status; a bit with a value of 1 indicates that\n"
              << "	the corresponding button is down:\n"
              << "		Bit 0		= left button\n"
              << "		Bit 1		= right button\n"
              << "		Bit 2		= center button\n"
              << "		Bits 3-15 reserved\n"
              << "CX = horizontal(x) coordinate in pixels\n"
              << "DX = vertical(y) coordinate in pixels\n";
         for(xb=0;xb<80;xb++)putch('-');
         cout << "\nNOTES:\n"
              << "The position is returned in virtual screen pixels in all display modes.\n"
              << "The upper left corner of the screen is position(0,0), and the lower right\n"
              << "corner of the screen is most often position (639,199). See figure 6-2 in\n"
              << "Chapter 6 of MS-DOS 5 Programming by Peter G. Aitken for details on\n"
              << "virtual pixel coordinates for various graphics modes.";
         waitclick(EITHER);
         mainer();
      }
      if(x==4)
      {
         clrscr();
         locate(1,1);
      	cout << "INT 33H Function 04H\n"
              << "Set mouse cursor position\n";
         for(xb=0;xb<80;xb++)putch('-');
         cout << "Action:	Moves mouse cursor to specified screen position\n"
              << "Call With:	AX = 0004H\n"
              << "		CX = horizontal coordinate\n"
              << "		DX = vertical coordinate\n"
              << "Returns:	Nothing\n";
         for(xb=0;xb<80;xb++)putch('-');
         cout << "\nNOTES:\n"
              << "The coordinates are specified in virtual screen pixels; the horizontal\n"
              << "coordinate range is most often 0 through 639, and the vertical coordinate\n"
              << "range is most often 0 through 199. See figure 6-2 in chapter 6 of\n"
              << "MS-DOS 5 programming by Peter G. Aitken for\n"
              << "details on virtual pixel coordinates for various graphic modes.\n\n"
              << "If the specified new cursor position is outside the limits that were defined\n"
              << "with Int 33H Functions 07H and 08H, the cursor is positioned as close to the"
              << "new position as possible within the limits.";
         waitclick(EITHER);
         mainer();
      }
      if(x==5)
      {
      	clrscr();
         locate(1,1);
      	cout << "INT 33H Function 05H\n"
              << "Get Button Press Information\n";
         for(xb=0;xb<80;xb++)putch('-');
         cout << "Action:	Reports on the status and number of presses for a specified button\n"
              << "and on the mouse position when the button was last pressed.\n\n"
              << "Call With:	AX = 0005H\n"
              << "		BX = Button Query:\n"
              << "		0 = left, 1 = right, 2 = center\n\n"
              << "Returns:	AX = button status;a bit with a value of 1 indicates that the\n"
              << "		corresponding button is down:\n"
              << "		Bit 0	= left button\n"
              << "		Bit 1	= right button\n"
              << "		Bit 2	= center button\n"
              << "		Bit 3-15	reserved\n\n"
              << "BX = button press counter\n"
              << "CX = horizontal(x) coordinate, in pixels, of last button press\n"
              << "DX = vertical(y) coordinate, in pixels, of last button press\n";
              waitclick(EITHER);
         for(xb=0;xb<80;xb++)putch('-');
         cout << "\nNOTES:\n"
              << "After the service returns, AX contains the current state of all mouse but-\n"
              << "tons. BX contains the number of times the user pressed the specified button\n"
              << "since the last time the program called this service for that button (or since\n"
              << "the mouse driver was initialized or reset).\n"
              << "If the specified button is down, CX and DX contain the current mouse cur-\n"
              << "sor position. If the specified button is not down, CX and DX report the cur-\n"
              << "sor's position the last time the user pressed the specified button.\n"
              << "Int 33H Function 06H works in the same way as does this service except\n"
              << "that it returns information about the button releases.";
         waitclick(EITHER);
         mainer();
      }
      if(x==6)
      {
      	clrscr();
         locate(1,1);
      	cout << "INT 33H Function 06H\n"
              << "Get Button Release Information\n";
         for(xb=0;xb<80;xb++)putch('-');
         cout << "Action:	Reports on the status and number of releases for a specified button\n"
              << "and on the mouse position when the button was last pressed.\n\n"
              << "Call With:	AX = 0006H\n"
              << "		BX = Button Query:\n"
              << "		0 = left, 1 = right, 2 = center\n\n"
              << "Returns:	AX = button status;a bit with a value of 1 indicates that the\n"
              << "		corresponding button is down:\n"
              << "		Bit 0	= left button\n"
              << "		Bit 1	= right button\n"
              << "		Bit 2	= center button\n"
              << "		Bit 3-15	reserved\n\n"
              << "BX = button release counter\n"
              << "CX = horizontal(x) coordinate, in pixels, of last button release\n"
              << "DX = vertical(y) coordinate, in pixels, of last button release\n";
              waitclick(EITHER);
         for(xb=0;xb<80;xb++)putch('-');
         cout << "\nNOTES:\n"
              << "After the service returns, AX contains the current state of all mouse but-\n"
              << "tons. BX contains the number of times the user released the specified button\n"
              << "since the last time the program called this service for that button (or since\n"
              << "the mouse driver was initialized or reset).\n"
              << "If the specified button is down, CX and DX contain the current mouse cur-\n"
              << "sor position. If the specified button is not down, CX and DX report the cur-\n"
              << "sor's position the last time the user released the specified button.\n"
              << "Int 33H Function 06H works in the same way as does this service except\n"
              << "that it returns information about the button releases.";
         waitclick(EITHER);
         mainer();
      }
      if(x==7)
      {
      	clrscr();
         locate(1,1);
      	cout << "INT 33H Function 07H\n"
              << "Set horizontal limits for the mouse cursor\n";
         for(xb=0;xb<80;xb++)putch('-');
         cout << "Action:	Sets left and right horizontal limits for mouse cursor movement\n\n"
              << "Call With:	AX = 0007H\n"
              << "		CX = minimum(left) horizontal coordinate in pixels\n"
              << "		DX = maximum(righ) horizontal coordinate in pixels\n\n"
              << "Returns:	Nothing\n";
         for(xb=0;xb<80;xb++)putch('-');
         cout << "\nNOTES:\n"
              << "If the value in CX is greater than the value in DX, this service swaps the\n"
              << "two values. After you set horizontal limits using this service, you cannot\n"
              << "use the mouse or Int 33H Function 04H to move the mouse cursor beyond the\n"
              << "limits. If the mouse cursor lies outside the specified area when this service\n"
              << "is called, the mouse cursor is moved inside the area. Your program must pass\n"
              << "pixel coordinates, multiply by 8. For examle, to restrict horizontal movement\n"
              << "to the area between column 4 and column 40, you would call this service with\n"
              << "32(4*8) in the CX register and 320(40*8) in the DX register.";
         waitclick(EITHER);
         mainer();
      }
      if(x==8)
      {
      	clrscr();
         locate(1,1);
      	cout << "INT 33H Function 08H\n"
              << "Set vertical limits for the mouse cursor\n";
         for(xb=0;xb<80;xb++)putch('-');
         cout << "Action:	Sets upper and lower vertical limits for mouse cursor movement\n\n"
              << "Call With:	AX = 0008H\n"
              << "		CX = minimum(upper) horizontal coordinate in pixels\n"
              << "		DX = maximum(lower) horizontal coordinate in pixels\n\n"
              << "Returns:	Nothing\n";
         for(xb=0;xb<80;xb++)putch('-');
         cout << "\nNOTES:\n"
              << "If the value in CX is greater than the value in DX, this service swaps the\n"
              << "two values. After you set horizontal limits using this service, you cannot\n"
              << "use the mouse or Int 33H Function 04H to move the mouse cursor beyond the\n"
              << "limits. If the mouse cursor lies outside the specified area when this service\n"
              << "is called, the mouse cursor is moved inside the area. Your program must pass\n"
              << "pixel coordinates, multiply by 8. For examle, to restrict horizontal movement\n"
              << "to the area between row 5 and row 10, you would call this service with\n"
              << "40(5*8) in the CX register and 80(10*8) in the DX register.";
         waitclick(EITHER);
         mainer();
      }
      if(x==9)
      {
      	clrscr();
         locate(1,1);
      	cout << "INT 33H Function 09H\n"
              << "Set graphics mode cursor shape\n";
         for(xb=0;xb<80;xb++)putch('-');
         cout << "Action:	Defines the shape, color, and hot spot of the graphics mode cursor\n\n"
              << "Call With:	AX = 0009H\n"
              << "		BX = horizontal hot spot offset\n"
              << "		CX = vertical hot spot offset\n"
              << "		ES = Segment of buffer containing the buffer masks\n"
              << "		DX = offset of cursor buffer containing the cursor masks\n\n"
              << "Returns:	Nothing\n";
              waitclick(EITHER);
         for(xb=0;xb<80;xb++)putch('-');
         cout << "\nNOTES:\n"
              << "The graphics mode cusor image is a 16-by-16-pixel area on the screen that\n"
              << "is defined by a 64-byte buffer passed to this service. The bits in the screen\n"
              << "mask, which is contained in the first 32 bytes of the buffer, are first com-\n"
              << "bined with the existing screen image by using logical AND operations. The\n"
              << "bits in the cursor mask, which is contained in the second 32 bytes, are then\n"
              << "combined with the resulting values by using XOR operations to get the final\n"
              << "display image. The hot spot of the cursor is relative to the upper left corner\n"
              << "of the cursor image. In display modes 4 and 5, the value of the horizontal\n"
              << "offset must be even. Most often the horizontal and vertical values of the hot\n"
              << "spot range from 0 through 15. Use Int 33H Function 2AH to read the current\n"
              << "hot spot.";
         waitclick(EITHER);
         mainer();
      }
      if(x==10)
      {
      	clrscr();
         locate(1,1);
      	cout << "INT 33H Function 0AH\n"
              << "Set text mode cursor shape\n";
         for(xb=0;xb<80;xb++)putch('-');
         cout << "Action:	Defines the shape and attributes of the text mode cursor\n\n"
              << "Call With:	AX = 000AH\n"
              << "		BX = Cursor Type(0=software,1=hardware)\n"
              << "		if BX = 0\n"
              << "		CX = Screen mask value\n"
              << "		DX = Cursor mask value\n"
              << "		if BX = 1\n"
              << "		CX = Starting scan line for cursor\n"
              << "		DX = Ending scan line for cursor\n\n"
              << "Returns:	Nothing\n";
         for(xb=0;xb<80;xb++)putch('-');
         cout << "\nNOTES:\n"
              << "See the section \"Mouse cursor appearance\" early in chapter 6 of\n"
              << "MS-DOS 5 programming by Peter G. Aitken for information about setting the\n"
              << "mouse cursor appearance in text mode.\n";
         waitclick(EITHER);
         mainer();
      }
      if(x==11)
      {
      	clrscr();
         locate(1,1);
      	cout << "INT 33H Function 0BH\n"
              << "Read mouse motion counters\n";
         for(xb=0;xb<80;xb++)putch('-');
         cout << "Action:	Returns the mouse movement that occured since the last call to\n"
              << "			this service ot since the mouse was initialized\n\n"
              << "Call With:	AX = 000BH\n"
              << "Returns:	CX = horizontal mouse movement\n"
              << "		DX = vertical mouse movement\n\n";
         for(xb=0;xb<80;xb++)putch('-');
         cout << "\nNOTES:\n"
              << "Movement is measured in mickeys, with one mickey equal to aproxi-\n"
              << "mately 1/200 inch. Positive mickey values represent movement down or to\n"
              << "the right; negative mickey values represent movement up or to the left.\n"
              << "These values reflect actual mouse movement, not mouse cursor movement.";
         waitclick(EITHER);
         mainer();
      }
      if(x==12)
      {
      	clrscr();
         locate(1,1);
      	cout << "INT 33H Function 0CH\n"
              << "Set user-defined mouse event handler\n";
         for(xb=0;xb<80;xb++)putch('-');
         cout << "Action:	Specifies the mouse event that the program should trap and\n"
              << "		the offset and adress of the code that the mouse driver\n"
              << "		will execute when the specified event occurs.\n\n"
              << "Call With:	AX = 000CH\n"
              << "				CX = event mask:\n"
              << "Bit(s)	Meaning(if set)\n"
              << " 0				Mouse cursor movement\n"
              << " 1				Left button pressed\n"
              << " 2				Left button released\n"
              << " 3				Right button pressed\n"
              << " 4				Right button released\n"
              << " 5				Center button pressed\n"
              << " 6				Center button released\n"
              << " 7-15				Reserved(must be 0)\n\n"
              << "	ES = segment of mouse event handler code\n"
              << "	DX = offset of mouse event handler code\n\n"
				  << "Returns:	Nothing\n";
         for(xb=0;xb<80;xb++)putch('-');
         waitclick(EITHER);
         cout << "\nNOTES:\n"
              << "This service sets up an event handler that the mouse driver calls when and\n"
              << "if the mouse driver detects the mouse event specified by the event mask.\n"
              << "When the handler begins executing, the following information is in the\n"
				  << "CPU registers:\n\n"
              << "	AX = mouse event flags(that is, the event mask)\n"
              << "	BX = current button state:\n\n"
              << "	Bit(s)	  Meaning(if set)\n"
              << "	 0		Left button down\n"
              << "	 1		Right button down\n"
              << "	 2		Center button down\n"
              << "	 3-15		Reserved\n\n"
              << "	CX = horizontal cursor pixel position\n"
              << "	DX = vertical cursor pixel position\n"
              << "	SI = current vertical mickey count\n"
              << "	DI = current horizontal mickey count\n"
              << "	DS = data segment of mouse driver\n\n"
              << "To disable calls to the handler, either call this service with an event\n"
              << "mask of 0 or call Int 33H Function 00H.\n"
              << "The event handler code must be called with a far call terminated with\n"
              << "a far return.";
         waitclick(EITHER);
         mainer();
      }
      if(x==13)
      {
      	clrscr();
         locate(1,1);
      	cout << "INT 33H Function 0DH\n"
              << "Enable light pen emulation\n";
         for(xb=0;xb<80;xb++)putch('-');
         cout << "Action:	Enables light pen emulation by the mouse\n"
              << "Call With:	AX = 000DH\n"
              << "Returns:	Nothing\n";
         for(xb=0;xb<80;xb++)putch('-');
         cout << "\nNOTES:\n"
              << "When light-pen emulation is on, a program that is looking for light-pen\n"
              << "input interprets the mouse's position as the light pen's position. When\n"
              << "both mouse buttons are pressed, the program interprets the situation as\n"
              << "\"pen down\".";
         waitclick(EITHER);
         mainer();
      }
      if(x==14)
      {
      	clrscr();
         locate(1,1);
      	cout << "INT 33H Function 0EH\n"
              << "Disable light-pen ewmulation\n";
         for(xb=0;xb<80;xb++)putch('-');
         cout << "Action:	Disables light pen emulation by the mouse\n"
              << "Call With:	AX = 000EH\n"
              << "Returns:	Nothing\n";
         for(xb=0;xb<80;xb++)putch('-');                           
         cout << "\nNOTES:\n"
              << "See Int 33H Function 0DH for information.";
         waitclick(EITHER);
         mainer();
      }
      if(x==15)
      {
      	clrscr();
         locate(1,1);
      	cout << "INT 33H Function 0FH\n"
              << "Sets mickeys-to-pixels ratio\n";
         for(xb=0;xb<80;xb++)putch('-');
         cout << "Action:	Specifies the number of mickeys of mouse movement\n"
         	  << "required for eight pixels of mouse cursor movement\n\n"	
              << "Call With:	AX = 000FH\n"
              << "		CX = horizontal mickeys(1 through 32,767; default=8)\n"
              << "		DX = vertical mickeys(1 through 32,767; default=16)\n"
              << "Returns:	Nothing\n";
         for(xb=0;xb<80;xb++)putch('-');
         cout << "\nNOTES:\n"
              << "The values that are placed in CX and DX specify the number of mickeys-"
              << "approximately 1/200 inch-that the mouse must move to cause the mouse\n"
              << "cursor to move eight pixels(or one character cell). Smaller values result\n"
              << "in greater cursor movement for given mouse movement. The default values\n"
              << "require 3.2 inches horizontal and 2 inches vertical mouse movement to\n"
              << "move the cursor over the entire screen.";
         waitclick(EITHER);
         mainer();
      }
      if(x==16)
      {
      	clrscr();
         locate(1,1);
      	cout << "INT 33H Function 10H\n"
              << "Set mouse cursor exclusion area\n";
         for(xb=0;xb<80;xb++)putch('-');
         cout << "Action:	Defines area in which the mouse cursor is hidden\n"
              << "Call With:	AX = 0010H\n"
              << "		CX = x-coordinate of upper left corner\n"
              << "		DX = y-coordinate of upper left corner\n"
              << "		SI = x-coordinate of lower right corner\n"
              << "		DI = y-coordinate of lower right corner\n"
              << "Returns:	Nothing\n";
         for(xb=0;xb<80;xb++)putch('-');
         cout << "\nNOTES:\n"
              << "When the user moves the mouse cursor within a defined exclusion area, the\n"
              << "mouse cursor is hidden. This service decrements the counter whose value\n"
              << "determines whether the mouse cursor is displayed, exactly as if Int 33H\n"
              << "Function 02H had been called. Calling Int 33H Function 00H or 01H cancels\n"
              << "any defined exclusion area.";
         waitclick(EITHER);
         mainer();
      }
      if(x==17)
      {
      	clrscr();
         locate(1,1);
      	cout << "INT 33H Function 13H\n"
              << "Set double-speed threshold\n";
         for(xb=0;xb<80;xb++)putch('-');
         cout << "Action:	Specifies the mouse movement speed at which cursor movement is doubled\n"
              << "Call With:	AX = 0013H\n"
              << "		DX = threshold speed in mickeys per second\n"
              << "Returns:	Nothing\n";
         for(xb=0;xb<80;xb++)putch('-');
         cout << "\nNOTES:\n"
              << "When the double-speed threshold is exceeded, cursor movement relative to\n"
              << "mouse movement doubles, which allows the user to make large mouse cursor\n"
              << "movements more efficiently. To effectively disable movement doubling,\n"
              << "set a large threshold(for example, 12,000). The default doubling threshold\n"
              << "is 64 mickeys per second.";
         waitclick(EITHER);
         mainer();
      }
      if(x==18)
      {
      	clrscr();
         locate(1,1);
      	cout << "INT 33H Function 15H\n"
              << "Get buffer size for saving mouse driver state\n";
         for(xb=0;xb<80;xb++)putch('-');
         cout << "Action:	Determines the size of the buffer needed to store\n"
         	  << "		the mouse driver's state retrieved by a call to Int 33H Function 16H."
              << "Call With:	AX = 0015H\n"
              << "Returns:	BX = required buffer size in bytes\n";
         for(xb=0;xb<80;xb++)putch('-');
         cout << "\nNOTES:\n"
              << "See \"Notes\" for Int 33H Function 16H.";
         waitclick(EITHER);
         mainer();
      }
      if(x==19)
      {
      	clrscr();
         locate(1,1);
      	cout << "INT 33H Function 16H\n"
              << "Save mouse driver state\n";
         for(xb=0;xb<80;xb++)putch('-');
         cout << "Action:	Save the current state of the mouse driver in a user-allocated buffer.\n"
              << "Call With:	AX = 0016H\n"
              << "		ES = segment buffer\n"
              << "		DX = offset buffer\n"
              << "Returns:	Nothing\n";
         for(xb=0;xb<80;xb++)putch('-');
         cout << "\nNOTES:\n"
              << "First the program must call Int 33H Function 15H to determine the size of\n"
              << "the buffer. The calling program must allocate the buffer.\n"
              << "A program should call this service before executing a child process(with\n"
              << "Int 21H Function 4BH)that might use the mouse. After execution returns\n"
              << "from the child process, use Int 33H Function 17H to restore the mouse\n"
              << "driver state.";
         waitclick(EITHER);
         mainer();
      }
      if(x==20)
      {
      	clrscr();
         locate(1,1);
      	cout << "INT 33H Function 17H\n"
              << "Restore mouse driver state\n";
         for(xb=0;xb<80;xb++)putch('-');
         cout << "Action:	Restores a previously saved mouse driver state\n"
              << "Call With:	AX = 0017H\n"
              << "		ES = segment buffer\n"
              << "		DX = offset buffer\n"
              << "Returns:	Nothing\n";
         for(xb=0;xb<80;xb++)putch('-');
         cout << "\nNOTES:\n"
              << "This service restores a mouse driver state that was saved previously with\n"
              << "Int 33H Function 16H. See \"Notes\" for that service for more information.";
         waitclick(EITHER);
         mainer();
      }
      if(x==21)
      {
      	clrscr();
         locate(1,1);
      	cout << "INT 33H Function 1AH\n"
              << "Set mouse sensitivity\n";
         for(xb=0;xb<80;xb++)putch('-');
         cout << "Action:	Specifies the mickeys-to-cursor movement sensitivity and also sets the\n"
         	  << "mouse threshold speed for cursor movement doubling.\n\n"
              << "Call With:	AX = 001AH\n"
              << "		BX = horizontal mickey sensitivity(0 through 100)\n"
              << "		CX = vertical mickey sensitivity(0 through 100)\n"
              << "		DX = double-speed threshold sensitivity(0 through 100)\n"
              << "Returns:	Nothing\n";
         for(xb=0;xb<80;xb++)putch('-');
         cout << "NOTES:\n"
              << "This service combines the actions of Int 33H Functions 0FH and 13H.\n"
              << "The values placed in BX and CX specify the sensitivity of the cursor to\n"
              << "mouse movement. These values don't specify a particular mickeys-to-pixels\n"
              << "radio. Instead, they offer programmers an intuitive range from which to\n"
              << "choose mouse sensitivity. Smaller values result in greater cursor movement\n"
              << "for a given mouse movement.\n"
              << "When a double-speed threshold is exceeded, cursor movement relative to\n"
              << "mouse movement doubles, which allows the user to make large mouse cur-\n"
              << "sor movements more efficiently. The value placed in DX doesn't specify a\n"
              << "particular double-speed threshold. A value of 0 results in a low double-\n"
              << "speed threshold; a value of 50, the default double-speed threshold of 64\n"
              << "mickeys per second; and a value of 100, a high double-speed threshold.";
         waitclick(EITHER);
         mainer();
      }
      if(x==22)
      {
      	clrscr();
         locate(1,1);
      	cout << "INT 33H Function 1BH\n"
              << "Get mouse sensitivity\n";
         for(xb=0;xb<80;xb++)putch('-');
         cout << "Action:	Returns the current values of the vertical and horizontal mickey-to-\n"
              << "	pixel ratios and the speed threshold for doubling of cursor motion.\n"
              << "Call With:	AX = 001BH\n"
              << "Returns:	BX = current horizontal mickey sensitivity\n"
              << "		CX = current vertical mickey sensitivity\n"
              << "		DX = current double-speed threshold sensitivity\n";
         for(xb=0;xb<80;xb++)putch('-');
         cout << "\nNOTES:\n"
              << "See \"Notes\" for Int 33H Function 1AH for further information about these\n"
              << "settings.";
         waitclick(EITHER);
         mainer();
      }
      if(x==23)
      {
      	clrscr();
         locate(1,1);
      	cout << "INT 33H Function 1CH\n"
              << "Set mouse driver interupt rate\n";
         for(xb=0;xb<80;xb++)putch('-');
         cout << "Action:	Sets the rate at wich mouse driver queries mouse hardware\n"
              << "	pixel ratios and the speed threshold for doubling of cursor motion.\n\n"
              << "Call With:	AX = 001CH\n"
              << "		BX = Interupt rate:\n"
              << "			Bit(s)	Meaning(if set)\n"
              << "			 0    	  No interupts\n"
              << "			 1    	  30 interupts per second\n"
              << "			 2    	  50 interupts per second\n"
              << "			 3    	  100 interupts per second\n"
              << "			 4    	  200 interupts per second\n"
              << "			 5-15 	  Reserved(0)\n"
              << "Returns:	Nothing\n";
         for(xb=0;xb<80;xb++)putch('-');
         cout << "\nNOTES:\n"
              << "This service is available only with the InPort mouse.\n"
              << "The higher interupt rates provide better resolution in graphics mode\n"
              << "but might slow program perforemance.\n"
              << "If more than one bit in BX is set, the device uses the rightmost set bit\n"
              << "(the lowest-order set bit).";
         waitclick(EITHER);
         mainer();
      }
      if(x==24)
      {
      	clrscr();
         locate(1,1);
      	cout << "INT 33H Function 1DH\n"
              << "Set mouse cursor display page\n";
         for(xb=0;xb<80;xb++)putch('-');
         cout << "Action:	Specifies the video display page for the mouse cursor\n"
              << "Call With:	AX = 001DH\n"
              << "		BX = Display Page Number\n"
              << "Returns:	Nothing\n";
         for(xb=0;xb<80;xb++)putch('-');
         cout << "\nNOTES:\n"
              << "The number of available display pages depends on the display mode.\n"
              << "See the reference entry for Int 10H Function 05H in chapter 7\n"
              << "of MS-DOS programming by Peter G. Aitken.";
         waitclick(EITHER);
         mainer();
      }
      if(x==25)
      {
      	clrscr();
         locate(1,1);
      	cout << "INT 33H Function 1EH\n"
              << "Get mouse cursor display page\n";
         for(xb=0;xb<80;xb++)putch('-');
         cout << "Action:	Returns the current mouse cursor display page\n"
              << "Call With:	AX = 001EH\n"
              << "Returns:	BX = Current display page\n";
         for(xb=0;xb<80;xb++)putch('-');
         cout << "\nNOTES:\n"
              << "For information about this service, see \"Notes\" for Int 33H Function 1DH.";
         waitclick(EITHER);
         mainer();
      }
      if(x==26)
      {
      	clrscr();
         locate(1,1);
      	cout << "INT 33H Function 21H\n"
              << "Reset mouse driver\n";
         for(xb=0;xb<80;xb++)putch('-');
         cout << "Action:	Resets the mouse driver and returns its status\n"
              << "Call With:	AX = 0021H\n"
              << "Returns:	If mouse is available:\n"
              << "			AX = FFFFH\n"
              << "			BX = number of buttons\n"
              << "		If mouse is available:\n"
              << "			AX = 21H\n";
         for(xb=0;xb<80;xb++)putch('-');
         cout << "\nNOTES:\n"
              << "Unlike Int 33H Function 00H, this service does not initialize the mouse\n"
              << "hardware. However, like In 33H Function 00H, this service initializes the\n"
              << "mouse sofware.";
         waitclick(EITHER);
         mainer();
      }
      if(x==27)
      {
      	clrscr();
         locate(1,1);
      	cout << "INT 33H Function 2AH\n"
              << "Get cursor hot spot\n";
         for(xb=0;xb<80;xb++)putch('-');
         cout << "Action:	Returns graphics cursor hot spot coordinates, mouse display\n"
         	  << "counter state, and mouse type.\n"
              << "Call With:	AX = 002AH\n"
              << "	Returns:\n"
              << "			AX = cursor display counter stateH\n"
              << "			BX = horizontal hot spot\n"
              << "			CX = vertical hot spot\n"
              << "			DX = mouse type(see \"Notes\")\n";
         for(xb=0;xb<80;xb++)putch('-');
         waitclick(EITHER);
         cout << "\nNOTES:\n"
              << "This service is available with Microsoft Mouse Driver version 7.02 and\n"
              << "later.\n"
				  << "If the cursor display counter is 0, the cursor is visible on the screen.\n"
              << "If it is less than 0, the cursor is hidden. Calls to Int 33H Function 01H\n"
              << "increment the counter by 1 if it is less than 0, and have no affect if it is\n"
              << "0. Calls to Int 33H Function 02H decrement the counter by 1.\n"
              << "The hot spot coordinates are relative to the upper left corner of the cursor\n"
              << "block, and specify the exact pixel to which the graphics cursor is pointing.\n"
              << "To set the hot spot coordinates, use Int 33H Function 09H.\n"
              << "	Value		Type\n"
              << "	 0   		 No mouse\n"
              << "	 1   		 Bus mouse\n"
              << "	 2   		 Serial mouse\n"
              << "	 3   		 InPort mouse\n"
              << "	 4   		 IBM mouse\n"
              << "	 5   		 Hewlet-Packard mouse";
         waitclick(EITHER);
         mainer();
      }
   }
   else
   {
      locate(1,3);
   	puts("ERROR! Did not find that function!");
      getch();
   }
mouse();
}
void futypes(void)
{
   int x;

   locate(4,7);
   printf("Listing Function Types");
   locate(12,12);
	puts("Function Types:");
   puts("			 -	Bios");
   puts("			 -	Dos");
   puts("			 -	Mouse");
   waitclick(EITHER);
   locate(1,2);
   for(x=0;x<80;x++)putch(' ');
   mainer();
}
void iregs(void)
{
   int x;

   locate(1,14);
   for(x=0;x<80;x++)putch(' ');
   locate(1,15);
   for(x=0;x<80;x++)putch(' ');
   locate(1,16);
   for(x=0;x<80;x++)putch(' ');
   locate(1,17);
   for(x=0;x<80;x++)putch(' ');
   locate(1,18);
   for(x=0;x<80;x++)putch(' ');

	locate(4,7);
   printf("Showing Registers");
   locate(9,9);
   puts("Register\tCategory\tUse\n");
   puts("\tAX	| General Purpose | Various");
   puts("\tBX	| General Purpose | Various");
   puts("\tCX	| General Purpose | Various");
   puts("\tDX	| General Purpose | Various");
   puts("\tCS	| Segment\t  | Code Segment");
   puts("\tDS	| Segment\t  | Data Segment");
   puts("\tES	| Segment\t  | Extra Segment\n");
   puts("\tCflag is allso a wordreg. Each wordreg(2 bytes) can be divided into");
   puts("\ttwo byteregs(1 byte each), as high and low. Byteregs to AX would be");
   puts("\tah and al. H standing for high and l low. High is executed first");
   puts("\tthen low. Cflag can not be divided.");
   waitclick(EITHER);
   locate(1,2);
   for(x=0;x<80;x++)putch(' ');
   mainer();
}
void lfunc(void)
{
   int x;

	locate(4,7);
   printf("Listing functions");
   locate(0,9);
   puts("\tDos\tBios\tMouse");
   puts("\t01H\t00H \t00H to 09H");
   puts("\t06H\t02H \t0AH");
   puts("\t07H\t03H \t0BH");
   puts("\t08H\t05H \t0CH");
   puts("\t0AH\t12H \t0DH");
   puts("\t0BH\t\t0EH");
   puts("\t0CH\t\t0FH");
   puts("\t33H\t\t10H to 17H");
   puts("\t\t\t1AH");
   puts("\t\t\t1BH");
   puts("\t\t\t1CH");
   puts("\t\t\t1DH");
   puts("\t\t\t1EH");
   puts("\t\t\t21H");
   puts("\t\t\t2AH");
   waitclick(EITHER);
   locate(1,2);
   for(x=0;x<80;x++)putch(' ');
   mainer();
}
void endprog(void)
{
	clrscr();
   locate(9,12);
   printf("Thanks for using Function Finder V1.0\n");
   puts("			\(Hit enter to quit\)");
   inregs.h.ah=0x0C;
   int86(0x21,&inregs,&outregs);
   ms_init();
   ms_hidecrsr();
   getch();
   clrscr();
   exit(0);
}

