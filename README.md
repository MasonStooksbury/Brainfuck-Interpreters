# Brainfuck Interpreters

<br>

## What is this and why?
Learning new programming languages can be difficult. One way that helps me is to write a bunch of different programs (or rewrite old stuff from other languages) as a way to get more practice using the various parts of the language. It helps to have something I'm familiar with, but also has enough challenge where I can really dig into the strengths or inconveniences of a given language.

A Brainfuck interpreter is - for me - a great program to write as it includes enough pitfalls that you can easily get stuck, but is also simple enough that you can do it in a couple of hours, worst case.

<br><br>

## Wait, what is Brainfuck?
Brainfuck is a Turing-complete, esoteric language created by Urban Müller in 1993. Building off of Corrado Böhm's `P''` ("P double-prime") language, Brainfuck allows for easy input/output with the operators `,` and `.` respectively. Feel free to read more about Brainfuck [here](https://esolangs.org/wiki/Brainfuck)

<br><br>

## Finished languages
- Bash
- C++
- Go
- Groovy
- JavaScript
- Lua
- Nim
- Perl
- Python
- Ruby
- Rust
- V

<br><br>

## Upcoming languages
- Assembly
- C
- COBOL
- D
- Elixir
- F#
- FORTRAN
- Gleam
- Haskell
- Julia
- Kotlin
- PHP
- PowerShell
- R
- VBA
- VBScript
- Zig

<br><br>

## Interesting things I learned about each language

- Python
  - N/A
- Rust
  - N/A
- JavaScript
  - N/A
- Ruby
  - Really easy and nice to use. Though, I do find Array initialization to be kinda wonky
- Go
  - The whole concept of "runes"
  - When reading data from a file it will give you the data how it is represented in memory. So reading "AAA" from a file and iterating over it will yield "656565". Meaning you often have to convert things between strings, runes, etc
- Bash
  - Bash has always been a fun, cryptic, and wizardly experience when writing it. So I always like trying weird stuff like this to learn new tricks.
  - Arithmetic Comparison (i.e. the (()) syntax to do stuff like (( thing < 69 ))) always trips me up and I often forget about it
- C++
  - Wayyyy easier than I expected it to be. I'm sure more complicated things would get annoying, but this wasn't nearly as bad as I was prepared for
- Perl
  - Feels like a weird lovechild of Python and Bash. Some things are easy and high level, but the required symbols before variable names is really annoying
  - Also, no booleans?
- Groovy
  - I love how simple reading from a file is
- Lua
  - I enjoy the syntax for getting an array's length where all I have to do is prepend the array name with #. Very convenient
- Nim
  - There's so much to hate about this language. The fact that I literally *can't* use tabs (the compiler straight-up won't let you), the inconsistency of colons (you put colons after every control flow and loop structure _EXCEPT_ `case` for some reason), the fact that `!` works when doing `if flump != true:` but doesn't work if you try to do `if !flump:`.
  - That being said, once compiled, it is *fast*.
  - I also like the block assign. It's nice that if they're going to force me to use var/let/const, I can at least organize everything into similar blocks and assign them that way
  - It has some high-level functionality that I wasn't expecting. The fact that reading in a file is literally as easy as `let file = readFile("test.txt")` is nuts
- V
  - Every looping structure being an overloaded FOR loop is an interesting design choice. Not bad, per se, just really weird
  - I see the Go inspiration, but in terms of syntax it feels more like a lovechild of Python and Rust
  - C interoperability, inline ASM, works for WASM, etc. This language can do a lot and is super versatile
  - Very simple file syntax: `data := os.read_lines('test.txt')!`

<br><br>

## General process for each language
Here is a list of things that you have to do to create an interpreter for Brainfuck. This also doubles as a list of all the things you end up learning for every new language

- Read file contents into a variable (usually a string, but sometimes a byte array. Really just anything that is indexed and you can iterate over)
- Declare an indexed array of a fixed size
- Declare an indexed array of variable size
- Start a WHILE loop
- Get length of a string
- SWITCH statement (or MATCH, or an IF/ELSE ladder, etc)
- Change value in array
- Append value to the end of an array
- Remove value from the end of an array
- Get value at the end of an array (You'd be surprised how many languages do not support negative array indexing)
- Keyboard input
- Converting input (often a string) into the decimal representation for that given ASCII value (e.g. A -> 65)
- Converting decimal to ASCII for printing (e.g. 65 -> A)
- Printing to the console
- Does the language have a simple increment operator syntax like +=1 or ++? Or do you have to do the long version? (i.e. temp = temp + 1)
- Does the language have a simple NOT operator like `!` or `not`? (This is why I do `if !loop` at the bottom of my WHILE loops rather than switch the logic and do `if loop`)
