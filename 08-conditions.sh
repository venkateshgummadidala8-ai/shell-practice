#!/bin/bash
NUMBER=$1

# gt - greater than
# lt - less than
# ge - greater than or equal to
# le - less than or equal to

if [ $NUMBER -gt 10 ]; then
    echo "number is greater than 10"
elif [ $NUMBER -lt 10 ]; then
    echo "number is less than 10"
else
    echo "number is equal to 10"
fi

# elif is used to check multiple conditions, if we have only two conditions then we can use if else statement, but if we have more than two conditions then we can use elif statement
# else is used to execute a block of code if the condition is false, it is optional, we can use if statement without else statement, but if we want to execute a block of code when the condition is false then we can use else statement

#

    