#!/bin/bash

# the command that prints the information of the system

#first line prints host information
#second command prints operating system name and version
#third command prints IP address
#df command allows to print displayed as a human-friendly number

#print out the headline
echo "Report for myvm
==============="

#print out the fully qualified domain name
echo "FQDN: $(hostname --fqdn)"

#print out opreating system name and verision 
source /etc/os-release 
echo "opreating system name and version: $PRETTY_NAME"

#print IP address 
echo "IP Address:  $(hostname -I | awk '{print $1}')"

#print out Root Filesystem Free Space
echo "Root Filesystem Free Space: $(du -h)"

#print the last line 
echo "==============="

exit

