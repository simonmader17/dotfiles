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
wal -Rqe
bash ~/.fonts/*.sh

# My Aliases
source ~/my-configs/my-aliases/.aliases

# vim:ft=sh
