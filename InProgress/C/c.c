#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>

int endOfArray(int[] array) {
    for (int i; i < sizeof(array); i++) {
        if (array[i] == 999) {
            return i;
        }
    }
}

int append(int[] array, element) {
    int end_of_array = endOfArray(array);
    array[end_of_array] = element;
    array[end_of_array + 1] = 999;
}

int pop(int[] array) {
    int end_of_array = endOfArray(array);

    int element = array[end_of_array - 1];
    array[end_of_array] = 0;
    array[end_of_array - 1] = 999;

    return element
}

int main() {
    int max_memory = 10;
    int memory[max_memory];

    // Make sure everything is zeroed-out so we don't have weird stuff in it
    bzero(&memory, max_memory * sizeof(int));
    
    int mem_ptr = 0;
    bool loop = false;
    int file_ptr = 0;
    
    // I don't feel like implementing a Vector or something from scratch
    int loop_stack[1000];
    bzero(&loop_stack, 1000 * sizeof(int));
  
    // Opening file
    FILE *file;

    // Character buffer that stores the read character
    // till the next iteration
    char ch;

    // Opening file in reading mode
    file = fopen("test.txt", "r");

    printf("starting\n");

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
                if (value == 0) {
                    printf("%c", "3");
                    char thing = '';
                    while (thing != ']') {
                        ++file_ptr;
                        thing = 
                    }
                } else {
                    append(loop_stack, ++file_ptr);
                }
                break;
            case ']':
                if (value == 0) {
                    pop(loop_stack);
                } else {
                    loop = true;
                    file_ptr = loop_stack[endOfArray(loop_stack)-1]
                }
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
        ++file_ptr;
    } else {
        loop = false;
    }

    printf("\n");
    for (int i=0; i<10; i++) {
        printf("%i ", memory[i]);
    }
    printf("\n");

    fclose(file);
    return 0;
}