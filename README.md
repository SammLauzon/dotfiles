# Dotfiles
All configuration to share across multiple setups.

## Pre requisites

### Main piece of SW
- [ZSH](https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH) shell
- [Starship](https://starship.rs/) for command prompt
- [Tmux](https://github.com/tmux/tmux/wiki) for session multiplexer
- [Neovim](https://neovim.io/) as your IDE
- [Pyenv](https://github.com/pyenv/pyenv) for you virtual environment management and python versions
- [Alacritty](https://github.com/alacritty/alacritty) as your terminal emulator

### Addtional command line tools
- [Bat](https://github.com/sharkdp/bat) to replace cat
- [Eza](https://github.com/eza-community/eza) to replace ls
- [Ranger](https://github.com/ranger/ranger) as your file finder
- [Fzf](https://github.com/junegunn/fzf) because fzf is fzf
    - Add the [fzf zsh plugin](https://github.com/unixorn/fzf-zsh-plugin) too for wonderful completion!
- [Navi](https://github.com/denisidoro/navi) for cheat sheet directly in your terminal

## Installation
To sync all the configuration files, this repository uses [Gnu Stow](https://www.gnu.org/software/stow/manual/stow.html).

### Stow

To setup Stow in a nutshell:

`sudo apt install stow build-essential`

### Dotfiles

#### Installation

1. First clone this repository on your PC using: `git clone git@github.com:SammLauzon/dotfiles.git`
2. Then run `make` to install all configuration locally. Make sure to backup existing configs if desired since
they will be overwritten.

#### Uninstall
1. Simply run `make delete` to remove all symbolic link between this repository and your configuration.


