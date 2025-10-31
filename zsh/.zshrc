# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='vim'
else
    export EDITOR='nvim'
fi

eval "$(starship init zsh)"
export STARSHIP_CONFIG=~/.config/starship/starship.toml

# You may need to manually set your language environment
export LANG=en_US.UTF-8

export EDITOR='~/.local/squashfs-root/usr/bin/nvim'

# Alias for pretty
alias la=tree
alias bat=batcat
alias cat=bat

# Custom alias
alias w_shared='cd ${W_SHARED}'
alias craken-local='craken --gui --api --remote-master-address 192.168.1.100'
alias rpi-local='ssh -X test@192.168.1.100'
sshRpi() {
    ssh -X test@10.0.120."$1"
}
alias nvim='~/.local/squashfs-root/usr/bin/nvim'

# Git
alias gc="git commit -m"
alias gca="git commit -a -m"
alias gp="git push origin HEAD"
alias gpf="git push -f"
alias gpu="git pull origin"
alias gst="git status"
alias glog="git log --graph --topo-order --pretty='%w(100,0,6)%C(yellow)%h%C(bold)%C(black)%d %C(cyan)%ar %C(green)%an%n%C(bold)%C(white)%s %N' --abbrev-commit"
alias gdiff="git diff"
alias gco="git checkout"
alias gb='git branch'
alias gba='git branch -a'
alias gadd='git add'
alias ga='git add -p'

# Dirs
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."

alias cl='clear'

# Eza
alias l="eza -l --icons --git -a --total-size"
alias lt="eza --tree --level=2 --long --icons --git --total-size"

# FZF
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPTS="--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"

# autocompletion
# Reevaluate the prompt string each time it's displaying a prompt
autoload -U compinit; compinit
source /home/samuel/.oh-my-zsh/custom/plugins/fzf-tab/fzf-tab.plugin.zsh
# disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false
# set descriptions format to enable group support
# NOTE: don't use escape sequences here, fzf-tab will ignore them
zstyle ':completion:*:descriptions' format '[%d]'
# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# force zsh not to show completion menu, which allows fzf-tab to capture the unambiguous prefix
zstyle ':completion:*' menu no
# preview directory's content with eza when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'
# switch group using `<` and `>`
zstyle ':fzf-tab:*' switch-group '<' '>'

# Popup in tmux
zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup
# apply to all command
zstyle ':fzf-tab:*' popup-min-size 50 8
# only apply to 'diff'
zstyle ':fzf-tab:complete:diff:*' popup-min-size 80 12

zstyle ':fzf-tab:*' group-colors $FZF_DEFAULT_OPTS
zstyle ':fzf-tab:*' fzf-flags $(echo $FZF_DEFAULT_OPTS)

function ranger {
	local IFS=$'\t\n'
	local tempfile="$(mktemp -t tmp.XXXXXX)"
	local ranger_cmd=(
		command
		ranger
		--cmd="map Q chain shell echo %d > "$tempfile"; quitall"
	)

	${ranger_cmd[@]} "$@"
	if [[ -f "$tempfile" ]] && [[ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]]; then
		cd -- "$(cat "$tempfile")" || return
	fi
	command rm -f -- "$tempfile" 2>/dev/null
}
alias rr='ranger'

# navigation
cx() { cd "$@" && l; }
fcd() { cd "$(find . -type d -not -path '*/.*' | fzf)" && l; }
f() { echo "$(find . -type f -not -path '*/.*' | fzf)" | pbcopy }
fv() { nvim "$(find . -type f -not -path '*/.*' | fzf)" }


# VENV
export PROJECT_HOME=$HOME/src/work


# Bat
export BAT_THEME="zenburn"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Pythonpath
export PYTHONPATH=${PYTHONPATH}:${PROJECT_HOME}/kts_robot/tests_libraries:${PROJECT_HOME}/kts_robot/tests_libraries/tests_libraries/libraries/kortex_libraries/codebeamer:${PROJECT_HOME}/kts_robot/tests_linters:${PROJECT_HOME}/kts_robot/etc/codebeamer

# Handy variables
export CB_USER="slauzon"
export W_SHARED="/run/user/1001/gvfs/smb-share:server=10.0.0.10,share=operations"

# nvim
export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Autoswitch for venv.
source ~/.local/bin/scripts/venv_switcher.sh

cd() {
    if (( $# == 0 )); then
       builtin cd                # This calls the shell version of cd
    else
       builtin cd "$@"           # This calls the shell version of cd
    fi
    source ~/.local/bin/scripts/venv_switcher.sh
}
export PATH=~/.npm-global/bin:$PATH

. "$HOME/.local/bin/env"

# zsh
eval "$(navi widget zsh)"
