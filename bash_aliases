export EDITOR='vim'
export CVS_RSH='ssh'
export CDPATH=".:${HOME}:${HOME}/ftw:${HOME}/collective:${HOME}/Desktop"

alias ap='sudo apt-get update;sudo apt-get -uf dist-upgrade'

if [ -e ${HOME}/bin/rake-completion.rb} ]; then 
  complete -C ${HOME}/bin/rake-completion.rb -o default rake
fi
export LESS='-R -M -X -F'
alias grep='grep --colour=auto'

#set -o vi
#bind '"\t":menu-complete'
