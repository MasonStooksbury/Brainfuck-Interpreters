package main

import (
	"fmt"
	"os"
)

func main() {

	content, _ := os.ReadFile("test.txt")

	data := string(content)

	var memory [10]int

	var mem_ptr = 0
	var file_ptr = 0

	// var loop_stack []int

	// var loop = false

	for file_ptr < len(data) {
		// Data is represented as how it is stored in memory. So '+' is actually stored as '43'
		// So we need to convert everything to its ASCII representation
		var character = string(data[file_ptr])
		var value = memory[mem_ptr]


		switch character {
		// We have to use double quotes here, otherwise Go will think this is a "rune" and try to
		// 		compare character (which is a string) to a rune. Which are incompatible types
		case "+":
			if value < 255 {
				memory[mem_ptr] = value + 1
			} else {
				memory[mem_ptr] = 0
			}
		}

		file_ptr += 1
	}








    // fmt.Println(data)
	fmt.Println(memory)
}