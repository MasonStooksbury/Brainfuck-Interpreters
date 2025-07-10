public class Brainfuck {
    public static void main(String[] args) {
        String data = new File('test.txt').text

        int max_memory = 10
        int[] memory = [0] * max_memory

        int mem_ptr = 0
        int file_ptr = 0

        def loop_stack = []

        boolean loop = false
        while (file_ptr < data.length()) {
            int value = memory[mem_ptr]

            switch (data[file_ptr]) {
                case '+':
                    memory[mem_ptr] = value < 255 ? value + 1 : 0
                    break;
                case '-':
                    memory[mem_ptr] = value > 0 ? value - 1 : 255
                    break;
                case '<':
                    mem_ptr = mem_ptr == 0 ? 0 : mem_ptr - 1
                    break;
                case '>':
                    mem_ptr = mem_ptr == (max_memory - 1) ? (max_memory - 1) : mem_ptr + 1
                    break;
                case '[':
                    if (value == 0) {
                        char character = '~'
                        while (character != ']') {
                            file_ptr++
                            character = data[file_ptr]
                        }
                    } else {
                        loop_stack.add(file_ptr + 1)
                    }
                    break;
                case ']':
                    if (value == 0) {
                        loop_stack.removeLast()
                    } else {
                        loop = true
                        file_ptr = loop_stack.last()
                    }
                    break;
                case ',':
                    def input = System.console().readLine ''
                    memory[mem_ptr] = input[0]
                    break;
                case '.':
                    System.out.print((char) memory[mem_ptr])
                    break;
            }

            if (!loop) {
                file_ptr++
            } else {
                loop = false
            }
        }

        System.out.println('\n' + memory)
    }
}