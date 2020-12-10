#!/bin/bash
grep 05 0310_Dealer_schedule | grep AM | awk -F" " '{print $5,$6}' >> Notes_Dealer_Analysis_0310
grep 08 0310_Dealer_schedule | grep AM | awk -F" " '{print $5,$6}' >> Notes_Dealer_Analysis_0310
grep 02 0310_Dealer_schedule | grep PM | awk -F" " '{print $5,$6}' >> Notes_Dealer_Analysis_0310
grep 08 0310_Dealer_schedule | grep PM | awk -F" " '{print $5,$6}' >> Notes_Dealer_Analysis_0310
grep 11 0310_Dealer_schedule | grep PM | awk -F" " '{print $5,$6}' >> Notes_Dealer_Analysis_0310
cat  Notes_Dealer_Analysis_0310 >> Dealer_working_during_losses
wc -l Notes_Dealer_Analysis_0310 >> Dealer_working_during_losses
