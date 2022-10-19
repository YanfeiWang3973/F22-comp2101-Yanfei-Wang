#!/bin/bash

#using which command to see if we have lxd on the system already

which lxd >/dev/null
if [ $? -ne 0 ]; then
   #need to install lxd
   echo "installing lxd -enter your password"
   sudo snap install lxd
   if [ $? -ne 0 ]; then
      echo "faild to install lxd"
      exit 1
   fi
fi

#test if lxdbr0 interface exists
lxd init --auto

#launch a vm container
lxc launch images:ubuntu/20.04 COMP2101-F22

#list the running container
lxc list COMP2101-F22

#list the container information
#lxc info COMP2101-F22

