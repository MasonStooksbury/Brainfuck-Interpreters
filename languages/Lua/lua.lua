#!/usr/bin/lua

-- Read the file into "data"
file = {}
for line in io.lines('test.txt') do
    file[#file + 1] = line
end

-- Concatenate all the lines from the file
file_data = ''
for i=1, #file do
    file_data = file_data..file[i]
end

-- Convert the string into a Lua array so we can interate over it
data = {}
for i=1, #file_data do
    local c = file_data:sub(i,i)
    data[i] = c
end


local max_memory = 30000

-- Initialize memory array with zeros
local memory = {}
for i=1, max_memory do
    memory[i] = 0
end


local mem_ptr = 1
local file_ptr = 1

local loop_stack = {}

loop = false
while file_ptr <= #data do
    local value = memory[mem_ptr]

    if data[file_ptr] == '+' then
        memory[mem_ptr] = (value < 255 and value + 1 or 0)
    elseif data[file_ptr] == '-' then
        memory[mem_ptr] = (value > 0 and value - 1 or 255)
    elseif data[file_ptr] == '<' then
        mem_ptr = (mem_ptr == 0 and 0 or mem_ptr - 1)
    elseif data[file_ptr] == '>' then
        mem_ptr = (mem_ptr == max_memory and max_memory or mem_ptr + 1)
    elseif data[file_ptr] == '[' then
        -- Do nothing and jump to the end of the loop
        if (value == 0) then
            local char = ''
            while not (char == ']') do
                file_ptr = file_ptr + 1
                char = data[file_ptr]
            end
        else
            table.insert(loop_stack, file_ptr + 1)
        end
    elseif data[file_ptr] == ']' then
        if (value == 0) then
            -- Remove the last element in loop stack
            table.remove(loop_stack)
        else
            loop = true
            file_ptr = loop_stack[#loop_stack]
        end
    elseif data[file_ptr] == ',' then
        memory[mem_ptr] = string.byte(io.read(1))
    elseif data[file_ptr] == '.' then
        print(string.char(value))
    end

    if (not loop) then
        file_ptr = file_ptr + 1
    else
        loop = false
    end
end

for i=1, #memory do
    io.write (memory[i]..' ')
end
io.write ('\n')
