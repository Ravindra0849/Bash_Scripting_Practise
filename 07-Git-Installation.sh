# Git Installation Steps
# ========================
# Check User id. if the user id is "0" then it is a "root" user. if it is not "0" then it is "normal user".
# To check the user id execute the command as "id".
# Create one variable as "USERID" take the output of "id -u" into it.
# If USERID is "0" then install "git", otherwise throug an "Error".

#!/bin/bash

USERID=$(id -u)
# check user 

if [USERID -ne 0 ]; then
    echo "you need to be a root user to execute this script"
    exit 1
fi

apt update

if [$? -ne 0]; then
    echo "update the repo is failure"
    exit 1
else 
    echo "update the repo is success"
fi

apt install -y git

if [$? -ne 0]; then
    echo "Installing git is failure"
    exit 1
else 
    echo "Installing git is success"
fi