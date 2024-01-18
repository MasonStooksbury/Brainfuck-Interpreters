use std::fs;
use std::io;

fn main() {
    let data = fs::read("test.txt").expect("Failed to read in the test data file");

    const MAX_MEMORY: usize = 10;
    let mut memory = [0; MAX_MEMORY];

    let mut mem_ptr: usize = 0;
    let mut file_ptr: usize = 0;

    let mut loop_stack: Vec<usize> = vec![];

    let mut should_loop: bool = false;

    while file_ptr < data.len() {
        let character = data[file_ptr];

        let value = memory[mem_ptr];

        match character {
            b'+' => memory[mem_ptr] = if value < 255 { value + 1 } else { 0 },
            b'-' => memory[mem_ptr] = if value > 0 { value - 1 } else { 255 },
            b'<' => mem_ptr = if mem_ptr == 0 { 0 } else { mem_ptr - 1 },
            b'>' => {
                mem_ptr = if mem_ptr == MAX_MEMORY-1 {
                    MAX_MEMORY - 1
                } else {
                    mem_ptr + 1
                }
            }
            b'[' => {
                // Do nothing and jump to the end of the loop
                if value == 0 {
                    let mut char = b'~';

                    while char != b']' {
                        file_ptr += 1;
                        char = data[file_ptr];
                    }
                } else {
                    loop_stack.push(file_ptr + 1);
                }
            }
            b']' => {
                if value == 0 {
                    loop_stack.pop().expect("Tried to get value from empty loop_stack");
                } else {
                    should_loop = true;
                    file_ptr = *loop_stack.last().expect("Tried to get last element from empty loop_stack");
                }
            }
            b',' => {
                let mut input = String::new();
                io::stdin().read_line(&mut input).expect("");

                memory[mem_ptr] = input.trim().chars().next().expect("") as u8;
            }
            b'.' => println!(
                "{}",
                char::from_u32(memory[mem_ptr].try_into().expect("Failed to convert u8 to u32")).expect("Failed to convert u32 to char")
            ),
            _ => (),
        }

        if !should_loop {
            file_ptr += 1;
        } else {
            should_loop = false;
        }
    }

    println!("{:?}", memory);
}
