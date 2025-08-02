#!/bin/bash


# -----------------------------------------------------------------------------------------------------------------
# In bash, $0 is a special parameter that holds the name of the script or shell that is currently being executed. 
# It is also known as the “name” or “zeroth argument” of the script.
# In simple language, $0 : first arg which gives here output as name of script.

# echo " The name of currently running script is: $0"
# -----------------------------------------------------------------------------------------------------------------
# You can also determine the directory in which the script is located and 
# then use that directory to locate any files the script needs.

# SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
# echo "The script is running from $SCRIPT_DIR"
# -----------------------------------------------------------------------------------------------------------------
# Command line arguments :
# If we passed an argument with script name in CLI it will be hold by $1 & when script runs it displays the value.
# try executing below line as ./$name_of_script "name of person"
# output will be like Hello name of person !
# echo " Hello $1 !" 
# -----------------------------------------------------------------------------------------------------------------

# To check whether number of argumets passed are correct or not: 

# if [[ $# -ne 2 ]]
# then 
#    echo "Usage: verify.sh [username] [password]"
#    exit 1
# fi 
# In above program if 2 arguments are not present it will print echo statement.

# -----------------------------------------------------------------------------------------------------------------

# Exit status of last executed commnd: 

# touch file.txt

# file_name="/workspaces/dops/Bash Exercises/file.txt"

# if [[ -e "$file_name" ]]
# then 
#    echo " File exists "
# else 
#    echo "creating file"
#    touch file.txt
# fi


# if [[ $? -eq 0 ]]
# then 
    # echo " File created successfully in: $(dirname "${BASH_SOURCE[0]}")" 
    # echo "File created successfully in: $(dirname "${BASH_SOURCE[0]}" && pwd)"
    # echo " File created successfully in: $(pwd) "
# else
#    echo " Error creating file"
# fi 

# -----------------------------------------------------------------------------------------------------------------

# $$ - Process ID of current shell 
# The $$ variable contains the process ID of the current script. 
# This variable is useful for creating shell scripts that need to manage multiple processes or create unique file names.
# For example, suppose you have a script called “log.sh” that logs information to a file with a unique name based on 
# the process ID. In that case, you can use the $$ variable to generate a unique file name.
# -----------------------------------------------------------------------------------------------------------------

# $! - The process ID of last command 
# The $! variable contains the process ID of the last background command executed by the script. 
# This variable is useful for creating shell scripts that need to manage multiple processes or monitor the progress of long-running commands.

# touch file.txt

mycommand &

pid=$!
while ps -p $pid >/dev/null; do
    echo "Command is still running" 
    sleep 1
done
echo "command has finished" 





