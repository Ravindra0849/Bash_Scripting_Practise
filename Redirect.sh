# Here we are using the Redirection. 
# STDIN =  Success = 1 and 
# STDERR = Failure = 2.

# Redirect is used for store all the logs in a file, while the script is executed.

# for only Success logs we use "sh <script file>.sh 1>>test.log"

# for only Error logs we use "sh <script file>.sh 2>>test.log"

# For storing both Success and Error Logs, We Use "sh <script file>.sh &>>test.log"

# Here the simple Bash Scripting is 

#!/bin/bash

# For Success Logs
ls -ltr 1>> test.log   # to check this Comment below the error and both log 

# For Error Logs
lss -ltr 2>> test.log   # to check this Comment below and upper the Success and both log

# For Both
ls -ltr  &>> test.log   # to check this Comment upper the Success and error log