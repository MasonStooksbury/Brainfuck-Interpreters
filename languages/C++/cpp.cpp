#include <iostream>
#include <fstream>
#include <string>
#include <vector>

int main () {
    std::ifstream file_stream ("test.txt");
    std::string data;

    if ( file_stream.is_open() ) {
        while (file_stream.good()) {
            std::string temp;
            file_stream >> temp;
            data += temp;
        }
    }

    const int max_memory = 30000;
    int memory[max_memory] = {};

    int mem_ptr = 0;
    int file_ptr = 0;

    std::vector<int> loop_stack;

    bool loop = false;
    while (file_ptr < data.length()) {
        int value = memory[mem_ptr];

        switch(data[file_ptr]) {
            case '+':
                memory[mem_ptr] = value < 255 ? value + 1 : 0;
                break;
            case '-':
                memory[mem_ptr] = value > 0 ? value - 1 : 255;
                break;
            case '<':
                mem_ptr = mem_ptr == 0 ? 0 : mem_ptr - 1;
                break;
            case '>':
                mem_ptr = mem_ptr == (max_memory - 1) ? (max_memory - 1) : (mem_ptr + 1);
                break;
            case '[':
                if (value == 0) {
                    char current_char = '~';
                    while (current_char != ']') {
                        file_ptr += 1;
                        current_char = data[file_ptr];
                    }
                } else {
                    loop_stack.push_back(file_ptr + 1);
                }
                break;
            case ']':
                if (value == 0) {
                    loop_stack.pop_back();
                } else {
                    loop = true;
                    file_ptr = loop_stack.back();
                }
                break;
            case ',':
                char temp;
                std::cin >> temp;
                memory[mem_ptr] = (int) temp;
                break;
            case '.':
                std::cout << (char) memory[mem_ptr];
                break;
        }



        if (!loop) {
            file_ptr += 1;
        } else {
            loop = false;
        }
    }

    std::cout << "\n\n";
    for (int index : memory) {
        std::cout << index << "";
    }
}
