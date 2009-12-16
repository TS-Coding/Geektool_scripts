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
##	Version 0.3
##		Url Fix
##	Version 0.3.1
##		remote sed pipe
#####################################


#path where u save the picture
user="$HOME/Documents/GeektoolScripts/weather.jpg"

#default Yahoo site where u can get the right url (I coded it for °C)
#http://weather.yahoo.com
picture=$(curl --silent http://ca.weather.yahoo.com/forecast/GMXX1144.html | grep '<div id="weather_icon"' | sed -e "s?.*url(??; s?).*??")

# download only if internet connection is available
if [ "$picture" != "" ]
then
	#download the picture
	curl --silent $picture -o $user
	
fi

#get temp
temp=$(curl --silent http://ca.weather.yahoo.com/forecast/GMXX1144.html | grep -A 1 'Feels Like:' | sed -e 's/.*<dd>//;s/&.*//;s?.*</dt>??')

# write 100 C if internet connection is not available 
if [ "$temp" == "" ]
then
	echo "100 C"
else
	echo Temperatur: $temp C	
fi