#! /bin/bash

file=/root/phonebook-all

RED="\033[31m"
GREEN="\033[32m"
END="\033[0m"

function mailstat(){

mail="`awk '{print $6}' /root/phonebook-all | grep -oE "[@][a-z]+"`"
for i in $mail
do 
if grep "$i" /root/mail>/dev/null;
then
continue
else
echo "$i" >> /root/mail
fi
done
mailw
}

function mailw(){
catmail="`cat /root/mail`"
for i in $catmail
do
countmail="`grep -c "$i" /root/phonebook`"
echo -e "$i:$countmail"
done
}

function stat () {
city="`awk '{print $6}' /root/phonebook-all`"
for i in $city;
do
if grep $i /root/city > /dev/null;
then
continue
else
echo "$i" >> /root/city
fi
done
statw
}

function statw(){
citywi="`cat /root/city`"
}

function fmail () {
read mail
echo -e "`awk '{print $1 " " $2 " " $5}' phonebook-all | grep -i $mail ` \n "
}

function fphone () {
read phoneyfx
echo -e "`awk '{print $1 " " $2 " " $4}' phonebook-all | grep -E " $phoneyfx[0-9]+"` \n"
}

function flastname () {
read lastname
echo -e "`awk '{print $1 " " $2}' phonebook-all | grep -E $lastname` \n"
}

function fcity () {
read city
echo -e "`awk '{print $1 " " $2 " " $6}' phonebook-all | grep -Ei $city` \n"
}

function finds() {
echo -e "$GREEN 1.Find mail \n $END"
echo -e "$GREEN 2.Phone \n $END"
echo -e "$GREEN 3.Lastname \n $END"
echo -e "$GREEN 4.City \n $END"
echo -e "$GREEN 5.back \n $END"

read menu

case $menu in
1)
fmail
sleep 5
;;
2)
fphone
sleep 5
;;
3)
flastname
sleep 5
;;
4)
fcity
sleep 5
;;
esac
}

function menu1 () {
while true;
do
clear

echo -e "$GREEN 1.Staitic \n $END"
echo -e "$GREEN 2.Porivnynia \n $END"
echo -e "$GREEN 3.Mail Staitic \n $END"
echo -e "$GREEN 4.Find \n $END"
echo -e "$GREEN 5.exit \n $END"

read menu1


case $menu1 in
1)
 statw
;;
2)
;;
3)
 mailstat
;;
4)
 clear
 finds
;;
5)
 exit 0
;;

esac 
done
}

menu1
