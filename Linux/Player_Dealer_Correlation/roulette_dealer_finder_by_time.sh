#!/bin/bash
grep -i "$2" $1_Dealer_schedule | awk -F" " '{print $5, $6}'

# where time must input in this format: "xx:00:00 yy" 
# xx is the hour
# yy can be am, AM, pm, or PM
