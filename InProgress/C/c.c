// C program to read a file using fgetc()
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>

int main() {

    int max_memory = 10;
    int memory[max_memory];

    int mem_ptr = 0;


    bool loop = false;
  
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
                printf("%c", "3");
                break;
            case '.':
                printf("%c", "3");
                break;
        }
    }

    for (int i=0; i<10; i++) {
        printf("%i ", memory[i]);
    }
    printf("\n");

    // Closing the file
    fclose(file);
    return 0;
}