export EDITOR='gvim -f'
export VISUAL='gvim -f'
export CVSROOT=':ext:mike@cvs.cavokintl.com/home/cvs'
export CVS_RSH='ssh'
export CDPATH='.:/home/mike/Desktop:/var/www/sites:/usr/src:~'
alias gi='sudo gem install --include-dependencies '
alias gl='sudo gem q -r '
alias ap='sudo apt-get update;sudo apt-get -uf dist-upgrade'

keychain ~/.ssh/id_dsa
source ~/.keychain/$(hostname)-sh

complete -C ${HOME}/bin/rake-completion.rb -o default rake
alias less='less -R'
alias grep='grep --colour=auto'

#set -o vi

#bind '"\t":menu-complete'

