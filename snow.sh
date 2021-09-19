
#!/bin/bash

LINES=$(tput lines)
COLUMNS=$(tput cols)

declare -A snowflakes
declare -A lastflakes
 
clear

function move_flake() {    

i="$1"
 
if [ "${snowflakes[$i]}" = "" ] || [ "${snowflakes[$i]}" = "$LINES" ]; then
snowflakes[$i]=0
else
if [ "${lastflakes[$i]}" != "" ]; then
printf "\033[%s;%sH \033[1;1H " ${lastflakes[$i]} $i
fi
fi
 
printf "\033[%s;%sH*\033[1;1H" ${snowflakes[$i]} $i
 
lastflakes[$i]=${snowflakes[$i]}
snowflakes[$i]=$((${snowflakes[$i]}+1))
}
 
while [ "$ans" != "q" ]
do
    
 i=$(($RANDOM % $COLUMNS))
 
 move_flake $i

 for x in "${!lastflakes[@]}"
 do
  move_flake "$x"
 done
 echo "Type 'q' to quit and go back to the main menu."
 read -sn 1 -t 0.1 ans
 clear
 done
