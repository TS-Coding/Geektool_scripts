#!/bin/bash

#####################################
## 	Get Weather from Yahoo
##	Name:	Tobias Schug
##	Email:	Tobiasschug@gmail.com
##	Coded:	25.05.2009
##	Version 0.1
##		Funktion gegeben
##	Version 0.2
##		Unnötige Operationen verhindert
#####################################


#path where u save the picture
user="/Users/Tobias/Documents/GeekTool/weather.jpg"

#default Yahoo site where u can get the right url (I coded it for °C)
#http://weather.yahoo.com
picture=$(curl --silent http://weather.yahoo.com/Stuttgart-Germany/GMXX0128/forecast.html?unit=c | grep background:url | sed -e "s/.*url('//; s/').*//")

# download only if internet connection is available
if [ "$picture" != "" ]
then
	#download the picture
	curl --silent $picture -o $user
	
fi

#get temp
temp=$(curl --silent http://weather.yahoo.com/Stuttgart-Germany/GMXX0128/forecast.html?unit=c | grep 'Feels Like:' | sed -e 's/.*<dd>//;s/&.*//')

# write 100 C if internet connection is not available 
if [ "$temp" == "" ]
then
	echo "100 C"
else
	echo $temp C	
fi