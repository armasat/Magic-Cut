#!/bin/bash

if [ "$1" = "help" ]
then
echo "Magic Cut is a auto clicker that adjusts to your mouse location."
echo
echo "argument 1 : minimum loop time"
echo "argument 2 : maximum loop time"
echo
echo "Example : # sh magicCut.sh \"1\" \"20\""
echo "    - would click every 1 to 20 seconds based off your mouse location";
echo "    - would click with a slight 0-1 range offset on the y and x for more random 'like' behavior";
exit
fi

if [ $# -ne 2 ]
then
echo 'incorrect arguments => arg1: min loop time | arg2: max loop time'
echo "use argument 'help' for more information"
exit;
fi

echo "Hover over the place to auto cut";
sleep 1;
echo '3';
sleep 1;
echo '2';
sleep 1;
echo '1';

while [ 1 ]
do
echo "chopping . . . ";
xCord=$(xdotool getmouselocation | cut -d " " -f1 | tail -c +3);
yCord=$(xdotool getmouselocation | cut -d " " -f2 | tail -c +3);
xCordOffset=$( sh ./getRand.sh );
yCordOffset=$( sh ./getRand.sh );
clickOffset=$( sh ./getRand.sh );
rnum=$( shuf -i $1-$2 -n1 );
modX=$(echo "$xCordOffset+$xCord" | bc)
modY=$(echo "$yCordOffset+$yCord" | bc)
echo "modX : $modX"
echo "modY : $modY"
echo "loop sleep time : $rnum";

#move mouse and click
xdotool mousemove $modX $modY;

xdotool click 1;
sleep $clickOffset;
xdotool click 1;

# sleep and loop
sleep $rnum;
done;
exit;
