const
  max_memory = 30000

let
  data = readFile("test.txt")

var
  loop_stack: seq[int] = @[]
  memory: array[max_memory, int]
  mem_ptr = 0
  file_ptr = 0
  loop = false
  value = 0


while file_ptr < len(data):
  value = memory[mem_ptr]

  case data[file_ptr]
  of '+': memory[mem_ptr] = if value < 255: (value + 1) else: 0
  of '-': memory[mem_ptr] = if value > 0: (value - 1) else: 255
  of '<': mem_ptr = if mem_ptr == 0: 0 else: (mem_ptr - 1)
  of '>': mem_ptr = if mem_ptr == (max_memory - 1): (max_memory - 1) else: (mem_ptr + 1)
  of '[':
    if value == 0:
      var char = '~'
      while char != ']':
        file_ptr += 1
        char = data[file_ptr]
    else:
      loop_stack.add(file_ptr + 1)
  of ']':
    if value == 0:
      loop_stack.delete(len(loop_stack)-1)
    else:
      loop = true
      file_ptr = loop_stack[^1]
  of ',': memory[mem_ptr] = int(char(readLine(stdin)[0]))
  of '.': echo chr(value)
  else: discard

  if loop == false:
    file_ptr += 1
  else:
    loop = false


echo memory

