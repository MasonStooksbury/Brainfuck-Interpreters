data = """

>+[+[<]>>+<+]>. Print the letter 'A'

"""

max_memory = 10
memory = [0] * max_memory


mem_ptr = 0
file_ptr = 0

loop_stack = []


loop = False
while file_ptr < len(data):
    character = data[file_ptr]
    
    value = memory[mem_ptr]
    
    match character:
        case '+': memory[mem_ptr] = value + 1 if value < 255 else 0
        case '-': memory[mem_ptr] = value - 1 if value > 0 else 255
        case '<': mem_ptr = 0 if mem_ptr - 1 < 0 else mem_ptr - 1
        case '>': mem_ptr = max_memory - 1 if mem_ptr + 1 >= max_memory else mem_ptr + 1
        case '[':
            if value != 0:
                loop_stack.append(file_ptr+1)
            elif value == 0:
                # Do nothing and jump to the end of the loop
                char = ''
                while char != ']':
                    file_ptr += 1
                    char = data[file_ptr]
        case ']':
            if value != 0:
                loop = True
                file_ptr = loop_stack[-1]
            elif value == 0:
                loop_stack.pop()
        case ',': memory[mem_ptr] = ord(input()[0])
        case '.': print(chr(value))
        
    if not loop:
        file_ptr += 1
    else:
        loop = False
