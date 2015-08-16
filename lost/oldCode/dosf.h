/* Dos Function Header File for C by Atle Holm */
/* Most functions are from books, some functions were made the files author.  */

#include <dos.h>     //If you include this file(dosf.h) in your program, you do not need to include
#include <stdio.h>   //these header files, since they are included here
#include <stdlib.h>
#include <string.h>
#include <conio.h>

#define MouseCall int86(0x33,&inregs,&outregs)
#define LEFT 0
#define RIGHT 1
#define BOTH 2
#define EITHER 3
#define SOFTCURSOR 0
#define HARDCURSOR 1
#define CR 0x0d
#define BC 0x08
#define LF 0x0a
#define ESC 0x1b

union REGS inregs, outregs;

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

void clearbuttons(void);
void clearscreen(void);
void display_string(char *p, int row, int col, int fg, int bg, int blink);
void set_cursor_pos(int col, int row, int page);
void locate(char x, char y);
void kbrepeat(int rate, int delay);
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
int get_video_mode(void);
int get_display_page(void);
void set_display_page(int page);
int check_input(void);
int passwrd(char password[],int xs,int y);

int passwrd(char password[],int xs,int y)
{
/* Takes a  password for input and asks user to type it to continue */
/* Password must not be more than 20 character long(+ a NULL byte) */
/* Returns 0 if user typed wrong password, returns 1 if user typed right password */
/* Xs and y are the coordinates for where the user should start writing his password */
   char input[21];
   int x=0,x_b;

	puts("Please enter your password:\n");
   	/* Clear the input buffer */
   inregs.h.ah=0x0C;
   int86(0x21,&inregs,&outregs);

   for(x_b=0;x_b<21;x_b++)input[x_b]=' ';
   locate(xs,y);
   do
   {
   	if(x==0)for(x=0;x<21;x++)input[x]='?';//start over again
      if(input[0]=='?' && input[1]=='?')x=0;

   	input[x]=getch();
      switch(input[x])
      {
         case ESC:
               printf("\n\nEscape will not let you get away from this\n");
               getch();
               clrscr();
         		x=0;
               break;
      	case CR:
               putchar(CR);
               putchar(LF);
      			input[x]=NULL;
               break;
         case BC:
         		if(x==0)break;
         		putchar(BC);
         		putchar(' ');
         		putchar(BC);
         		x--;
               break;
         default:
               putchar('*');
               x++;
               break;
      }
      if(x>20)input[x]=NULL;
   }
   while(input[x]);
   if(strcmp(password,input)!=0)return(0);
   if(strcmp(password,input)==0)return(1);
   return(0);
} //End of passwrd()
int check_input(void)
{
/* Checks input buffer and returns 0 if there is no character in buffer, 1 if there is */
	inregs.h.ah=0x0b;
   int86(0x21,&inregs,&outregs);
   if(outregs.h.al==0xFF)return(1);
	if(outregs.h.al!=0xFF)return(0);
   return(0);
}  //End of check_input()
int get_video_mode(void)
{
	/* Returns the current video mode */
   inregs.x.ax=0xFF00;
   int86(0x10,&inregs,&outregs);
   return(outregs.h.al);
}

int get_display_page(void)
{
	/* Returns the current display page */
	inregs.x.ax=0xFF00;
   int86(0x10,&inregs,&outregs);
   return(outregs.x.bx >> 8);
}
void set_display_page(int page)
{
	/* Sets the active display page */

   inregs.x.ax=0x500 + page;
   int86(0x10,&inregs,&outregs);
}
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
}
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
void kbrepeat(int rate, int delay)
{
/* Sets the keyboard repeat rate and delay time */
/* rate% = 00H sets fastest rate
			  1FH sets slowest rate
           Any other sets rate to 10 per second

	delay% = 0 sets delay time to 250 msec
            1 sets delay time to 500 msec
            2 sets delay time to 750 msec
            Any other sets delay time to 1000 msec */

   inregs.x.ax=0x305;
   if(delay>=0 && delay<=2)inregs.h.bh=delay;
   else inregs.h.bh=3;
   if(rate>=0 && rate <=0x1F)inregs.h.bl=rate;
   else inregs.h.bl=0xC;
   int86(0x16,&inregs,&outregs);
}
void locate(char x, char y)
{
	inregs.h.ah=0x02;
   inregs.h.dh=y-1;
   inregs.h.dl=x-1;
   inregs.h.bh=0;
   int86(0x10,&inregs,&outregs);
}
void display_string(char *p, int row, int col, int fg, int bg, int blink)
{
	int count, length, attribute=0;
   char *p1;

   /* Check for empty string */
   if(strlen(p)==0)return;

   /* Construct the attribute byte if requested */

   if((fg>=0)&&(bg>=0)&&(blink>=0))
   {
   	/* Set bit 7 if blinking reguested */
      if(blink>0)attribute=0x80;

      /* Specify the background color in bits 4 through 6 */
      attribute=attribute | ((bg*16)& 0x70);

      /* Specify the foreground color in bits 0 through 2*/
      attribute=attribute | (fg & 0xF);
   }
   else attribute=-1;

   /* Set the cursor position if requested */
   if((row>=0)&&(col>=0))set_cursor_pos(col, row, 0);

   /* Display the string */
   length=strlen(p);
   p1=p;

   for(count=1;count<=length;count++)
   {
   	/* If the attributes are changing, use Int 10H Function 09H */
      /* to write a space character that has the desired attributes */
      if(attribute>=0)
      {
      	inregs.x.ax=0x920;
         inregs.x.bx=attribute;
         inregs.x.cx=1;
         int86(0x10,&inregs,&outregs);
      }
      /* Use Int 10H Function 0EH to write the character */
      inregs.x.ax=0xE00 + *p1++;
      inregs.x.bx=0;
      int86(0x10,&inregs,&outregs);
   }
}
void set_cursor_pos(int col, int row, int page)
{
	/* Sets cursor poition on the specified display page */
   /* to the indicated position */

   inregs.x.ax=0x200;
   inregs.h.bh=page;
   inregs.h.dh=row;
   inregs.h.dl=col;

   int86(0x10,&inregs,&outregs);
}
void clearscreen(void)
{
	int x;

   for(x=0;x<25;x++)printf("\n");
}