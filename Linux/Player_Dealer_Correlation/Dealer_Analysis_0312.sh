#!/bin/bash
grep 05 0312_Dealer_schedule | grep AM | awk -F" " '{print $5,$6}' >> Notes_Dealer_Analysis_0312
grep 08 0312_Dealer_schedule | grep AM | awk -F" " '{print $5,$6}' >> Notes_Dealer_Analysis_0312
grep 02 0312_Dealer_schedule | grep PM | awk -F" " '{print $5,$6}' >> Notes_Dealer_Analysis_0312
grep 08 0312_Dealer_schedule | grep PM | awk -F" " '{print $5,$6}' >> Notes_Dealer_Analysis_0312
grep 11 0312_Dealer_schedule | grep PM | awk -F" " '{print $5,$6}' >> Notes_Dealer_Analysis_0312
cat  Notes_Dealer_Analysis_0312 >> Dealer_working_during_losses
wc -l Notes_Dealer_Analysis_0312 >> Dealer_working_during_losses
