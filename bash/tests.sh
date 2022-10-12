#!/bin/bash
# This is a script to practice doing testing in bash scripts

# This section demonstrates file testing

# Test for the existence of the /etc/resolv.conf file
# TASK 1: Add a test to see if the /etc/resolv.conf file is a regular file
# TASK 2: Add a test to see if the /etc/resolv.conf file is a symbolic link
# TASK 3: Add a test to see if the /etc/resolv.conf file is a directory
# TASK 4: Add a test to see if the /etc/resolv.conf file is readable
# TASK 5: Add a test to see if the /etc/resolv.conf file is writable
# TASK 6: Add a test to see if the /etc/resolv.conf file is executable

#test if it exits 
FILE=/etc/resolv.conf
if test -e "$FILE"; then
     echo "/etc/resolv.conf exits"
else
     echo "/etc/resolv.conf does not exit"
fi


#test if it is a regular file
FILE=/etc/resolv.conf
if test -f "$FILE"; then
     echo "/etc/resolv.conf is a regular file"
else
     echo "/etc/resolv.conf is not a regular file"
fi

#test if it is a symbolic file
FILE=/etc/resolv.conf 
   if test -h "$FILE"; then
      echo "/etc/resolv.conf is a symbolic link"
   else
      echo "/etc/resolv.conf is not a symbolic link."
fi

#test if it is a directory
FILE=/etc/resolv.conf 
   if test -d "$FILE"; then
      echo "/etc/resolv.conf is a directory"
   else
      echo "/etc/resolv.conf is not a directory."
fi

#test if it readable
FILE=/etc/resolv.conf 
   if test -r "$FILE"; then
      echo "/etc/resolv.conf is readable"
   else
      echo "/etc/resolv.conf is not readable."
fi

#test if it is writeable
FILE=/etc/resolv.conf 
   if test -w "$FILE"; then
      echo "/etc/resolv.conf is writable"
   else
      echo "/etc/resolv.conf is not writable"
fi

#test if it is executable 
FILE=/etc/resolv.conf 
   if test -x "$FILE"; then
      echo "/etc/resolv.conf is executable"
   else
      echo "/etc/resolv.conf is not executable."
fi

# Tests if /tmp is a directory
# TASK 4: Add a test to see if the /tmp directory is readable
# TASK 5: Add a test to see if the /tmp directory is writable
# TASK 6: Add a test to see if the /tmp directory can be accessed

#test if /tmp is a directoy
FILE=/tmp
   if test -d "$FILE"; then
      echo "/tmp is a directory"
   else
      echo "/tmp is not a directory."
fi

#test if /tmp is readable
FILE=/tmp
   if test -r "$FILE"; then
      echo "/tmp is readable"
   else
      echo "/tmp is not readable."
fi

#test if tmp is writeable
FILE=/tmp
   if test -w "$FILE"; then
      echo "/tmp is writable"
   else
      echo "/tmp is not writable."
fi

#test if ?tmp can be accessed
FILE=/tmp
   if test -x "$FILE"; then
      echo "/tmp can be accessed."
   else
      echo "/tmp can not be accessed."
fi



# Tests if one file is newer than another
# TASK 7: Add testing to print out which file newest, or if they are the same age
if [ /etc/hosts -nt /etc/resolv.conf ]; then 
  echo "/etc/hosts is newer than /etc/resolv.conf"
fi

if [ /etc/hosts -ot /etc/resolv.conf ]; then
  echo "/etc/resolv.conf is newer than /etc/hosts"
else
  echo'/etc/resolv.conf is older than /etc/hosts'
fi

if [ ! /etc/hosts -nt /etc/resolv.conf -a ! /etc/hosts -ot /etc/resolv.conf ]; then
   echo "/etc/hosts is the same age as /etc/resolv.conf"
else
   echo "/etc/hosts is not the same age as /etc/resolv.conf."
fi


# this section demonstrates doing numeric tests in bash

# TASK 1: Improve it by getting the user to give us the numbers to use in our tests
# TASK 2: Improve it by adding a test to tell the user if the numbers are even or odd
# TASK 3: Improve it by adding a test to tell the user is the second number is a multiple of the first number

#task1 ask user to enter 2 numbers
echo "enter two numbers:"
read firstNumber
read secondNumber

[ $firstNumber -eq $secondNumber ] && echo "The two numbers are the same"
[ $firstNumber -ne $secondNumber ] && echo "The two numbers are not the same"

[ $firstNumber -lt $secondNumber ] && echo "The first number is less than the second number"
[ $firstNumber -gt $secondNumber ] && echo "The first number is greater than the second number"

[ $firstNumber -le $secondNumber ] && echo "The first number is less than or equal to the second number"
[ $firstNumber -ge $secondNumber ] && echo "The first number is greater than or equal to the second number"

#test if the numbers are even or odd
if [ $(($firstNumber%2)) -eq 0 ];then
   echo "$firstNumber is even"
else
   echo "$firstNumber is odd"
fi

if [ $(($secondNumber%2)) -eq 0];then 
   echo "$secondNumber is even."
else
   echo "$secondNumber is odd."
fi

#test if the second number is a multiple of the first number 
[ $secondNumber/$firstNumber -eq 0] && echo "the second number is a multiple of the first number."




# This section demonstrates testing variables

# Test if the USER variable exists
# TASK 1: Add a command that prints out a labelled description of what is in the USER variable, but only if it is not empty
# TASK 2: Add a command that tells the user if the USER variable exists, but is empty
[ -v USER ] && echo "The variable SHELL exists"

#task 1 print the variable 
echo $USER


#Task2 if the variable is empty
if [ -z "$USER" ]
then
   echo "\$USER is empty"
else
   echo "\$USER is not empty"
fi



# Tests for string data
# TASK 3: Modify the command to use the != operator instead of the = operator, without breaking the logic of the command
# TASK 4: Use the read command to ask the user running the script to give us strings to use for the tests
a=1
b=01
[ $a = $b ] && echo "$a is alphanumerically equal to $b" || echo "$a is not alphanumerically equal to $b"

#task 3
a=1
b=01
[ $a != $b ] && echo "$a is not alphanumerically equal to $b" || echo "$a is alphanumerically equal to $b"

#task 4
read -p "please enter some data: "

