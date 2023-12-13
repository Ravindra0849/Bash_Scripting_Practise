# Colours are used for better visualization by adding of colours.

# The Codes of Colours are
# Blue "\e [30m"
# Red "\e [31m"   is used for Error Logs
# Green "\e [32m"  is used for Success Logs
# Yellow "\e [33m"  is used for Warning Logs
# Normal "\e [0m"   is used for Normal Logs

# The Basic Script is 

#!/bin/bash

R="\e [31m"
G="\e [32m"
N="\e [0m"

echo "I Love My Mother"

echo -e " I ${R} Love ${N} My ${G} Mother ${N} "   # Here "-e" is the extension for adding the colours to the script