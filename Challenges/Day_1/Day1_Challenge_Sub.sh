#!/bin/bash

#Task1 Shell script executes the commands line by line. The first line in the shell script is called Shebang which is an absolute path to bash interpreter.

#Task 2 Print message
echo "This is day1 challenge"

#Task 3 assign values to variables
var1="Hello"
var2="Everyone!!!!"

echo "Message from bash $var1 $var2"


#Task 4 input values 

echo "Please enter first number"
read num1

echo "Please enter second number"
read num2

echo "Sum of given two numbers is:" $(($num1 + $num2))


#Task 5 use built-in variables

echo "The current bash version is:" $BASH_VERSION
echo "Current user's home directory:" $HOME
echo "Name of the current host:" $HOSTNAME
echo "Current path variable content:" $PATH
echo "Current Directory:" $PWD



#Task 6 wildcards

echo "files with .extension in the current directory"

touch file_{1..3}.txt
ls *.txt