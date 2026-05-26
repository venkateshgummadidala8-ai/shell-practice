#!/bin/bash

USERID=$(id -u)

# check root access or not
if [ $USERID -ne 0 ]; then
    echo "please run the script with root access"
fi   

echo " i am continuing ....."
