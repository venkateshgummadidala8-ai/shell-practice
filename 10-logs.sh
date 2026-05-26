#!/bin/bash

USERID=$(id -u)
LOGS_DIR=/home/ec2-user/shell-logs
LOG_FILE=" $LOGS_DIR/$0.log "
#all the logs will be stored in the above file, we can use this file to check the logs of the script, we can also use this file to check the errors of the script, we can also use this file to check the output of the script, we can also use this file to check the debug logs of the script, we can also use this file to check the info logs of the script, we can also use this file to check the warning logs of the script, we can also use this file to check the error logs of the script, we can also use this file to check the critical logs of the script, we can also use this file to check the alert logs of the script, we can also use this file to check the emergency logs of the script


# check root access or not
if [ $USERID -ne 0 ]; then
    echo "please run the script with root access"
    exit 1
fi   

# first arg -> what are you trying to install
# second arg -> Exit code
VALIDATE() {
    if [ $2 -ne 0 ]; then 
        echo " Installing $1 is failed "
        exit 1
    else 
        echo "$1 installed succesfully"
    fi
}

# echo " i am continuing ....."
dnf list install mysql &>> $LOG_FILE

if [ $? -ne 0 ]; then 
    echo " mysql is already installed .....skipping"
else
    echo " installing mysql "
    dnf install mysql -y
    VALIDATE "mysql" $?
  
fi    


# install nginx
dnf list installed ngnix 
if [ $? -ne 0 ]; then
    echo " nginx is already installed...skipping "
    else 
        echo " installing nginx "
        dnf install nginx -y &>> $LOG_FILE
        VALIDATE "nginx" $?
fi
 
 
