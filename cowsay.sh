#!/bin/bash

##################################################
##
## COWSAY Random script
## Coded by: Tobias Schug
## E-mail: Tobiasschug@gmail.com
##
###################################################

#################
## Optionen
#################
options=( "-d" "-p" "-s" "-t" "-w" "-y") #6 Elemente
#44 Elemente
animals=("beavis.zen" "bong bud-frogs" "bunny cheese" "cower" "daemon" "default" "dragon" "dragon-and-cow" "elephant" "elephant-in-snake" "eyes" "flaming-sheep" "ghostbusters" "head-in" "hellokitty" "kiss" "kitty" "koala" "kosh" "luke-koala" "meow" "milk" "moofasa" "moose" "mutilated" "ren" "satanic" "sheep" "skeleton" "small" "sodomized" "stegosaurus" "stimpy" "supermilker" "surgery" "telebears" "three-eyes" "turkey" "turtle" "tux" "udder" "vader" "vader-koala" "www")

#################
## Random Zahlen
#################
randOptions=$(($RANDOM%6+1))
randAnimal=$(($RANDOM%44+1))

#################
## Futurama Sprüche von Slashdot
## Befehl von Commandlinefu
#################
spruch=$(curl --connect-timeout 2 -Is slashdot.org | egrep '^X-(F|B|L)' | cut -d \- -f 2)
testSpruch=$(echo $spruch | awk '{print $1}')

if [ "$testSpruch" = "" ]
	 then
	spruch="No internet connection...."
fi
#################
## Ausgabe
#################
aug= cowsay -f ${animals[$randAnimal]} ${options[$randOptions]} $spruch
echo $aug