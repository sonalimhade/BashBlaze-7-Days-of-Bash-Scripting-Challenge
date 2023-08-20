#!/bin/bash

echo "Welcome to the interactive file and directory explorer!!!"

# print files and directories presentand their size
echo "Files and their size in human readable format:"

while true; do


        ls -lh

        # Part 2: Character counting

        #read a line of text from user until he enters an empty string

        read -p "enter a line of text or string (Press enter key without text to exit)" input

        if [ -z "$input" ]; then
                echo "User has entered an empty string to exit"
                break
        fi


        # Now count the no. of characters in the line of text entered by user"
        char_count=$(echo -n "$input" | wc -m)
        echo "The count of characters: $char_count"
done
