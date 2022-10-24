#!/bin/bash

for (( nb=2 ; nb != 14 ; nb++ ))
do
        role=$(head -n $nb Shell_Userlist.csv | tail -n 1 | cut -d , -f 5 | sed 's/ //g')
        user=$(head -n $nb Shell_Userlist.csv | tail -n 1 | cut -d , -f 2 | sed 's/ //g')-$(head -n $nb Shell_Userlist.csv | tail -n 1 | cut -d , -f 3 | sed 's/ //g')
	mdp=$(head -n $nb Shell_Userlist.csv | tail -n 1 | cut -d , -f 4  )
        sudo useradd $user -m
	echo "$user:$mdp" | sudo chpasswd 

        if [[ "$role" == *Admin* ]]; then

                sudo usermod -aG sudo $user

        fi

done
