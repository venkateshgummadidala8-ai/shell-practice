#!/bin/bash

USERID=$(id -u)

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
dnf list install mysql

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
        dnf install nginx -y
        VALIDATE "nginx" $?
fi
 
 

