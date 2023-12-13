
# Functions
# =========

#!/bin/bash

Hello () {
    echo "Hello !!! $1"
}

echo "Check the name before calling: $1 "     # Mention the name while executing the script
Hello $1

echo  # This is used for the new line purpose for gap b/w two scripts

# Script With to print Script name and Args with in the function  

Hello () {
    echo "Hello !!! $1"
    echo "Script Name: $0"
    echo "Number of args: $#"
    echo "All the args: $@"
}

echo "Check the name before calling: $1 "     # Mention the 2 name while executing the script
Hello $1

echo   # This is used for the new line purpose for gap b/w two scripts

# Print Script name and Args with in the function and Outside the function

Hello () {
    echo "Hello !!! $1"
    echo "Script Name: $0"
    echo "Number of args: $#"
    echo "All the args: $@"
}

echo "Check the name before calling: $1 "     # Mention the 2 name while executing the script
echo "Script Name: $0"
echo "Number of args: $#"
echo "All the args: $@"
Hello $1