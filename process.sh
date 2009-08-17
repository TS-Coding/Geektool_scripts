#!/bin/bash

#####################################
## 	Get Diagramms for Process and Ram
##	Name:	Tobias Schug
##	Email:	Tobiasschug@gmail.com
##	Coded:	06.05.2009
##
##	Version 0.1
##			It's working
##	Version 0.2
##			Bug Fix, displaying CPU/Membar
##
#####################################

# GLOBAL VARS
zeichen="|"
zeichen_down="_"
balken="<|"

#########################
# CPU
#########################

proz=$(top -l 1| grep 'CPU' | sed -e 's/.*CPU usage: //;s/user.*//;s/PID.*//')
temp_normal_proz=$(echo $proz | sed -e 's/%//;s/\..*//')
normal_proz=$[$temp_normal_proz/10]

#########################
# RAM
#########################

ram_used=$(top -l 1 | grep 'Phys' | sed -e 's/.*inactive, //;s/M.*//')
ram_uused=$(top -l 1 | grep 'Phys' | sed -e 's/.*used, //;s/M.*//')

#ram_ges=$[$ram_used+$ram_uused]
ram_ges=$(system_profiler | grep "Memory: ")
normal_ram=$[$ram_used/200]

#########################
# DIAGRAM
#########################

function displayDia() {
	
	#CPU or RAM
	component=$1
	
	if [ $component = 1 ]
		then
			glob=$normal_proz		
		else
			glob=$normal_ram			
	fi

# Displaying CPU/MEM Bars
	
	for ((i=1; $i <= $glob; i++))
		do
			balken=$balken"$zeichen"
	done

	for ((i=$glob; $i < 10; i++))
		do
			balken=$balken"$zeichen_down"
	done

	balken=$balken"|>"
	
	echo $balken
}

#########################
## UPTIME
#########################

uptime=$(uptime | awk '{print $3" "$4" "$5}' | sed -e 's/,$//')

#########################
# Display all
#########################
echo "Uptime: "$uptime
echo "Prozessor: "$proz "\nRam:" $ram_ges "Used:" $ram_used "Uused:" $ram_uused
echo "CPU:" $(displayDia 1)
echo "RAM:" $(displayDia 0)
