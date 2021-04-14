#!/bin/bash
# CumulusCI Project

# PREWORK: 
## Created git repo in GitHub
## VSCode is empty except the Terminal window

# run with:
# cd desktop/custom-scripts/
# newcci.sh

echo "New CumulusCI Project -----------------------------------------------------------------------"
read -p 'Dev Hub Org Alias or [CCIDevHub]: ' devhuborgalias
if [[ $devhuborgalias == "" ]]; then
    devhuborgalias="CCIDevHub"
fi
echo "Dev Hub Org Alias Name: $devhuborgalias"

read -p 'Git URL: ' giturl
projectname=$(echo $(echo ${giturl##*/}) | cut -d'.' -f 1)
echo 'Project Name: ' $projectname
read -p 'New Branch Name [dev]: ' branchname
if [[ $branchname == "" ]]; then
    branchname="dev"
fi
echo "New Branch Name: $branchname"

echo "Git: Cloning an Existing Repository ---------------------------------------------------------"
cd Github/practice/
git clone $giturl $projectname
cd $projectname/
code .  # should open this folder in VSCode
#code $projectname # might work?
#cd ..

echo "CumulusCI: Initializing Project -------------------------------------------------------------"
cci project init
echo "CumulusCI: Connecting Service ---------------------------------------------------------------"
sfdx force:config:set defaultdevhubusername=$devhuborgalias
cci service connect devhub --project

echo "Git: Creating New Branch [feature/op/$branchname] ------------------------------------------------------"
git branch feature/op/$branchname
git switch feature/op/$branchname
git add .
git commit -m 'Set up Project'
git push -u origin feature/op/$branchname
git log

echo "CumulusCI: Creating Dev Scratch Org [$projectname__dev] -------------------------------------------------------"
cci flow run dev_org --org dev
echo "SFDX: Set Default Org & Open -------------------------------------------------------"
sfdx force:config:set defaultusername=$projectname__dev
sfdx force:org:list
cci org browser dev
