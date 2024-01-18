use std::io;
use std::fs;

fn main() {

    let data = fs::read("test.txt").unwrap();

    const MAX_MEMORY: usize = 10;
    let mut memory = [0; MAX_MEMORY];

    let mut mem_ptr: usize = 0;
    let mut file_ptr: usize = 0;

    let mut loop_stack: Vec<usize> = vec![];

    let mut should_loop: bool = false;

    // Start while loop
    while file_ptr < data.len() {
        let mut character = data[file_ptr];

        let mut value = memory[mem_ptr];

        match character {
            b'+' => memory[mem_ptr] = if value < 255 { value + 1 } else { 0 },
            b'-' => memory[mem_ptr] = if value > 0 { value - 1 } else { 255 },
            b'<' => mem_ptr = if mem_ptr - 1 < 0 { 0 } else { mem_ptr - 1 },
            b'>' => mem_ptr = if mem_ptr == MAX_MEMORY { MAX_MEMORY - 1 } else { mem_ptr + 1 },
            b'[' => {
                if value != 0 {
                    loop_stack.push(file_ptr + 1);
                } else if value == 0 {
                    todo!();
                }
            },
            b']' => todo!(),
            b',' => {
                let mut input = String::new();
                io::stdin().read_line(&mut input).expect("");

                memory[mem_ptr] = input.trim().chars().next().expect("") as u8;
            },
            b'.' => println!("{}", char::from_u32(memory[mem_ptr].try_into().unwrap()).unwrap()),
            _ => ()
        }

        file_ptr += 1;
    }

    println!("{:?}", memory);
}
