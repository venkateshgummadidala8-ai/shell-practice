#!/bin/bash

USERID=$(id -u)
LOGS_DIR=/var/log/shell-script
LOGS_FILE=" $LOGS_DIR/$0.log " #/home/ec2-user/shell-logs/10-logs.sh.log
#all the logs will be stored in the logs-dir directory and in that directory logs-file is created for storing 
# $0 will give some name to .log file 

if [ $USERID -ne 0 ]; then
    echo "please run the script with root access" | tee -a $LOGS_FILE
    exit 1
fi   

# first arg -> what are you trying to install
# second arg -> Exit code
VALIDATE() {
    if [ $2 -ne 0 ]; then 
        echo " Installing $1 is failed " | tee -a $LOGS_FILE
        exit 1
    else 
        echo "$1 installed succesfully" | tee -a $LOGS_FILE
    fi
}

# echo " i am continuing ....."
dnf list installed mysql &>> $LOGS_FILE

if [ $? -eq 0 ]; then 
    echo " mysql is already installed .....skipping" | tee -a $LOGS_FILE
else
    echo " installing mysql "
    dnf install mysql -y
    VALIDATE "mysql" $?
  
fi    


# install nginx
dnf list installed nginx &>> $LOGS_FILE 
   if [ $? -eq 0 ]; then
    echo " nginx is already installed...skipping " | tee -a $LOGS_FILE
      else 
        echo " installing nginx "
        dnf install nginx -y &>> $LOGS_FILE
        VALIDATE "nginx" $?
    fi
 
