export EDITOR='vim'
export VISUAL='gvim -f'
export CVS_RSH='ssh'
export CDPATH='.:/home/mike/Desktop:/var/www/sites:/usr/src:~'

alias ap='sudo apt-get update;sudo apt-get -uf dist-upgrade'

if [ -e ${HOME}/bin/rake-completion.rb} ]; then 
  complete -C ${HOME}/bin/rake-completion.rb -o default rake
fi
alias less='less -R'
alias grep='grep --colour=auto'

#set -o vi
#bind '"\t":menu-complete'


if [ "${HOSTNAME}" == 'dirtyhippie' ]; then
  keychain ~/.ssh/id_dsa
  source ~/.keychain/$(hostname)-sh
fi

