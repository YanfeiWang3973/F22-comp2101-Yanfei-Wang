#!/bin/bash
#
# This script produces a dynamic welcome message
# it should look like
#   Welcome to planet hostname, title name!

# Task 1: Use the variable $USER instead of the myname variable to get your name
# Task 2: Dynamically generate the value for your hostname variable using the hostname command - e.g. $(hostname)
# Task 3: Add the time and day of the week to the welcome message using the format shown below
#   Use a format like this:
#   It is weekday at HH:MM AM.
# Task 4: Set the title using the day of the week
#   e.g. On Monday it might be Optimist, Tuesday might be Realist, Wednesday might be Pessimist, etc.
#   You will need multiple tests to set a title
#   Invent your own titles, do not use the ones from this example

###############
# Variables   #
###############
title="Overlord"
myname=$USER
hostname=$(hostname)
time=$(date +%r)
day=$(date +%a)
###############
# Main        #
###############
cat <<EOF

Welcome to planet $hostname, "$title $myname!"
It is $day at $time
EOF


if ((day == Sun)); then
  echo On $day I rest
elif ((day == Mon)); then
  echo On $day I work
elif ((day == Tue)); then
  echo On $day I walk my dog
elif ((day == Wed)); then
  echo On $day I have fun
elif ((day == Thu)); then
  echo On $day I drink coffee
elif ((day == Fri)); then
  echo On $day I leave work early
elif ((day == Sat)); then
  echo On $day I practice homework
fi
