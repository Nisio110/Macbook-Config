if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi
export BASH_SILENCE_DEPRECATION_WARNING=1
eval "$(/opt/homebrew/bin/brew shellenv)"
tmux new -s default
clear
# neofetch
