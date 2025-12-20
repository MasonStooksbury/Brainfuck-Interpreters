module main

import os
import readline

const max_memory := 30000

fn main() {
	data := os.read_file('test.txt')!

	mut memory := []int{len: max_memory, cap: max_memory, init: 0}

	mut mem_ptr := 0
	mut file_ptr := 0

	mut loop_stack := []int{}

	mut loop := false

	mut value := 0

	mut r := readline.Readline{}

	for file_ptr < data.len {
		value = memory[mem_ptr]

		match data[file_ptr].ascii_str() {
			'+' { memory[mem_ptr] = if value < 255 {value + 1} else {0} }
			'-' { memory[mem_ptr] = if value > 0 {value - 1} else {255} }
			'<' { mem_ptr = if mem_ptr == 0 {0} else {mem_ptr - 1} }
			'>' { mem_ptr = if mem_ptr == max_memory-1 {max_memory - 1} else {mem_ptr + 1} }
			'[' { 
				if value == 0 {
					mut chr := ''
					for chr != ']' {
						file_ptr += 1
						chr = data[file_ptr].ascii_str()
					}
				} else {
					loop_stack << file_ptr+1
				}
			 }
			']' { 
				if value == 0 {
					loop_stack.pop()
				} else {
					loop = true
					file_ptr = loop_stack.last()
				}
			 }
			',' { memory[mem_ptr] = r.read_char()!}
			'.' { println(u8(memory[mem_ptr]).ascii_str()) }
			else {}
		}

		if !loop {
			file_ptr += 1
		} else {
			loop = false
		}
	}

	println(memory)
}
