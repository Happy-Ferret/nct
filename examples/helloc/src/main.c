#include <stdio.h>
#include "helloc_nct.h"

#if FEATURE1
void feature1_greet(void);
#endif

#if FEATURE2
void feature2_greet(void);
#endif

int main(int argc, char *argv[])
{
	printf("%s v%s\n\n", PKG_NAME, PKG_VER);
	printf("Hello There! nCrux Configuration Tool.\n\n");

	#if FEATURE1
	feature1_greet();
	#endif

	#if FEATURE2
	feature2_greet();
	#endif

	#if FEATURE3
	feature3_greet();
	#endif

	#if FEATURE4
	feature4_greet();
	#endif

	return 0;
}
