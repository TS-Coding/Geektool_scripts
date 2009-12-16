#!/bin/bash

#####################################
## 	Get External IP
##	Name:	Tobias Schug
##	Email:	Tobiasschug@gmail.com
##	Coded:	06.05.2009
##	Version 0.1
##		script runs perfect
#####################################

extern_ip_adress="$(curl --silent http://checkip.dyndns.org | sed -e 's?.*:??;s?</body>.*??')"

#if internet connection is not available (extern_ip_adress is empty)
if [ "$extern_ip_adress" == "" ]
then
	echo "External Ip: Unknown"
else
	echo "External Ip:"$extern_ip_adress 
fi