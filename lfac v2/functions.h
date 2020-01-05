#include <stdio.h>
#include <string.h>


struct var
{
   int valint;
   char* valchar;
   char name[256];
   int init;
};

struct var vars[256];
int nrvar = 0;


void initializareINT (char x[], int v)
{	
	strcpy (vars[nrvar].name, x);
	vars[nrvar].init = 1;
	vars[nrvar].valint = v;
	nrvar++;
}

void initializareCHAR (char x[], char* v)
{
    strcpy (vars[nrvar].name, x);
    vars[nrvar].init = 1;
    strcpy (vars[nrvar].valchar, v);
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

void atribuireINT(char x[],int v)
{
    int p = verifdecl(x);
    vars[p].valint = v;
    vars[p].init = 1;
}

void atribuireCHAR(char x[],char* v)
{
    int p = verifdecl(x);
    strcpy(vars[p].valchar, v);
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

/*
float atof (char* x)
{
    float r = 0;
    float im = 0;
    int i = 0;
    while (x[i] != '.')
    {
        r = r * 10 + (x[i] - '0');
        i++; 
    }
    i = strlen(x) - 1;
    while (x[i] != '.')
    {
        im = im / 10 + (x[i] - '0');
        i--;
    }
    im = im / 10;
    r = r + im;
    return r;
}*/