# Updated to work with more than just LWC Exercises
# https://trailhead.salesforce.com/en/content/learn/modules/sfdx_app_dev/sfdx_app_dev_setup_dx
# https://developer.salesforce.com/docs/atlas.en-us.sfdx_dev.meta/sfdx_dev/sfdx_dev_scratch_orgs.htmyy

# run with:
# cd desktop/custom-scripts/
# newsfproject.sh

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

echo "SFDX: Creating a New Project with Manifest --------------------------------------------------"
sfdx force:project:create --projectname $projectname --manifest

echo "VSCode: Add SFDX Project Folder to Workspace ------------------------------------------------"
code --add $projectname
#cd $projectname # I think this is causing it to stall after git actions

echo "Git: Creating New Branch [feature/$branchname] ------------------------------------------------------"
git branch feature/$branchname
git switch feature/$branchname
git add .
git commit -m 'init'
git push -u origin feature/$branchname
git log

echo "SFDX: Authorizing Default Dev Hub Org -------------------------------------------------------"
sfdx force:auth:web:login -d -a $devhuborgalias -s
sfdx force:org:list
echo "SFDX: Creating Scratch Org ------------------------------------------------------------------"
sfdx force:org:create -f $projectname/config/project-scratch-def.json -s -a so_$projectname_$branchname -d 14
sfdx force:org:list
echo "SFDX: Opening Scratch Org -------------------------------------------------------------------"
sfdx force:config:set defaultusername=so_$projectname_$branchname
sfdx force:org:open

#echo "SFDX: Pushing Metadata ----------------------------------------------------------------------"
#sfdx force:source:push
#ERROR: This command is required to run from within an SFDX project.

#echo "Assigning permission set to your user..."
#sfdx force:user:permset:assign --permsetname Certification
#echo "Creating required users..."
#sfdx force:apex:execute -f EXFiles/data/CreateUsers.txt
#echo "Creating data using ETCopyData plugin"
#sfdx ETCopyData:import -c EXFiles/data --loglevel warn

# for scratch org LWC server
# sfdx force:lightning:lwc:start
