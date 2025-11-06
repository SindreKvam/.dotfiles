
alacritty-ubuntu:
	mkdir -p ${HOME}/programs 
	sudo apt install cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3
	cd ${HOME}/programs && git clone https://github.com/alacritty/alacritty
	cd ${HOME}/programs/alacritty && cargo build --release --no-default-features --features=x11
	sudo cp ${HOME}/programs/alacritty/target/release/alacritty /usr/local/bin/alacritty
	sudo cp ${HOME}/programs/alacritty/extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
	sudo tic -xe alacritty,alacritty-direct ${HOME}/programs/alacritty/extra/alacritty.info
	sudo desktop-file-install ${HOME}/programs/alacritty/extra/linux/Alacritty.desktop
	sudo update-desktop-database

jetbrains_nerd_font:
	mkdir -p ${HOME}/.fonts
	wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/JetBrainsMono.zip
	unzip JetBrainsMono.zip -d ${HOME}/.fonts
	rm -rf JetBrainsMono.zip
	fc-cache -fv
