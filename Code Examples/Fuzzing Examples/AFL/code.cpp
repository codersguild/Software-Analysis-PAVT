#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <assert.h>
#include <inttypes.h>
#include <libhfuzz/libhfuzz.h>
#define FILESIZE 2048

int main(void)
{
    char buff[FILESIZE];
    memset(buff, '\0', sizeof(buff));

    // Writing the fuzzing data session in a file.
    FILE *fptr = fopen("fuzzing.txt", "a");
    setvbuf(fptr, buff, _IOLBF, FILESIZE);

    int a = 0, fuzz = 0;
    scanf("%d", &a);
    scanf("%d", &fuzz);

    if (a >= 100 && fuzz >= 50)
    {
        fprintf(fptr, "Failed 1 : %s -> %d, %s -> %d\n", "a", a, "fuzz", fuzz);
        fclose(fptr);
        assert(0);
    }
    else if (a <= 30 && fuzz >= 70)
    {
        fprintf(fptr, "Failed 2 : %s -> %d, %s -> %d\n", "a", a, "fuzz", fuzz);
        fclose(fptr);
        assert(0);
    }
    else if (a > 2000 && fuzz < 800)
    {
        fprintf(fptr, "Failed 3 : %s -> %d, %s -> %d\n", "a", a, "fuzz", fuzz);
        fclose(fptr);
        assert(0);
    }
    else if (a > 5000 && fuzz >= 70)
    {
        fprintf(fptr, "Failed 4 : %s -> %d, %s -> %d\n", "a", a, "fuzz", fuzz);
        fclose(fptr);
        assert(0);
    }
    else if (a <= -520 && fuzz >= -7055)
    {
        fprintf(fptr, "Failed 5 : %s -> %d, %s -> %d\n", "a", a, "fuzz", fuzz);
        fclose(fptr);
        assert(0);
    }
    else
    {
        fclose(fptr);
        assert(0);
    }

    fprintf(fptr, "No fail\n");
    fclose(fptr);
    return 0;
}