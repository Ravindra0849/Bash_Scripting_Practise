
# Jenkins Installation using Variables, Exit Status, Conditions and Functions

#  Here USerID and VALIDATE are Functions
# Here if is a Condition
# Here Inside function we are calling conditions as Variables

#!/bin/bash

USERID=$ (id -u)

VALIDATE() {
    if [ $1 -ne 0 ]; then
    echo " $2 ... is failure "
    exit 1
else 
    echo " $2 ... is success "
fi
}

if [ USERID -ne 0 ]; then
    echo " You need to change a root user for execution "
    exit 1
fi

apt-get update -y
VALIDATE $? "Update repo"


apt-get install -y openjdk-11-jdk
VALIDATE $? "Java Download"


wget -O /usr/share/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key

VALIDATE $? "Jenkins Keys download"

deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null

VALIDATE $? "Jenkins Packages download"

apt-get update -y
VALIDATE $? "Update repo"


apt-get install jenkins -y
VALIDATE $? "Jenkins Installation"

systemctl enable jenkins
VALIDATE $? "Enable Jenkins"

systemctl start jenkins
VALIDATE $? "Start Jenkins"

systemctl status jenkins
VALIDATE $? "status Jenkins"