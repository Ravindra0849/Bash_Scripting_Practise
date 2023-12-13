
#!/bin/bash

echo -n "Enter username: "
# read USERNAME    #[Output is : ravic@MVBrothers MINGW64 ~/Desktop/Siva Practise/Bash Scripting, $sh Sensitive-data.sh,  Enter username: Ravindra]
# In Output it will show the username we need to secure the name also we need to use "-s"

read -s USERNAME

echo  # This is For additional only, you can run without this 

echo -n "Enter password: "
read -s PASSWORD

# The below commands could not be used in real time, this is for our brief only to print our username and Password

echo # This is For additional only

echo username: ${USERNAME}
echo password: ${PASSWORD}