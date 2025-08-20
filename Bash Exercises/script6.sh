#!/bin/bash

# Decision making IF-ELSE

#if [ $(whoami) = 'root' ];
#then
#echo "I am" $(whoami) "running this script"
#else
#echo "I am another user" 
#fi

# Check multiple if else

# read -p "Enter your age: " age

# Check if input is a number
# if ! [[ "$age" =~ ^[0-9]+$ ]]; then
#  echo "Please enter age in numbers only"
#  exit 1
# fi

# if [[ $age -le 14 ]]; then
#  echo "You are a kid"

# elif [[ $age -ge 15 && $age -le 17 ]]; then
#  echo "You are a teenager"

# elif [[ $age -ge 18 && $age -le 21 ]]; then
#  echo "Hey, You can vote now!"

# elif [[ $age -gt 21 ]]; then
#  echo "Congrats, You are eligible for marriage."

# else
#  echo "Please enter a valid age"
# fi

# Case statement

# CHAR=$1

# case $CHAR in
# [a-z])
# echo "Small alphabet" ;;
# [A-Z])
# echo "Capital alphabet" ;;
# [0-9])
# echo "numbers" 
# esac


# if [ $# -ne 1 ]; then
# echo "Error, invalid number of args, Please provide file name at execution time"
# exit 1
# fi

# file=$1

# if [ -f $file ]; then
# echo "$file is regular file"
# elif [ -L $file ]; then
# echo "$file is symlink file" 
# elif [ -d $file ]; then
# echo "$file is directory" 
# else 
# echo "$file does not exist" 
# fi

# Write a bash shell script that checks whether the provided number is +ve or -ve.

#read -p "Enter a number: " num

#if ! [[ "$num" =~ ^[0-9]+$ ]]; then
#echo "Please enter numbers only"
#exit 1
#fi

#if [ $num -lt 0 ]; then
#echo "Entered number is -ve"
#elif [ $num -gt 0 ]; then
#echo "Entered number is +ve"
#else
#echo " Enter a +ve or -ve number" 
#fi

# Write a shell script that accepts a string and a substring from the user (use read command). Then check if the string contains that substring and print a message
# accordingly

#read -p "Enter a string:" string
#read -p "Enter another string:" sub

#if [[ $string == *"$sub"* ]]; then
#echo "$sub is substring of $string"
#fi

# Write a shell script that checks whether a file exists or not. For the simplicity, keep the full file path in the script directly.
#read -p "Enter file name:" file

#if [ -f $file ]; then
#echo "$file exists"
#else 
#echo "$file does not exists" 
#fi

# Write a shell script that prompts user to enter a string (if user wants) and then checks if the input string is empty or not.

#read -p "Enter a string:" string

#if [ -z "$string" ]; then
#echo "String is empty"
#else
#echo "String is not empty"
#fi

# Write a shell script that accepts a positive integer as argument and checks if the number is odd or even and prints 'Number X is odd' or 'Number X is even' accordingly.
# If there is no argument or more than two arguments or a negative number provided, display an error message: "You have to provide one non negative number".

#if [ $1 -lt 0 ] && [ $# -ne 1 ]; then
#echo "Please provide a single non negative number" 
#elif [ $(($1 % 2)) -eq 0 ]; then
#echo "$1 is even"
#else
#echo "$1 is odd"
#fi

# --------------------------------------------------- Loops in BASH -------------------------------------------------------------

#for i in $1; do
#echo "$i"
#done 

# Create a for loop to display a message 10 times on Bash. Execute it as a Bash script.

#for((i=0; i<10; i++)); do
#echo "I will print 10 times: $i"
#done 


# Output all the files and directory that exists under the /var directory.
#for i in /var/*; do
#echo "$i"
#done

# Use a while loop that will print the first ten multiples of the number three.

#echo "Table of 3 is:" 
#i=1
#while [ $i -le 10 ]; do
#echo "$(($i * 3))"
#i=$(($i + 1))
#done


# Use an until loop that will print the first ten multiples of the number three.

#num=1
#until [ $num -gt 10 ]; do
#echo $(($num * 3))
#num=$(($num+1))
#done

# Create an array that stores the first ten prime numbers. Iterate over the array and print out each element inside it.

#prime=(2 3 5 7 11 13 17 19 23 29)
#for i in "${prime[@]}"; do
#echo $i
#done 

# -------------------------------------------------- Functions in BASH -----------------------------------------------------------

#hello(){
#    echo "Hello World !"
#}

#hello

#read -p "Enter number:" num

#check_number() {
#    if [ $num -le 0 ]; then
#    echo "Entered number is negative"
#    else
#    echo "Entered number is positive"
#    fi
#}

#check_number


# Write a bash shell script that prints the multiplication table of a given number. Using functions is a must.

#read -p "Enter a number:" num

#multiply() {
#    for((i=1;i<=10;i++)); do
#    echo $(($num * $i))
#    done
#}

#multiply

# Write a shell script that accepts a number and check if it is prime or not. Using function is must here.

#read -p "Enter a number:" num
#counter=0

#isPrime() {
#    for((i=2;i<num;i++)); do
#        if [ $(($num % $i)) -eq 0 ]; then
#        counter=1;
#        break
#        else
#        counter=0;
#        fi
#    done
#        if [ $counter -eq 1 ]; then
#        echo "$num is not prime"
#        else
#        echo "$num is prime" 
#        fi
#}

#isPrime