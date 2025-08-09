# str1="Hello"
# str2="World !"

# echo "$str1 $str2"
# echo "Length of String($str1): "${#str1}

str="Bash is cool"

word="cool"

position=$(expr index "$str" "$word")

echo "$position"


