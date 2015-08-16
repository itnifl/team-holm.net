/* Demonstration of using text mode mouse services */

#include <stdio.h>
#include <dos.h>
#include <conio.h>
#include <stdlib.h>

/* Define a macro to simplify calling Int 33H */
#define MouseCall int86(0x33,&inregs,&outregs)

/* Constants for button and cursor definitions */
#define LEFT 0
#define RIGHT 1
#define BOTH 2
#define EITHER 3
#define SOFTCURSOR 0
#define HARDCURSOR 1
/* Declare the register unions */
union REGS inregs,outregs;
/* Declare a structure to hold mouse information */
struct mousedata{
   int exists;					/* Greater than 0 if mouse exists */
   int cursor_display;		/* 1 if cursor is displayed, 0 if cursor is hidden */
   int btnstatus;				/* Current button status (up or down) */
   int btnclicks;				/* Times button has been clicked */
   int column;					/* Mouse cursor column */
   int row;						/* Mouse cursor row position */
   int hmovement;				/* Horizontal mouse movement */
   int vmovement;				/* Vertical mouse movement */
   }rodent;
/* Function Prototypes */
void clearscreen(void);
void clearbuttons(void);
int ms_btnpress(int button);
int ms_btnrelease(int button);
void ms_exclude(int topftx, int toplefty, int btmrtx, int btmrty);
int ms_getstatus(void);
void ms_hidecrsr(void);
int ms_init(void);
void ms_lightpenoff(void);
void ms_lightpenon(void);
void ms_movecrsr(int row, int col);
void ms_movement(void);
void ms_sethrange(int leftcol, int rightcol);
void ms_setvrange(int upperrow,int lowerrow);
void ms_settextcrsr(int cursortype, int scan1, int scan2);
void ms_showcrsr(void);
void waitclick(int button);
void locate(char x, char y);

/**************************************/
/*	  These are the mouse functions	  */
/**************************************/
void clearbuttons(void)
{
	/* Reset the mouse driver's internal press and release counters to 0 for both buttons */

   inregs.x.ax=0x05;
   inregs.x.bx=LEFT;
   MouseCall;

   inregs.x.ax=0x05;
   inregs.x.bx=RIGHT;
   MouseCall;

   inregs.x.ax=0x06;
   inregs.x.bx=LEFT;
   MouseCall;

   inregs.x.ax=0x06;
   inregs.x.bx=RIGHT;
   MouseCall;
}	//End of clearbuttons()

int ms_btnpress(int button)
{
	/* Returns button press information about the specified button */

   inregs.x.ax=0x05;
   inregs.x.bx=button;
   MouseCall;

   rodent.btnstatus=outregs.x.ax;
   rodent.btnclicks=outregs.x.bx;
   rodent.column=outregs.x.cx;
   rodent.row=outregs.x.dx;

   return outregs.x.bx;
}	/* End of ms_btnpress() */

int ms_btnrelease(int button)
{
	/* Returns button release information about the specified button */

   inregs.x.ax=0x06;
   inregs.x.bx=button;
   MouseCall;

   rodent.btnstatus=outregs.x.ax;
   rodent.btnclicks=outregs.x.bx;
   rodent.column=outregs.x.cx;
   rodent.row=outregs.x.dx;

   return outregs.x.bx;
}	/* End of ms_btnrelease() */

void ms_exclude(int topleftx,int toplefty,int btmrtx,int btmrty)
{
	/* Defines a mouse cursor exclusion area for which the corners are specified in pixels */

	inregs.x.ax=0x10;
   inregs.x.cx=topleftx;
   inregs.x.dx=toplefty;
   inregs.x.si=btmrtx;
   inregs.x.di=btmrty;

   MouseCall;
}	/* End of ms_exclude() */
int ms_getstatus(void)
{
	/* Returns mouse status at the time of the call.
    rodent.column and rodent.row give mouse cursor position.
    rodent.btnstatus = 0 if no buttons were pressed
    						= 1 if left button was pressed
                     = 2 if right button was pressed
                     = 3 if both buttons were pressed
    */

    inregs.x.ax=0x03;
    MouseCall;

    rodent.btnstatus=outregs.x.bx;
    rodent.column=outregs.x.cx;
    rodent.row=outregs.x.dx;

    return outregs.x.bx;
}	/* End of ms_getstatus */
void ms_hidecrsr(void)
{
	/* Hides the cursor if it is displayed */
   if(rodent.cursor_display)
   {
   	inregs.x.ax=0x02;
      MouseCall;
   }
}	/* End of ms_hidecrsr() */

int ms_init(void)
{
	/* If a mouse is installed, initializes and */
   /* sets rodent.exists to 1. If no mouse is installed, */
   /* sets rodent.exists to 0. */

   inregs.x.ax=0;
   MouseCall;

   rodent.exists=outregs.x.ax;
   return(outregs.x.ax);
}//End of ms_init()
void ms_lightpenoff(void)
{
	/* Turns Light pen emulation off */

   inregs.x.ax=0x0E;
   MouseCall;
}	//End od ms_lightpenoff()

void ms_lightpenon(void)
{
	/*	Turns the light-pen emulation on(the default when the mouse is initialized) */
   inregs.x.ax=0x0D;
   MouseCall;
}   /* End of ms_lightpenon() */

void ms_movecrsr(int row,int col)
{
	/* Moves the cursor to the screen position specified in pixels by the parameters */

   inregs.x.ax=0x04;
   inregs.x.cx=col;
   inregs.x.dx=row;

   MouseCall;
}		/* End of ms_movecrsr() */

void ms_movement(void)
{
	/* Reports the movement of the mouse (not the mouse cursor) */
   /* since the last call to this function */
   inregs.x.ax=0x0B;

   MouseCall;

   rodent.hmovement=outregs.x.cx;
   rodent.vmovement=outregs.x.dx;
}		/* End of ms_movement() */

void ms_sethrange(int leftcol,int rightcol)
{
	/* Restricts the horizontal mouse cursor movement to the screen */
   /* region between leftcol and rightcol. If the cursor is */
   /* outside this range, it is moved inside. */

   inregs.x.ax=0x07;
   inregs.x.cx=leftcol;
   inregs.x.dx=rightcol;

   MouseCall;
}		/* End of ms_sethrange() */

void ms_setvrange(int upperrow,int lowerrow)
{
	/* Restricts vertical mouse cursor movement to the screen */
   /* region between upperrow and lowerrow. If the cursor is */
   /* outside the range, it is moved inside. */

   inregs.x.ax=0x08;
   inregs.x.cx=upperrow;
   inregs.x.dx=lowerrow;

   MouseCall;
}		/* End of ms_setvrange() */

void ms_settextcrsr(int cursortype,int scan1,int scan2)
{
	/* Sets the textcursor type.
   	If cursor type = 0, the software cursor is set and scan1 and scan2
      specify the screen and cursor masks.
      If cursortype = 1, the hardware cursor is set, and scan1 and scan2 specify
      the start and stop scanlines for the cursor */

      inregs.x.ax=0x0A;
      inregs.x.bx=cursortype;
      inregs.x.cx=scan1;
      inregs.x.dx=scan2;

      MouseCall;
}		/* End of ms_settextcrsr() */

void ms_showcrsr(void)
{
	/* Displays the mouse cursor */

   int i, counter;

   /* Call Int 33H Function 02AH to get the value of the display counter */
   inregs.x.ax=0x2A;
   MouseCall;
   counter=inregs.x.ax;

   /* Call Int 33H Function 01H as many times as needed to display the mouse cursor */
   for(i=1;i<counter;i++)
   {
   	inregs.x.ax=0x01;
      MouseCall;
   }
   rodent.cursor_display=1;
}		/* End of ms_showcrsr() */

void waitclick(int button)
{
	/* Pauses until the specified mouse button is presses and released
   	If button = 0, left button
      If button = 1, right button
      If button = 2, both buttons
      If button = 3, either button */

      rodent.btnstatus=0;
      do ms_getstatus(); while(rodent.btnstatus!=0);
      if(button<3)
      {
      	do ms_getstatus(); while(rodent.btnstatus!=button+1);
      }
      else
      {
      	do ms_getstatus(); while(rodent.btnstatus<=0);
      }
      /* Wait for button release  */
      do ms_getstatus(); while(rodent.btnstatus!=0);
}	//end of waitclick()
void locate(char x, char y)
{
	inregs.h.ah=0x02;
   inregs.h.dh=y-1;
   inregs.h.dl=x-1;
   inregs.h.bh=0;
   int86(0x10,&inregs,&outregs);
}
void clearscreen(void)
{
	int x;

   for(x=0;x<25;x++)printf("\n");
}
