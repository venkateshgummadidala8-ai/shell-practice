#!/bin/bash

USERID=$(id -u)
LOGS_DIR=/var/log/shell-script
LOG_FILE=" $LOGS_DIR/$0.log "
#all the logs will be stored in the logs-dir directory and in that directory logs-file is created for storing 
# $0 will give some name to .log file 

if [ $USERID -ne 0 ]; then
    echo "please run the script with root access"
    exit 1
fi   

# first arg -> what are you trying to install
# second arg -> Exit code
VALIDATE() {
    if [ $2 -ne 0 ]; then 
        echo " Installing $1 is failed " | tee -a $LOGS_FILE
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
 #### main 
 
