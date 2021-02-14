#!/bin/bash
# CumulusCI Project

# run with:
# cd desktop/custom-scripts/
# newcci.sh

echo "Enter Project Details -----------------------------------------------------------------------"
read -p 'Git URL: ' giturl
projectname=$(echo $(echo ${giturl##*/}) | cut -d'.' -f 1)
echo 'Project Name: ' $projectname
read -p 'New Branch Name (no spaces): ' branchname
read -p 'Dev Hub Org Alias: ' devhuborgalias

echo "Git: Cloning an Existing Repository ---------------------------------------------------------"
cd /g/Google_Drive/GitHub/
git clone $giturl $projectname
cd $projectname
cd ..

#echo "Git: Creating New Branch [feature/$branchname] ------------------------------------------------------"
#git branch feature/$branchname
#git switch feature/$branchname
#git add .
#git commit -m 'init'
#git push -u origin feature/$branchname
#git log

#echo "SFDX: Authorizing Default Dev Hub Org -------------------------------------------------------"
#sfdx force:auth:web:login -d -a $devhuborgalias -s
#sfdx force:org:list
