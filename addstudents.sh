#!/bin/bash

STUDNUM=30

rm studusers.txt

for ((idx=0; idx<STUDNUM; idx+=1))
  do
    studuser="mibastud$idx"
    studpasswd=$(openssl rand -hex 4)
    useradd $studuser -m -G mibastudents -s /bin/bash
    echo "$studuser:$studpasswd" | chpasswd
    ln -s /home/shared /home/$studuser
    ln -s /home/data /home/$studuser
    printf "user: %s password: %s\n" $studuser $studpasswd >> studusers.txt
  done

printf "\tnew $STUDNUM users created, see studusers.txt file\n"
