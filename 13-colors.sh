#!/bin/bash

USERID=$(id -u)
LOGS_DIR=/var/log/shell-script
LOGS_FILE="$LOGS_DIR/$0.log"
TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S" )
R=\e[31m
G=\e[32m
Y=\e[33m
B=\e[34m
M=\e[35m
0=\e[0m


# check root access or not
if [ $USERID -ne 0 ]; then
    echo "please run the script with root access"
    exit 1
fi   

# first arg -> what are you trying to install
# second arg -> Exit code
VALIDATE() {
    if [ $2 -ne 0 ]; then 
        echo -e " $TIMESTAMP [ERROR] Installing $1 is $R failed $0" | tee -a $LOGS_FILE
        exit 1
    else 
        echo -e " $TIMESTAMP [INFO] $1 installed $B succesfully" | tee -a $LOGS_FILE
    fi
}

for package in $@ #$@ will give all the arguments passed to the script
do 
    echo " installing $package "
    dnf list installed $package &>> $LOGS_FILE
    if [ $? -ne 0 ]; then
        dnf install $package -y &>> $LOGS_FILE
        VALIDATE "Installing $package" $?
    else
        echo -e " $TIMESTAMP [INFO] $package is already installed .... $Y skipping $0" | tee -a $LOGS_FILE
    fi
done