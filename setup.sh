
# Run this script while you are in the dotfiles directory

# Install oh-my-zsh
if [ -d "$HOME/.oh-my-zsh" ]; then
    echo "oh-my-zsh already installed"
else
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi


# Get the absolute path of the script
SCRIPT=$(readlink -f "$0")
# Absolute path this script is in, thus /home/user/bin
SCRIPTPATH=$(dirname "$SCRIPT")
echo $SCRIPTPATH

# Create symbolic links
ln -s $SCRIPTPATH/.zshrc ~/.zshrc
echo .zshrc symlink created

ln -s $SCRIPTPATH/.vimrc ~/.vimrc
echo .vimrc symlink created

ln -s $SCRIPTPATH/.gitconfig ~/.gitconfig
echo .gitconfig symlink created