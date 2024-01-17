use std::io;
use std::fs;

fn main() {

    let data = fs::read("test.txt").unwrap();

    const MAX_MEMORY: usize = 10;
    let mut memory = [0; MAX_MEMORY];

    let mut mem_ptr: usize = 0;
    let mut file_ptr: usize = 0;

    let loop_stack: Vec<u8> = vec![];

    let mut should_loop: bool = false;

    // Start while loop
    while file_ptr < data.len() {
        let mut character = data[file_ptr];

        let mut value = memory[mem_ptr];

        match character {
            b'+' => memory[mem_ptr] = if value < 255 { value + 1 } else { 0 },
            b'-' => memory[mem_ptr] = if value > 0 { value - 1 } else { 255 },
            b'<' => mem_ptr = if mem_ptr - 1 < 0 { 0 } else { mem_ptr - 1 },
            b'>' => mem_ptr = if mem_ptr + 1 >= MAX_MEMORY { MAX_MEMORY - 1 } else { mem_ptr + 1 },
            b'[' => todo!(),
            b']' => todo!(),
            b',' => todo!(),
            b'.' => println!("{}", char::from_u32(memory[mem_ptr]).unwrap()),
            _ => ()
        }

        file_ptr += 1;
    }

    println!("{:?}", memory);
}
