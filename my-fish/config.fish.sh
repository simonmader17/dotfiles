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

export PATH="$HOME/.local/bin:$PATH"

# On Startup
# wal -R && clear
wal -R -q
bash ~/.fonts/*.sh

# My Aliases
alias mv='mv -i'
alias rm='rm -i'
alias cp='cp -i'

alias ls='exa -al --color=always --group-directories-first'
alias la='exa -a --color=always --group-directories-first'
alias ll='exa -l --color=always --group-directories-first'
alias lt='exa -aT --color=always --group-directories-first'

alias cat='batcat --paging=never --style=grid'
