export EDITOR='vim'
export CVS_RSH='ssh'
export CDPATH='.:/home/mike/Desktop:/var/www/sites:/usr/src:~'

alias ap='sudo apt-get update;sudo apt-get -uf dist-upgrade'

if [ -e ${HOME}/bin/rake-completion.rb} ]; then 
  complete -C ${HOME}/bin/rake-completion.rb -o default rake
fi
export LESS='-R -M -X -F'
alias grep='grep --colour=auto'

#set -o vi
#bind '"\t":menu-complete'


# Only hippies allowed
# if [ "${HOSTNAME}" == 'dirtyhippie' ]; then
#   keychain ~/.ssh/id_dsa ~/.ssh/id_rsa
#   source ~/.keychain/$(hostname)-sh
#   export VISUAL='gvim -f'
# fi