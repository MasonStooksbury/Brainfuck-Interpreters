use warnings;
use Switch;

# Read file into a variable
open my $file_handler, '<', 'test.txt' or die "Can't open file $!";
$data = do { local $/; <$file_handler> };

$max_memory = 30000;
@memory = (0) x $max_memory;

$mem_ptr = 0;
$file_ptr = 0;

@loop_stack = ();

# Perl doesn't have booleans, so we have to use zero instead
$loop = 0;
while ($file_ptr < length($data)) {
    $value = $memory[$mem_ptr];

    switch (substr($data, $file_ptr, 1)) {
        case '+' { $memory[$mem_ptr] = $value < 255 ? $value + 1 : 0; }
        case '-' { $memory[$mem_ptr] = $value > 0 ? $value - 1 : 255; }
        case '<' { $mem_ptr = $mem_ptr == 0 ? 0 : $mem_ptr - 1; }
        case '>' { $mem_ptr = $mem_ptr == ($max_memory - 1) ? ($max_memory - 1) : $mem_ptr + 1; }
        case '[' {
            if ($value == 0) {
                $char = '';
                while ($char ne ']') {
                    $file_ptr++;
                    $char = substr($data, $file_ptr, 1);
                }
            } else {
                push(@loop_stack, $file_ptr + 1);
            }
        }
        case ']' { 
            if ($value == 0) {
                pop(@loop_stack);
            } else {
                $loop = 1;
                $file_ptr = $loop_stack[-1];
            }
        }
        case ',' {
            $input = <>;
            chomp($input);
            $memory[$mem_ptr] = ord($input);
        }
        case '.' { print(chr($value)); }
    }



    if (not($loop)) {
        $file_ptr++;
    } else {
        $loop = 0;
    }
}


print("\n");
print join(' ', @memory);