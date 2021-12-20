source ~/regression.sh


#bash shortcuts
#---------------------------------------------------
alias openbash='open ~/.bash_profile'
alias refreshbash="source ~/.bash_profile && echo '** Refreshed **'"		# refresh the bash terminal with the new bash profile
alias newcci='bash ~/Github/practice/custom-scripts/newcci.sh'





# CCI shortcuts
#---------------------------------------------------

alias neworg="cci org scratch dev $1 --default --days 15"
alias flowrunhed="cci flow run install_hed"
alias flowrunrobot="cci flow run robot_org"
alias flowrunrobot="cci flow run robot_org_2gp"
alias flowrunqa="cci flow run qa_org"
alias flowrun2gp="cci flow run qa_org_2gp"
alias neworg_help="echo '**'; echo 'neworg <new-org-name>'; echo '**'"


#alias upgrade_all="brew update && brew upgrade && sfdx update && npm install -g npm"
alias upgrade_all="brew update && brew upgrade && npm update --global sfdx-cli && npm install -g npm"

alias org_default="cci org default $1"  						# Set a scratch org as a default
alias org_switch="cci org default $1 && cci org info $1 && cci org browser $1"

alias org_delete="cci org scratch_delete $1; cci org remove --org $1"  		# Commands to remove and clean up expired scratch orgs
alias org_info="cci org info $1"
alias org_launch="cci org browser $1 && cci org info $1"
alias org_list="cci org list"							# Displays a list of your scratch orgs
alias org_prune="cci org prune"
alias dxpush="cci task run dx_push"
alias gist="cci error gist"  							# Generate a gist to save error details. Great for debugging





# git shortcuts
#---------------------------------------------------
alias newbranch="git checkout $1 && git pull && git checkout -b $2 $1"
alias newbranch_help="echo '**'; echo 'newbranch <parent-branch> <new-branch>'; echo '**'"




# sfdx shortcuts 
#---------------------------------------------------
alias sfdxclean='sfdx force:org:list --clean'
alias sfdxlist='sfdx force:org:list'
alias sfdxaliaslist='sfdx force:alias:list'
alias sfdxpush='sfdx force:source:push'
alias sfdxpull='sfdx force:source:pull'
alias sfdxrealias='sfdx alias:unset $1'

alias userinfo='sfdx force:user:display'











# git completion
#---------------------------------------------------
source /Users/opastrana/git/git-completion.bash
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"




# add colors to bash
#---------------------------------------------------
PS1='\[\033[1;36m\]\u\[\033[1;31m\]@\[\033[1;32m\]\h:\[\033[1;35m\]\w\[\033[1;31m\]\$\[\033[0m\] '

#export CLICOLOR=1
#export LSCOLORS=GxFxCxDxBxegedabagaced




# jenv & Java settings
# get `jenv` installed: https://stackoverflow.com/a/47699905
# helpful: https://stackoverflow.com/questions/30413621/homebrew-cask-option-not-recognized
# also helpful: https://devqa.io/brew-install-java/
#---------------------------------------------------
if which jenv > /dev/null; then eval "$(jenv init -)"; fi
export PATH="$HOME/.jenv/shims:$PATH"

export JAVA_8_HOME=$(/usr/libexec/java_home -v1.8)
export JAVA_11_HOME=$(/usr/libexec/java_home -v11)

alias java8='export JAVA_HOME=$JAVA_8_HOME'
alias java11='export JAVA_HOME=$JAVA_11_HOME'

# default to Java 11
java11
