#1/bin/bash

##### special vars #########
echo "All the variables passed to the script: $@"
echo "Number of variables passed: $#"
echo "first variable: $1"
echo "second variable: $2"
echo "script name: $0"
echo "which directory: $PWD"
echo "what is the home directory: $HOME"
echo " PID of the current process: $$"
sleep 5 &
echo "PID of the background process command running just now: $!"
wait $!
echo "line number: "$LINENO"
echo"exit status of the last command: $?"


