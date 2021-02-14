# Test snippets

read -p 'Git URL: ' giturl
projectname=$(echo $(echo ${giturl##*/}) | cut -d'.' -f 1)
echo 'Project Name: ' $projectname
