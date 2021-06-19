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
    FILE *fptr = fopen("fuzzing.txt", "w");
    setvbuf(fptr, buff, _IOLBF, FILESIZE);

    for (;;)
    {
        // Length and buffer (fuzz-data)
        // for HonggFuzz to use and populate
        size_t len;
        uint8_t *buf;

        HF_ITER(&buf, &len);

        // We are interested in checking if
        // this assert condition fails or not.
        if (buf[len - 1] >= 100)
        {
            fprintf(fptr, "Failed : %s -> %d, %s -> %d\n", "buffer length", len, "data", buf[len - 1]);
            fclose(fptr);
            assert(0);
        }
    }

    fprintf(fptr, "No fail\n");
    fclose(fptr);
    return 0;
}