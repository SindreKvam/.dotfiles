# README

## Windows

To use this file for vscode settings on windows, create a symbolic link to %appdata%/Code/User/

```
ni -i SymbolicLink -Path C:\Users\<username>\AppData\Roaming\Code\User\settings.json -Target C:\Users\<username>\dotfiles\vscode\settings.json
```

## MacOS

```
ln -s vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json
```
