#!/bin/bash

#####################################
## 	HDD Usage
##	Name:	Tobias Schug
##	Email:	Tobiasschug@gmail.com
##	Coded:	03.11.2009
#####################################

df -h | grep disk0s2 | awk '{print "HDD: \nUsed:",$3,"of",$2, "-", $4, "available" }' | sed -e 's/Gi/Gb/g'
diskutil info disk0 | grep "SMART" | awk '{print $1":\t"$3}'