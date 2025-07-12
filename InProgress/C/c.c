#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>

int main() {
    int max_memory = 10;
    int memory[max_memory];

    // Make sure everything is zeroed-out so we don't have weird stuff in it
    bzero(&memory, max_memory * sizeof(int));

    int mem_ptr = 0;
    bool loop = false;
    int file_ptr = 0;
  
    // Opening file
    FILE *file;

    // Character buffer that stores the read character
    // till the next iteration
    char ch;

    // Opening file in reading mode
    file = fopen("test.txt", "r");

    if (NULL == file) {
        printf("Could not open test file\n");
        return EXIT_FAILURE;
    }

    int value = 0;
    while ((ch = fgetc(file)) != EOF) {
        value = memory[mem_ptr];

        switch (ch) {
            case '+':
                memory[mem_ptr] = (value < 255) ? (value + 1) : 0;
                break;
            case '-':
                memory[mem_ptr] = (value > 0) ? (value - 1) : 255;
                break;
            case '<':
                mem_ptr = (mem_ptr == 0) ? 0 : (mem_ptr - 1);
                break;
            case '>':
                mem_ptr = (mem_ptr == (max_memory - 1)) ? (max_memory - 1) : (mem_ptr + 1);
                break;
            case '[':
                printf("%c", "3");
                break;
            case ']':
                printf("%c", "3");
                break;
            case ',':
                char input;
                scanf("%c", &input);
                memory[mem_ptr] = input;
                break;
            case '.':
                printf("%c", value);
                break;
        }
    }

    if (!loop) {
        file_ptr++;
    } else {
        loop = false;
    }

    for (int i=0; i<10; i++) {
        printf("%i ", memory[i]);
    }
    printf("\n");

    fclose(file);
    return 0;
}