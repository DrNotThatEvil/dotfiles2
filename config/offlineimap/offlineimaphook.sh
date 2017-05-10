#!/bin/env bash
OLD_STAT_FILE='/home/wilvin/.new_mail_count_stat'
new_dir="$HOME/Mail/main/Inbox/new"
num_mail=$(ls $new_dir|wc -l)
message=""

if [ -e $OLD_STAT_FILE ]
then 
  OLD_STAT=`cat $OLD_STAT_FILE`
else
  OLD_STAT="nothing"
fi

if [[ $num_mail -gt 0 && "$OLD_STAT" != "$num_mail" ]];then
    for i in $new_dir/*;do
        message="$message\n$(grep -m1 '^From: ' $i|sed 's/From: //'|sed 's/ <[^>]*>//')\n$(grep -m1 '^Subject: ' $i|sed 's/Subject: //')\n"
    done
    aplay $HOME/.config/mutt/sounds/Incoming.wav &
    notify-send "New Mail" "$message" -t 5000 &  
    echo $num_mail > $OLD_STAT_FILE
fi
