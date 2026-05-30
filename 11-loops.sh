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

for package in $@ #$@ will give all the arguments passed to the script
do 
    echo " installing $package "
    dnf list installed $package
    if [ $? -ne 0 ]; then
        dnf install $package -y &>> $LOGS_FILE
        VALIDATE "Installing $package" $?
    else
        echo "$package is already installed ....skipping"
    fi
done