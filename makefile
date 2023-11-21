## Use make to create all symbolic links between .dotfiles and real file.
all:
	stow --verbose --target=$$HOME --restow */

## Use make delete in the repo to delete all symbolic between .dotfiles and real files.
delete:
	stow --verbose --target=$$HOME --delete */
