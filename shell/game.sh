#!/bin/bash

set_point(){
	echo -e "\033[${1};${2}H[]"
}

cle_point(){
	echo -e "\033[${1};${2}H      "
}


block_O_S(){
	x=$1
	y=$2
	set_point $x $y
	let "x=x+1"
	set_point $x $y
	let "y=y+2"
	set_point $x $y
	let "x=x-1"
	set_point $x $y
}

block_O_C(){
	x=$1
	y=$2
	cle_point $x $y
}


block_O_Dow(){
	x=$1
	y=$2
	block_O_C $x $y
	let "x=x+1"
	block_O_S $x $y	
}

block_L(){
	x=$1
	y=$2
	set_point $x $y
	let "x=x+1"
	set_point $x $y
	let "x=x+1"
	set_point $x $y
	let "y=y+2"
	set_point $x $y
}


i=1
j=20

time=c
echo -e "\033[2J"
echo game start...

block_O_Dow $i $j

while(( $i<20))
do
#	sleep 1
	time=1
	read -s -t 1 -n1 time

	if [ $time = "a" ]
	then
		let "j=j-2"
	fi

	let "i=1+i"
	block_O_Dow $i $j
done

echo "end"


