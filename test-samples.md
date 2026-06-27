# Test + - < >

```rust
>>++>-<<+++<-+

-----------------------
| 0 | 3 | 2 | 255 | ...
-----------------------
```

# Simple addition

```rust
++++ Num 1
>
+++  Num 2
<

[->+<]> Add them together

>+++++   Put "48" into an address to convert to ASCII
[>++++++++++<-]
>--

[-<+>]  Move 48 closer to the number from before
<<
[->+<]>.  Add them together and print the result

Prints out the number 7

------------------
| 0 | 0 | 55 | ...
------------------
```

# Skip test (when starting loop on empty section, it should skip that loop

```rust
+++++>[>>>]+++

-------------
| 5 | 3 | ...
-------------
```

# Nested loop

```rust
++> Initialize with 2
++++++++ Initialize with 8
<
[>[>+<-]++++++++<-] Brute force multiply

------------------
| 0 | 8 | 16 | ...
------------------
```

# Very complex nested loop

```rust
>+[+[<]>>+<+]>. Print the letter 'A'

----------------------
| 0 | 0 | 0 | 65 | ...
----------------------
```