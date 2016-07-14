#include <stdio.h>
#include "simple_nct.h"

int main(int argc, char *argv[])
{
	printf("MYBOOL = %d\n", SIM_MYBOOL);
	printf("MYSTRING = %s\n", SIM_MYSTRING);
	printf("MYTRISTATE = %d\n", SIM_MYTRISTATE);
	printf("MYINT = %d\n", SIM_MYINT);
	printf("MYHEX = 0x%x\n", SIM_MYHEX);
	return 0;
}
