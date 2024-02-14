use warnings;
use Switch;

# Read file into a variable
open my $file_handler, '<', 'test.txt' or die "Can't open file $!";
$data = do { local $/; <$file_handler> };

$max_memory = 10;
@memory = (0) x $max_memory;

$mem_ptr = 0;
$file_ptr = 0;

@loop_stack = ();

# Perl doesn't have booleans, so we have to use zero instead
$loop = 0;
while ($file_ptr < length($data)) {
    $value = $memory[$mem_ptr];

    switch($data[$file_ptr]) {
        case "+" {
            print('fuck');
        }
    }

    if (not($loop)) {
        $file_ptr = $file_ptr + 1;
    } else {
        $loop = 0;
    }
}



print(@memory);
print(@loop_stack);
