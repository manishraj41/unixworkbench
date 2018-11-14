#!/usr/bin/env bash
# File: guessinggame.sh.
function compare_real_guess {
	if [[ $2 =~ ^[0-9]+ ]]
	then
		if [[ $1 -eq $2 ]]
		then
			echo 0
		elif [[  $1 -gt $2 ]]
		then
			echo 2
		else
			echo -1
		fi
	else
		echo 9
	fi
}
function hint_for_guess {
	local text="Great guess!"
	if [[ $1 -eq -1 ]]
	then
		text="the guess was too high... pick a lower number!"
	elif [[ $1 -eq 2 ]]
	then
		text="the guess was too low... pick a higher number!"
	elif [[ $1 -eq 9 ]]
	then
		text="the number of files must be an integer"
	fi
	echo $text
}

files_in_dir=(*)
numfiles=${#files_in_dir[*]}
guessres=1

echo "   Program guessing-game"
echo "---------------------------"
echo " How many files are there in the current directory?" 

while [[ guessres -ne 0 ]]
do
	echo "Please enter your guess and press Enter"
	read numfguess
	guessres=$(compare_real_guess $numfiles $numfguess)
	text_instruct=$(hint_for_guess guessres)
	echo $text_instruct
done
