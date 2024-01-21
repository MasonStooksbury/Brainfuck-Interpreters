data = File.open('test.txt').read

max_memory = 10
memory = Array.new(max_memory){|e| e = 0 }

mem_ptr = 0
file_ptr = 0

loop_stack = []

should_loop = false


while file_ptr < data.length
    value = memory[mem_ptr]

    case data[file_ptr]
    when '+'
        memory[mem_ptr] = value < 255 ? value + 1 : 0
    when '-'
        memory[mem_ptr] = value > 0 ? value - 1 : 255
    when '<'
        mem_ptr = mem_ptr == 0 ? 0 : mem_ptr - 1
    when '>'
        mem_ptr = mem_ptr == max_memory - 1 ? max_memory - 1 : mem_ptr + 1
    when '['
        if value == 0
            char = ''
            while char != ']'
                file_ptr += 1
                char = data[file_ptr]
            end
        else
            loop_stack << file_ptr + 1
        end
    when ']'
        if value == 0
            loop_stack.pop()
        else
            should_loop = true
            file_ptr = loop_stack.last()
        end
    when ','
        memory[mem_ptr] = gets.chomp.ord
    when '.'
        puts "#{memory[mem_ptr].chr}"
    end
    
    if should_loop == false
        file_ptr += 1
    else
        should_loop = false
    end
end


puts "#{memory}"