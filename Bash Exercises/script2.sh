#!/bin/bash

# ------------------------------------------------------------------------------------------------------------------
# Write a shell script in that asks for your full name and prints it.

# echo " Input your name: "
# read name

# echo " Hi, $name !"
# ------------------------------------------------------------------------------------------------------------------

# Write a shell script in that asks for your age and prints it.

# echo " What is your age? "
# read age

# echo " Oh, so your age is: $age ."
# ------------------------------------------------------------------------------------------------------------------

# Write a command that prints the value of Pi. Demonstrate that it should not be changeable.

# readonly PI=3.14

# echo "Value of pi is: $PI "
# ------------------------------------------------------------------------------------------------------------------

# Write a shell script in that stores the current date in a variable and prints it.

# today=$(date)

# echo "Time is: $today "
# ------------------------------------------------------------------------------------------------------------------

# Write a shell script in that prints all the outputs for exercises 1, 2 and 4. Print all the answers in a separate line.
# your output should be like this:
# What is your name?
# XYZ ABC
# Hello XYZ ABC
# What is your age?
# 44
# So you are 44.
# Today's date is .......

echo " What is your name? "
read name
echo " Hello $name "

echo "what is your age? "
read age
echo "So you are $age"

echo "Todays date is $(date)"
