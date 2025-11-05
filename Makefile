
alacritty-ubuntu:
	mkdir -p ${HOME}/programs
	sudo apt install cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3
	git clone https://github.com/alacritty/alacritty
	cd alacritty && cargo build --release --no-default-features --features=x11
	sudo cp ./alacritty/target/release/alacritty /usr/local/bin/alacritty
	sudo cp ./alacritty/extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
	sudo tic -xe alacritty,alacritty-direct ./alacritty/extra/alacritty.info
	sudo desktop-file-install alacritty/extra/linux/Alacritty.desktop
	sudo update-desktop-database
