#    ██████╗ ██████╗  ██████╗ ███████╗██╗██╗     ███████╗
#    ██╔══██╗██╔══██╗██╔═══██╗██╔════╝██║██║     ██╔════╝
#    ██████╔╝██████╔╝██║   ██║█████╗  ██║██║     █████╗  
#    ██╔═══╝ ██╔══██╗██║   ██║██╔══╝  ██║██║     ██╔══╝  
# ██╗██║     ██║  ██║╚██████╔╝██║     ██║███████╗███████╗
# ╚═╝╚═╝     ╚═╝  ╚═╝ ╚═════╝ ╚═╝     ╚═╝╚══════╝╚══════╝

# Environmental variables
export EDITOR="vim"
export TERMINAL="kitty"
export BROWSER="brave-browser"
export PDF_READER="zathura"

[ -f "$HOME/.device-specific-profile" ] && source "$HOME/.device-specific-profile"

# When running bash
[ -n "$BASH_VERSION" ] && [ -f "$HOME/.bashrc" ] && source "$HOME/.bashrc"

# When running zsh
[ -n "$ZSH_VERSION" ] && [ -f "$HOME/.zshrc" ] && source "$HOME/.zshrc" --no-greeting

# PATH stuff
[ -d "$HOME/bin" ] && PATH="$HOME/bin:$PATH"
[ -d "$HOME/.local/bin" ] && PATH="$HOME/.local/bin:$PATH"
