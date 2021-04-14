#bash shortcuts
#---------------------------------------------------
alias openbash='open ~/.bash_profile'
alias loadprofile='source ~/.bash_profile'
alias newcci='bash ~/desktop/custom-scripts/ccitest.sh'




# CCI shortcuts
#---------------------------------------------------
alias easy_org='function _easy_org(){ cci org remove $1; cci org scratch dev $1 --default --days 10; cci flow run dev_org --org $1; cci flow run dev_data_apex --org $1; cci flow run community_setup --org $1; cci org browser $1; cci org info $1 };_easy_org'

alias new_org='function _new_org(){ cci org remove $1; cci org scratch dev $1 --default --days 10; cci flow run dev_org --org $1; cci flow run dev_data_apex --org $1; cci org browser $1; cci org info $1 };_new_org'


alias upgrade_all="brew update && brew upgrade && sfdx update"
alias org_default="cci org default $1"  					# Set a scratch org as a default
alias org_delete="cci org scratch_delete $1; cci org remove --org $1"  	# Commands to remove and clean up expired scratch orgs
alias org_deploy="cci flow run deploy_unmanaged"
alias org_info="cci org info $1"
alias org_launch="cci org browser $1 && cci org info $1"
alias org_list="cci org list"						# Displays a list of your scratch orgs
alias org_prune="cci org prune"
alias dxpush="cci task run dx_push"
alias gist="cci error gist"  						# Generate a gist to save error details. Great for debugging





# git shortcuts
#---------------------------------------------------
alias ammendCommit="git commit --ammend --no-edit"
alias undoCommit="git reset --soft HEAD@{0}" 				#resets the last commit
alias gb="git branch"
alias gc="git checkout"
alias gf="git fetch"
alias gp="git pull"
alias gs="git status"
alias gl="git log  pretty-format:'%h %ad [%an]  |  %s%d' --date=short"
alias gla="git log  pretty-format:'%h %ad [%an]  |  %s%d' --date=short --author=$1"
alias gitstash="git stash --include-untracked"




# sfdx shortcuts 
#---------------------------------------------------
alias sfdxclean='sfdx force:org:list --clean'
alias sfdxlist='sfdx force:org:list'
alias sfdxaliaslist='sfdx force:alias:list'
alias sfdxpush='sfdx force:source:push'
alias sfdxpull='sfdx force:source:pull'
alias sfdxrealias='sfdx alias:unset $1'

alias sfdxpassword='sfdx force:user:password:generate -u $1'




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
