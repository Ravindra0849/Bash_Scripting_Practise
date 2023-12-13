
#!/bin/bash

lss -ltr    # If u rectify this error it will execute the both if conditions

if [ $? -ne 0 ]; then
    echo "previous command is failue"
    exit 1
fi

ls -ltr
if [ $? -ne 0 ]; then
    echo "previous command is failue"
    exit 1
fi

echo "program is success"