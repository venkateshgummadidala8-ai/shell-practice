#!/bin/bash

USERID=$(id -u)

# check root access or not
if [ $USERID -ne 0 ]; then
    echo "please run the script with root access"
    exit 1
fi   

# echo " i am continuing ....."

echo " installing MySQL "
dnf install mysql -y

if [ $? -ne 0 ]; then 
    echo " Installing mysql is failed "
    ecit 1
else 
    echo "mysql istalled succesfully"
fi


