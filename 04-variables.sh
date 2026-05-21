#!/bin/bsh

echo "please enter your username"
read USER_NAME #here USER_NAME is a variable, whatever you enter in terminal stores in this variable

echo "username is $USER_NAME"

echo "please enter your password"
read -s PASSWORD #here -s is used to hide/silent the password when you type it in

echo "password is $PASSWORD"
