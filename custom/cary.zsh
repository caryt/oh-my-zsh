#Git aliases
alias gs='git status '
alias ga='git add -A .'
alias gc='git commit -m '
alias gp='git push -u origin master'

#QuickLook
ql() {qlmanage -p "$@" >& /dev/null &}

#Finder / Terminal integration
alias filef='osascript -e "tell application \"SystemUIServer\" to return POSIX path of (choose file   default location POSIX file \"`pwd`\" with prompt \"`pwd`\")"'
alias folderf='osascript -e "tell application \"SystemUIServer\" to return POSIX path of (choose folder default location POSIX file \"`pwd`\" with prompt \"`pwd`\")"'
alias openf='open $(filef)'
alias editf='subl $(filef)'
alias llf='ll $(folderf)'
alias cdf='cd $(folderf)'
alias rmf='rm $(filef)'

#My PATH
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PATH
export PATH=/usr/local/bin:$PATH
export PIP_REQUIRE_VIRTUALENV=true
source /usr/local/bin/virtualenvwrapper.sh

#Shortcuts
docs=~/Documents
down=~/Downloads
bt=~/Documents/bt
omz=~/.oh-my-zsh
utensils=~/Documents/utensils

