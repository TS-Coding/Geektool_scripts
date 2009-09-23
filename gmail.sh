#!/bin/bash

#####################################
## 	Google Mail Check
##	Name:	Tobias Schug
##	Email:	Tobiasschug@gmail.com
##	Coded:	06.05.2009
#####################################

gmail_name="Temp"
gmail_pass="password"

get_count_mail="$(curl --silent https://{$gmail_name}:{$gmail_pass}@mail.google.com/mail/feed/atom | grep 'fullcount' | sed -e 's?.*<fullcount>??;s?</fullcount>??')"

echo "New E-Mails (Gmail): "$get_count_mail
