provision_base() {
    #Homebrew
    #--------
    ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go/install)"
    brew doctor

    #Git
    #---
    brew install git
    git config --global user.name "Cary Thomson"
    git config --global user.email cary.thomson@gmail.com
    git config --global core.editor subl
    git config --global credential.helper osxkeychain

    #Oh-my-zsh
    #---------
    git clone https://github.com/caryt/oh-my-zsh .oh-my-zsh
    cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
    cd ~/.oh-my-zsh
    git remote add upstream https://github.com/robbyrussell/oh-my-zsh
    chsh -s /bin/zsh
    exec zsh -l

}

provision_preferences() {
#Peference Settings
#Enable Remote Login (ssh)
sudo launchctl load -w /System/Library/LaunchDaemons/ssh.plist

# Enable tap to click (Trackpad) for this user and for the login screen
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# Show all filename extensions in Finder
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Show status bar in Finder
defaults write com.apple.finder ShowStatusBar -bool true

# Display full POSIX path as Finder window title
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# Add a spacer to the left side of the Dock (where the applications are)
defaults write com.apple.dock persistent-apps -array-add '{tile-data={}; tile-type="spacer-tile";}'
# Add a spacer to the right side of the Dock (where the Trash is)
defaults write com.apple.dock persistent-others -array-add '{tile-data={}; tile-type="spacer-tile";}'

for app in Finder Dock Mail Safari iTunes iCal Address\ Book SystemUIServer; do killall "$app" > /dev/null 2>&1; done
}

provision_applications() {
    #Brew Cask
    #---------
    brew update
    brew tap phinze/homebrew-cask
    brew install brew-cask

    #Applications
    #------------
    brew cask install alfred
    brew cask alfred link
    brew cask install macports
    brew cask install dropbox
    brew cask install google-chrome
    brew cask install google-drive
    brew cask install iterm2
    brew cask install sublime-text
    ln -s "/Applications/Sublime Text 2.app/Contents/SharedSupport/bin/subl" /usr/local/bin/subl
    brew cask install virtualbox
    brew cask install vagrant
    brew cask install jumpcut
    brew cask install flux
    brew cask install bartender
    brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json qlprettypatch quicklook-csv betterzipql webp-quicklook suspicious-package && qlmanage -r
}

provision_command_line_tools() {
    #Xcode and Command Line Tools
    #----------------------------
    #Install Command Line Tools (XCode | Open Developer Tool | More Developer Tools...)
    xcode-select --install
#Install Xcode from Apple Store
}

provision_python () {

    #Python
    #------
    brew install python
    pip install virtualenv
    pip install virtualenvwrapper
    source /usr/local/bin/virtualenvwrapper.sh
    mkdir -p $WORKON_HOME
    mkvirtualenv dev

    #Sphinx
    #------
    #pip install sphinx (Need 1.2b3 otherwise get errors with inheritance_diagrams).
    brew install wget
    cd ~/Downloads
    wget "https://pypi.python.org/packages/source/S/Sphinx/Sphinx-1.2b3.tar.gz#md5=10d0bffdf01f0eddd57b9e0af0623457"
    pip install Sphinx-1.2b3.tar.gz
}

provision_mac() {
    provision_base
    provision_preferences
    provision_applications
    provision_command_line_tools
    provision_python
}
