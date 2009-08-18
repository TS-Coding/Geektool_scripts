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
# DISPLAY CPU BAR
#########################

function displayCPU() {
	
	for ((i=1; $i <= $normal_proz; i++))
		do
			balken=$balken"$zeichen"
	done

	for ((i=$normal_proz; $i < 10; i++))
		do
			balken=$balken"$zeichen_down"
	done

	balken=$balken"|>"
	
	echo $balken
}

#########################
# RAM
#########################

ram_used=$(top -l 1 | grep 'Phys' | sed -e 's/.*inactive, //;s/M.*//')
ram_uused=$(top -l 1 | grep 'Phys' | sed -e 's/.*used, //;s/M.*//')
ram_ges=$(system_profiler | grep "Memory: ")

temp_ram_ges=$[$ram_used+$ram_uused]
temp_ram_proz=$(echo "scale=2; $ram_used*100/$temp_ram_ges" | bc -l)
normal_prozRam=$(echo "scale=0; $temp_ram_proz/10" | bc -l)

#########################
# DISPLAY RAM BAR
#########################

function displayRAM() {
	
	for ((i=1; $i <= $normal_prozRam; i++))
		do
			balken=$balken"$zeichen"
	done

	for ((i=$normal_prozRam; $i < 10; i++))
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
#echo "Prozessor: "$proz "\nRam:" $ram_ges "Used:" $ram_used "Uused:" $ram_uused
echo "Ram:" $ram_ges "Used:" $ram_used "Uused:" $ram_uused
echo "CPU:" $(displayCPU) $proz
echo "RAM:" $(displayRAM) $temp_ram_proz% 
