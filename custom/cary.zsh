#zsh customisations
ZSH_THEME="philips"
COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="mm/dd/yyyy"
plugins=(common-aliases)

source $ZSH/oh-my-zsh.sh

#CGit aliases
alias gs='git status '
alias ga='git add -A .'
alias gc='git commit -m '
alias gp='git push -u origin master'

#My PATH
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PATH
export PATH=/usr/local/bin:$PATH
export PIP_REQUIRE_VIRTUALENV=true
source /usr/local/bin/virtualenvwrapper.sh



