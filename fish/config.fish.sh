#                   ___
#    ___======____=---=)
#  /T            \_--===)
#  [ \ (O)   \~    \_-==)
#   \      / )J~~    \-=)
#    \\___/  )JJ~~~   \)
#     \_____/JJJ~~~~    \
#     / \  , \J~~~~~     \
#    (-\)\=|\\\~~~~       L__
#    (\\)  (\\\)_           \==__
#     \V    \\\) ===_____   \\\\\\
#            \V)     \_) \\\\JJ\J\)
#                        /J\JT\JJJJ)
#                        (JJJ| \UUU)
#                         (UU)

if status is-interactive
    # Commands to run in interactive sessions can go here
end

function fish_greeting
	fish_logo
end

set --export PATH "$HOME/.local/bin:$PATH"

# Set CHROME_EXECUTABLE for flutter
set --export CHROME_EXECUTABLE "/usr/bin/brave-browser"

# On Startup
# wal -R && clear
wal -Rqe
bash ~/.fonts/*.sh

# My Aliases
source ~/.config/aliases/.aliases

# NordVPN automatically update polybar hook
function nordvpn
	command nordvpn $argv
	command polybar-msg hook nordvpn 1 >> /dev/null
end

# Load nvm config
bass source ~/.nvm/nvm.sh

# vim:ft=sh

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# react-native
set --export ANDROID_SDK_ROOT "$HOME/Android/Sdk"
set --export PATH "$PATH:$ANDROID_SDK_ROOT/emulator"
set --export PATH "$PATH:$ANDROID_SDK_ROOT/platform-tools"

# CHROME_PATH for marp
set --export CHROME_PATH "/usr/bin/brave-browser"

# miniconda
set --export PATH "$HOME/miniconda3/bin:$PATH"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /home/simon/miniconda3/bin/conda
    eval /home/simon/miniconda3/bin/conda "shell.fish" "hook" $argv | source
end
# <<< conda initialize <<<

