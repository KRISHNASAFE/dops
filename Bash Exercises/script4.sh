# Arrays in Bash 

# Write a shell script in that uses an array to store the names of the seven colors of the rainbow and prints it.
colours=( "Violet" "Indigo" "Blue" "Green" "Yellow" "Orange" "Red" )
# Print all colours
# echo ${colours[*]}

# Write a shell script in that asks you to pick a color from exercise 1 and print it.

# echo "First colour of rainbow:"
# echo ${colours[0]}

# Write a shell script in that prints the number of colors of the rainbow from exercise 1.
# echo "Colours of rainbow:"
# echo ${colours[*]}
# echo "Number of colours in rainbow:"
# echo ${#colours[@]}

# Write a shell script to swap any two colors of the rainbow from the current order as in exercise 1.

echo "Colours before swapping: ${colours[*]}"

temp=${colours[0]}
colours[0]=${colours[4]}
colours[4]=$temp

echo "Colours after swap: ${colours[*]}"

# Write a shell script to add an 8th color to the rainbow array described in exercise 1. Let's say cyan.

echo ${colours[*]}

colours+=("Cyan")
echo ${colours[*]}
