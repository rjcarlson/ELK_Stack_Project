#!/bin/bash
grep $2 $1_Dealer_schedule | awk -F" " '{print $5, $6}'
#grep $2 > dealer_finder_time.tmp
#sed 's/p.m./ pm/' dealer_finder_time.tmp
#cat $2
#sed 's/a.m./ am/' dealer_finder_time.tmp
#cat $2
#grep $1_Dealer_schedule | grep dealer_finder_time.tmp | awk -F" " '{print $5, $6}'
