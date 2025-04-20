# Configure the bash shell using Omakub defaults
[ -f "~/.bashrc" ] && mv ~/.bashrc ~/.bashrc.bak
cp ~/.local/share/omakub/configs/bashrc ~/.bashrc

# Load the PATH for use later in the installers
source ~/.local/share/omakub/defaults/bash/shell

[ -f "~/.inputrc" ] && mv ~/.inputrc ~/.inputrc.bak
[ -f "~/.inputrc" ] && mv ~/.Xmodmap ~/.Xmodmap.bak
[ -f "~/.inputrc" ] && mv ~/.gitconfig ~/.gitconfig.bak

# Configure the inputrc, gitconfig, and Xmodmap using the defaults
cp ~/.local/share/omakub/configs/inputrc ~/.inputrc
cp ~/.local/share/omakub/configs/gitconfig/.gitconfig
cp ~/.local/share/omakub/configs/Xmodmap ~/.Xmodmap

xmodmap "$HOME/.Xmodmap"
