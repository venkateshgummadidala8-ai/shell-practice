#!/bin/bash

USERID=$(id -u)

# check root access or not
if [ $USERID -ne 0 ]; then
    echo "please run the script with root access"
    exit 1
fi   

# echo " i am continuing ....."
dnf list install mysql

if [ $? -ne 0 ]; then 
    echo " mysql is already installed .....skipping"
else
    echo " installing mysql "
    dnf install mysql -y


    if [ $? -ne 0 ]; then 
        echo " Installing mysql is failed "
        exit 1
    else 
        echo "mysql istalled succesfully"
    fi
fi    



