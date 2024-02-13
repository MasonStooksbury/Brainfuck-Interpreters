use warnings;

# Read file into a variable
open my $file_handler, '<', 'test.txt' or die "Can't open file $!";
my $data = do { local $/; <$file_handler> };

$max_memory = 10;
@memory = (0) x $max_memory;


print(@memory);