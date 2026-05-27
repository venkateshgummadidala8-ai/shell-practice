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

for package in $@
do 
    echo " installing $package "


done