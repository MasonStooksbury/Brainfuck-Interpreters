package main

import (
	"fmt"
	"os"
	"bufio"
)

func main() {
	reader := bufio.NewReader(os.Stdin)
	content, _ := os.ReadFile("test.txt")

	data := string(content)

	var memory [30000]int

	var mem_ptr = 0
	var file_ptr = 0

	var loop_stack []int

	var loop = false

	for file_ptr < len(data) {
		var value = memory[mem_ptr]
		
		// Data is represented as how it is stored in memory. So '+' is actually stored as '43'
		// So we need to convert everything to its ASCII representation
		// We have to use double quotes here, otherwise Go will think this is a "rune" and try to
		// 		compare character (which is a string) to a rune. Which are incompatible types
		switch string(data[file_ptr]) {
			case "+":
				if value < 255 {
					memory[mem_ptr] = value + 1
				} else {
					memory[mem_ptr] = 0
				}
			case "-":
				if value > 0 {
					memory[mem_ptr] = value - 1
				} else {
					memory[mem_ptr] = 255
				}
			case "<":
				if mem_ptr == 0 {
					mem_ptr = 0
				} else {
					mem_ptr = mem_ptr - 1
				}
			case ">":
				if mem_ptr == len(memory) - 1 {
					mem_ptr = len(memory) - 1
				} else {
					mem_ptr += 1
				}
			case "[":
				if value == 0 {
					var char = "~"
					for char != "]" {
						file_ptr += 1
						char = string(data[file_ptr])
					}
				} else {
					loop_stack = append(loop_stack, file_ptr + 1)
				}
			case "]":
				if value == 0 {
					if len(loop_stack) > 0 {
						loop_stack = loop_stack[:len(loop_stack) - 1]
					}
				} else {
					loop = true
					file_ptr = loop_stack[len(loop_stack) - 1]
				}
			case ",":
				input, _ := reader.ReadString('\n')
				memory[mem_ptr] = int(input[0])
			case ".":
				fmt.Println(string(value))
		}


		
		if loop == false {
			file_ptr += 1
		} else {
			loop = false
			file_ptr = loop_stack[len(loop_stack)-1]
		}
	}

	fmt.Println(memory)
}