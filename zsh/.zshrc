#    ███████╗███████╗██╗  ██╗██████╗  ██████╗
#    ╚══███╔╝██╔════╝██║  ██║██╔══██╗██╔════╝
#      ███╔╝ ███████╗███████║██████╔╝██║     
#     ███╔╝  ╚════██║██╔══██║██╔══██╗██║     
# ██╗███████╗███████║██║  ██║██║  ██║╚██████╗
# ╚═╝╚══════╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝

stty -ixon # Disable ctrl-s and ctrl-q

# Change prompt
source ~/dotfiles/zsh/themes/sashimi-zsh-theme/sashimi.zsh-theme

# History
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history
setopt hist_ignore_all_dups

# Aliases
source ~/dotfiles/aliases/.aliases

# Basic auto/tab completions
autoload -U compinit && compinit
autoload -U bashcompinit && bashcompinit
_comp_options+=(globdots) # Include hidden files
zstyle ':completion:*' menu select
bindkey '^[[Z' reverse-menu-complete # Enable Shift+Tab in menu selection

# Load pywal theme
if [ "$TERM" != "xterm-kitty" ]; then
	/usr/bin/cat ~/.cache/wal/sequences
fi

# NordVPN automatically update polybar hook
nordvpn() {
	command nordvpn $@
	polybar-msg hook nordvpn 1 >/dev/null
}

# nvm
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# react-native
export ANDROID_SDK_ROOT="$HOME/Android/Sdk"
export PATH="$ANDROID_SDK_ROOT/emulator:$ANDROID_SDK_ROOT/platform-tools:$PATH"

# CHROME_PATH for marp
export CHROME_PATH="$(which brave-browser)"

# Go
export GOPATH="$HOME/.go"
export PATH="$GOPATH/bin:$PATH"

# change-theme completions
source ~/dotfiles/scripts/change-theme/change-theme-completions-bash.sh

################################################################################
# Plugins
################################################################################
	
# zsh-autosuggestions
source ~/dotfiles/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# zsh-autocomplete
source ~/dotfiles/zsh/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh
zstyle ':autocomplete:history-search-backward:*' list-lines 32

# zsh-vi-mode
source ~/dotfiles/zsh/plugins/zsh-vi-mode/zsh-vi-mode.zsh
function zvm_after_select_vi_mode() {
	# The vi mode indicator code below depends on my Sashimi zsh theme (loaded in line 9):
	# https://github.com/simonmader17/sashimi-zsh-theme
	case $ZVM_MODE in
		$ZVM_MODE_NORMAL)
			vi_mode_indicator="%B%{$fg[blue]%}[N]%{$reset_color%}"
			PROMPT='$vi_mode_indicator $(sashimi)'
			;;
		$ZVM_MODE_INSERT)
			vi_mode_indicator="%B%{$fg[green]%}[I]%{$reset_color%}"
			PROMPT='$vi_mode_indicator $(sashimi)'
			;;
		$ZVM_MODE_VISUAL)
			vi_mode_indicator="%B%{$fg[yellow]%}[V]%{$reset_color%}"
			PROMPT='$vi_mode_indicator $(sashimi)'
			;;
		$ZVM_MODE_VISUAL_LINE)
			vi_mode_indicator="%B%{$fg[yellow]%}[V]%{$reset_color%}"
			PROMPT='$vi_mode_indicator $(sashimi)'
			;;
		$ZVM_MODE_REPLACE)
			vi_mode_indicator="%B%{$fg[red]%}[R]%{$reset_color%}"
			PROMPT='$vi_mode_indicator $(sashimi)'
			;;
	esac
}
zvm_after_init_commands+=(zvm_after_select_vi_mode)
ZVM_CURSOR_STYLE_ENABLED=false
function init_other_plugins() {
	# Cycle through completion menu using Tab and Shift-Tab
	bindkey '\t' menu-select "$terminfo[kcbt]" menu-select
	bindkey -M menuselect '\t' menu-complete "$terminfo[kcbt]" reverse-menu-complete
}
zvm_after_init_commands+=(init_other_plugins)

# zsh-colored-man-pages
source ~/dotfiles/zsh/plugins/zsh-colored-man-pages/colored-man-pages.plugin.zsh

# zsh-syntax-highlighting (should be at the end of the config file)
source ~/dotfiles/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

################################################################################
# Greeting
################################################################################
greeting() {
	if [ $(($RANDOM % 2)) = 0 ]; then
		colorscript -r
	else
		if [ $(($RANDOM % 4096)) -gt 0 ]
		then pokemon-colorscripts -r
		else pokemon-colorscripts -r -s
		fi
	fi
}
if [ -f /usr/local/bin/greeting ]; then
	/usr/local/bin/greeting
else
	greeting
fi
