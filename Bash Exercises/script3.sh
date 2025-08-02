#!/bin/bash

# echo -n "Please enter a filename: "
# read filename

# count=$(wc -l < $filename)

# echo " Number of line in $filename is $count. "

# Took argument directly from CLI.
# nlines=$(wc -l < $1)
# echo " Number of lines in $1 is $nlines. "

# command to find on machine. 
# find / -iname $1 2> /dev/null

# --------------------------------------------------------------------------------------------------------------------------
# Special Variable	                Description
# $0	                         The name of the bash script.
# $1, $2...$n	                  The bash script arguments.
# $$	                        The process id of the current shell.
# $#	                   The total number of arguments passed to the script.
# $@	                   The value of all the arguments passed to the script.
# $?	                      The exit status of the last executed command.
# $!	                       The process id of the last executed command.
# --------------------------------------------------------------------------------------------------------------------------

# Exercise 1: What is this script?

# echo $0
# --------------------------------------------------------------------------------------------------------------------------

# Exercise 2: Let me reverse that
# Write a shell script that takes 3 arguments and prints them in the reverse order.

# echo "Original Input: $1 $2 $3 "
# echo "Reverse List:" 
# echo "$3 $2 $1" 
# --------------------------------------------------------------------------------------------------------------------------

# Exercise 3: Write a shell script that accepts a directory name called hello and creates it if it doesn't exist already. 
# Switch to this directory and create a new file named new.txt.

# echo " Enter directory name: "
# read name

# if [[ -e $name ]]
# then
#    echo " Directory Exists, skipping task"
# else
#    mkdir $name
#    echo "created directory"
# fi
# --------------------------------------------------------------------------------------------------------------------------

# Exercise 4: Write a shell script in that accepts a command as argument and gives the location of its binary file.

echo " Give command as input: "
read $input

find / -iname $1 2> /dev/null






