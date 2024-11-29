# Dotfiles
All configuration to share across multiple setups.

## Installation
To sync all the configuration file, this repository uses [Gnu Stow](https://www.gnu.org/software/stow/manual/stow.html).

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


