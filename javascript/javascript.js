const fs = require('fs')
const readlinesync = require('readline-sync')

// Read in test file data
const data = fs.readFileSync('test.txt', 'utf-8')

const max_memory = 30000

// This solution is faster than stuff like .fill() when arrays get large
// https://stackoverflow.com/questions/1295584/most-efficient-way-to-create-a-zero-filled-javascript-array
const memory = []
for (let i = 0; i < max_memory; i++) {
    memory[i] = 0
}

let mem_ptr = 0
let file_ptr = 0

const loop_stack = []

let loop = false


while (file_ptr < data.length) {
    let character = data[file_ptr]
    let value = memory[mem_ptr]

    switch (character) {
        case '+':
            memory[mem_ptr] = value < 255 ? value + 1 : 0
            break
        case '-':
            memory[mem_ptr] = value > 0 ? value - 1 : 255
            break
        case '<':
            mem_ptr = mem_ptr == 0 ? 0 : mem_ptr - 1
            break
        case '>':
            mem_ptr = (mem_ptr == max_memory - 1) ? max_memory - 1 : mem_ptr + 1
            break
        case '[':
            if (value == 0) {
                let char = ''
                while (char != ']') {
                    file_ptr += 1
                    char = data[file_ptr]
                }
            } else {
                loop_stack.push(file_ptr + 1)
            }
            break
        case ']':
            if (value == 0) {
                loop_stack.pop()
            } else {
                loop = true
                file_ptr = loop_stack[loop_stack.length - 1]
            }
            break
        case ',':
            memory[mem_ptr] = readlinesync.question('Enter a character: ')[0].charCodeAt()
            break
        case '.':
            console.log(String.fromCharCode(memory[mem_ptr]))
            break
    }


    if (!loop) {
        file_ptr += 1
    } else {
        loop = false
    }
}


console.log(memory)