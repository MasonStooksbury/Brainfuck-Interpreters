#!/bin/sh
data=`cat test.txt`

max_memory=30000

# Create an indexed array
declare -a memory=( $(for i in $( seq 0 $max_memory ); do echo 0; done;) )

mem_ptr=0
file_ptr=0

declare -a loop_stack=()


loop=false
# Iterate along the file until the file_ptr exceeds the length of the file
while (( $file_ptr < ${#data} ))
do
    value=${memory[mem_ptr]}

    case ${data:file_ptr:1} in 
        "+")
            if (( $value < 255 ))
            then
                memory[$mem_ptr]=$((value + 1))
            else
                memory[$mem_ptr]=0
            fi
            ;;
        "-")
            if (( $value > 0 ))
            then
                memory[$mem_ptr]=$((value - 1))
            else
                memory[$mem_ptr]=255
            fi
            ;;
        "<")
            if (( $mem_ptr == 0 ))
            then
                mem_ptr=0
            else
                mem_ptr=$((mem_ptr - 1))
            fi
            ;;
        ">")
            if (( $mem_ptr == max_memory ))
            then
                mem_ptr=$max_memory
            else
                mem_ptr=$((mem_ptr + 1))
            fi
            ;;
        "[")
            if (( $value == 0 ))
            then
                char="~"
                while [ "$char" != "]" ]
                do
                    ((file_ptr++))
                    char=${data:$file_ptr:1}
                done
            else
                loop_stack+=($((file_ptr + 1)))
            fi
            ;;
        "]")
            if (( $value == 0 ))
            then
                unset loop_stack[-1]
            else
                loop=true
                file_ptr=${loop_stack[-1]}
            fi
            ;;
        ",")
            temp=""
            read -p "Enter a character: " temp
            # The single quote next to $temp is necessary to tell printf to use the ASCII decimal for that character
            memory[mem_ptr]=$(printf "%d" "'$temp")
            ;;
        ".")
            printf \\$(printf '%03o' ${memory[mem_ptr]})
            ;;
    esac



    if ! $loop
    then
        ((file_ptr++))
    else
        loop=false
    fi
done


echo
echo ${memory[@]}