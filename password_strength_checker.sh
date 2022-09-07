#!/bin/bash

#Author: Poshan Bhandari
#Date: Sept 2022
#Password strength Checker script

#checking for figlet
if [[ -z $(which figlet) ]]
then
	echo ""
else
	figlet  "Strength Checker"
fi


#Ask the user for password
read -s -p $'\e[1;32mHello there Enter your password: \e' pass

echo -e "\n\e[1;33m[+] Your password is $pass\n"

length=${#pass}

fail=0

#check the number of character,  uppercase, lowercase, number and symbol

while [[ $n -eq 0 ]]
do
	if [[ $length -lt 8 ]]
	then
        	echo -e "\e[1;31m[-] Your password is less than 8 character"
        	fail=$((fail+1))
	fi

	if [[ $(echo "$pass" | awk '/[A-Z]/') ]]
        	then
                	echo -e "\e[1;32m[+] Upper Case Checked and Pass"
        else
                echo -e "\e[1;31m[-] No Upper Case Found"
		fail=$((fail+1))
	fi

	if [[ $(echo "$pass" | awk '/[a-z]/') ]]
        	then
                	echo -e "\e[1;32m[+] Lower Case Checked and Pass"
        	else
                	echo -e "\e[1;31m[-] No Lower Case Found"
			fail=$((fail+1))
	fi


	if  [[ $(echo "$pass" | awk '/[0-9]/') ]] 
        	then
                	echo -e "\e[1;32m[+] Number Checked and Pass"
        	else
                	echo -e "\e[1;31m[-] No Number Found"
			fail=$((fail+1))
	fi


	if [[ $(echo "$pass" | awk '/[[:punct:]]/') ]]
        	then
                	echo -e "\e[1;32m[+] Symbol checked and Pass"
        	else
                	echo -e "\e[1;31m[-] No symbol marks found"
			fail=$((fail+1))
	fi
	if [[ $fail -ne 0 ]]
		then

			echo -e "\n\e[1;31mYour password doesn't meet $fail requirements Exiting............"
			exit 0
		else
			break
	fi
done

#After all the checks, cracklib checks the strength of password

echo -e "\e[1;36m\n\n**********Your password strength Report is generating*******"
sleep 1
echo  "$pass" | cracklib-check

echo -e "\e\n\n[1;32mThank you for using my script\n\n\n"




