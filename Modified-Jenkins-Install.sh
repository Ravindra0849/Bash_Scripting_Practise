
# Jenkins Installation using Variables, Exit Status, Conditions and Functions

#  Here USerID and VALIDATE are Functions
# Here if is a Condition
# Here Inside function we are calling conditions as Variables
# Here we are using the Redirection. STDIN =  Success = 1 and STDERR = Failure = 2.
# Here iam Using Colour codings for better visualization.

#!/bin/bash

USERID=$ (id -u)
DATE=$ (date)
LOG="Modified-Jenkins-Install-${DATE}.log"    # This is Used to store all the logs in a file for any time to see this logs.
R="\e [31m"    # This is Red Colour, When any Error is There it shows in Red Colour
G="\e [32m"    # This is Green Colour, it shows all the success in this colour
N="\e [0m"     # This is the Default Colour

VALIDATE() {
    if [ $1 -ne 0 ]; then
    echo -e " $2 ... is ${R} failure ${N} " 2>&1 | tee -a $LOG   # Here "-e" is the extension of the Colours, tee is a command used for to take success and failure logs inside the log file.
    exit 1
else 
    echo -e " $2 ... is ${G} success ${N} " 2>&1 | tee -a $LOG    # Here "-e" is the extension of the Colours, tee is a command used for to take success and failure logs inside the log file.
fi
}

if [ USERID -ne 0 ]; then
    echo " ${R} You need to change a root user for execution ${N} "
    exit 1
fi

apt-get update -y  &>>$LOG      # Here &>>$LOG is used for to store all the logs of command in a modified Jenkins installation log file, if the log is success or failure it stores all the logs in that file.
VALIDATE $? "Update repo"     


apt-get install -y openjdk-11-jdk &>>$LOG
VALIDATE $? "Java Download"


wget -O /usr/share/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key  &>>$LOG

VALIDATE $? "Jenkins Keys download"

deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null  &>>$LOG

VALIDATE $? "Jenkins Packages download"

apt-get update -y  &>>$LOG
VALIDATE $? "Update repo"


apt-get install jenkins -y &>>$LOG
VALIDATE $? "Jenkins Installation"

systemctl enable jenkins &>>$LOG
VALIDATE $? "Enable Jenkins"

systemctl start jenkins &>>$LOG
VALIDATE $? "Start Jenkins"

systemctl status jenkins &>>$LOG
VALIDATE $? "status Jenkins"