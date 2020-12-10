#!/bin/bash
#grep $2 $1_Dealer_schedule | awk -F" " '{print $5, $6}'
sed 's/\.///' '{$2}' | sed 's/am/ am/' '{#2}' | sed 's/ dealer_finder_time2.tmp
#grep $1_Dealer_schedule | grep dealer_finder_time.tmp | awk -F" " '{print $5, $6}'
