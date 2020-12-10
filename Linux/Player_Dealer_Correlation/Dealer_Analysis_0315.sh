#!/bin/bash
grep 05 0315_Dealer_schedule | grep AM | awk -F" " '{print $5,$6}' >> Notes_Dealer_Analysis_0315
grep 08 0315_Dealer_schedule | grep AM | awk -F" " '{print $5,$6}' >> Notes_Dealer_Analysis_0315
grep 02 0315_Dealer_schedule | grep PM | awk -F" " '{print $5,$6}' >> Notes_Dealer_Analysis_0315
grep 08 0315_Dealer_schedule | grep PM | awk -F" " '{print $5,$6}' >> Notes_Dealer_Analysis_0315
grep 11 0315_Dealer_schedule | grep PM | awk -F" " '{print $5,$6}' >> Notes_Dealer_Analysis_0315
cat  Notes_Dealer_Analysis_0315 >> Dealer_working_during_losses
wc -l Notes_Dealer_Analysis_0315 >> Dealer_working_during_losses
