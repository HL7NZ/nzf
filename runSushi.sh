#!/bin/bash


sushi -o .
# on some dev environments use sushi fsh -o .
if [[ $? -eq 0 ]]
then

# create the 2 summary files extensions.xml & profiles.xml. Saves in both /input.. & /fsh/ig-data...

echo "Creating Profiles and extensions summary pages..."
../scripts/makeProfilesAndExtensions.js nzf

# echo "Making terminology summary"  
# temp ../scripts/makeTerminologySummary.js medtech

#echo "Making API summary"
#../scripts/makeCapabilityStatement.js medtech

# echo "Making examples"
# ../scripts/makeExamplePage.js nzf

# echo "Making NamingSystem summary"
# temp ../scripts/makeNamingSystemSummary.js medtech


else 
echo
echo
echo "There were errors so other scripts not run"
fi

