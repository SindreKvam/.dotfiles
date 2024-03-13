
# Path to ohmyzsh installation
export ZSH=~/.oh-my-zsh
# ZSH_THEME="robbyrussell"
ZSH_THEME="lambda"

CASE_SENSITIVE="true"


plugins=(git chucknorris) # zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh


source ~/.vimrc


# Add homebrew to path to use locally installed programs first
export PATH="/opt/homebrew/bin:$PATH"
