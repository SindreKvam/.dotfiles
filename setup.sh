
# Run this script while you are in the dotfiles directory

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        echo "Linux"

elif [[ "$OSTYPE" == "darwin"* ]]; then
        # Mac OSX
        echo "Mac OSX"

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

        ln -s $SCRIPTPATH/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json
        echo vscode settings.json symlink created
	
	mkdir -p ~/.config/yabai/
	ln -s $SCRIPTPATH/yabai/yabairc ~/.config/yabai/yabairc
	echo yabairc symlink created

	mkdir -p ~/.config/skhd/
	ln -s $SCRIPTPATH/skhd/skhdrc ~/.config/skhd/skhdrc
	echo skhdrc symlink created

else
        echo "Unknown OS"
fi
