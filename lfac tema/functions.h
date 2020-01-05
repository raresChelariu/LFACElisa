#include <stdio.h>
#include <string.h>

struct var
{
   int val;
   char name[256];
   int init;
};

struct var vars[256];
int nrvar = 0;


void initializare (char x[], int v)
{	
	strcpy (vars[nrvar].name, x);
	vars[nrvar].init = 1;
	vars[nrvar].val = v;
	nrvar++;
}

void declarare (char x[])
{
	strcpy (vars[nrvar].name,x);
	vars[nrvar].init = 0;
	nrvar++;
}

int verifdecl (char x[])
{
    int i;
    for (i=0; i <= nrvar; i++)
       if (strcmp(x, vars[i].name) == 0) 
       { 
            return i;
       }
    return -1;
}

void atribuire(char x[],int v)
{
    int p = verifdecl(x);
    vars[p].val = v;
    vars[p].init = 1;
}

int verifinit(char x[])
{
    int i;
    for (i=0; i <= nrvar; i++)
       if (strcmp(x, vars[i].name) == 0) 
       	if (vars[i].init == 0)
        		return -1;
        	else 
                return 1;
    return -1;
}