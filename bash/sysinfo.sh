#!/bin/bash

# the command that prints the information of the system

#first line prints host information
#second command prints operating system name and version
#third command prints IP address
#df command allows to print displayed as a human-friendly number

echo "
      FQDN: $(hostname)
      Host Information:
          Machine ID:$(hostnamectl)
      Ip address
      $(hostname -I)
      Root Filesystem Status:
      $(df /home) 
     "
 

exit

