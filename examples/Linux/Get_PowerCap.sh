#!/bin/bash

#    RESTful Interface Tool Sample Script for HPE iLO Products    #
#  Copyright 2014, 2020 Hewlett Packard Enterprise Development LP #

#  Description:  This is a sample bash script to return the       #
#         Power Cap setting on the host server.                   #

#        The power cap values are returned and received in Watts. #

# NOTE:  You will need to replace the USER_LOGIN and PASSWORD     #
#        and other values inside the quotation marks with values  #
#        that are appropriate for your environment.               #

#        Firmware support information for this script:            #
#            iLO 5 - All versions                                 #
#            iLO 4 - All versions.                                #

runLocal(){
  ilorest get PowerControl/PowerLimit --selector=Power. -u USER_LOGIN -p PASSWORD
  ilorest logout
}

runRemote(){
  ilorest get PowerControl/PowerLimit --selector=Power. --url=$1 --user $2 --password $3
  ilorest logout
}

error(){
  echo "Usage:"
  echo        "remote: Get_PowerCap.sh ^<iLO url^> ^<iLO username^>  ^<iLO password^>"
  echo        "local:  Get_PowerCap.sh"
}

if [ "$#" -eq "3" ]
then
  runRemote "$1" "$2" "$3"
elif [ "$#" -eq "0" ]
then
  runLocal
else
  error
fi
