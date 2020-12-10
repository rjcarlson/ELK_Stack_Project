#!/bin/bash
if $3 = 'blackjack'
then
grep -i "$2" $1_Dealer_schedule | awk -F" " '{print $3, $6}'
else 

if $3 = 'roulette'
then
grep -i "$2" $1_Dealer_schedule | awk -F" " '{print $5, $6}'
else
if $3 = 'texas_hold_em'
then
grep -i "$2" $1_Dealer_schedule | awk -F" " '{print $7, &8}' 
else
print "The log files searched do not contain the dealer for #3"
fi

# where time must input in this format: "xx:00:00 yy" 
# xx is the hour
# yy can be am, AM, pm, or PM
# game input blackjack, roulette, texas_hold_em to get results back
