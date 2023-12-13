
# Here the output is $? = 0 then it is success
# Here the output is $? = 1-127 then it is failure

# In Shell Script, by default the script will be proceed even the previous command is failure
# our responsibility is to check the exit status and proceed with next command.

#!/bin/bash

lss -ltr  # this is not correct command
echo "exit status: $?"    # here if it  is failure, it should not proceed the script

ls -ltr
echo "exit status: $?"