#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <signal.h>

int vuln(char *str)
{
	int len = strlen(str);
	if (str[0] == 'A' && len == 66)
	{
		raise(SIGSEGV);
		// If the first character of the input string is A and the length is 66, abnormal exit
	}
	else if (str[0] == 'F' && len == 6)
	{
		raise(SIGSEGV);
		// If the first character of the input string is F and the length is 6, abnormal exit
	}
	else
	{
		printf("it is good!\n");
	}
	return 0;
}

int main(int argc, char *argv[])
{
	char buf[100] = {0};

	gets(buf);	 // There is a stack overflow vulnerability
	printf(buf); // There is a format string vulnerability
	vuln(buf);

	return 0;
}
