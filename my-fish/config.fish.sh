#     __ _     _                        __ _
#    / _(_)___| |__     ___ ___  _ __  / _(_) __ _
#   | |_| / __| '_ \   / __/ _ \| '_ \| |_| |/ _` |
#   |  _| \__ \ | | | | (_| (_) | | | |  _| | (_| |
#   |_| |_|___/_| |_|  \___\___/|_| |_|_| |_|\__, |
#          __________                        |___/
#         /          \                                             (
#        /____________\                                           (\)
#         |:_:_:_:_:_|                                             ))
#         |_:_,--.:_:|                                          (\//   )
#         |:_:|__|_:_|                         _               ) ))   ((
#      _  |_   _  :_:|   _   _   _            (_)             ((((   /)\`
#     | |_| |_| |   _|  | |_| |_| |             o              \\)) (( (
#      \_:_:_:_:/|_|_|_|\:_:_:_:_/             .                ((   ))))
#       |_,-._:_:_:_:_:_:_:_.-,_|                                )) ((//
#       |:|_|:_:_:,---,:_:_:|_|:|                               ,-.  )/
#       |_:_:_:_,'     `,_:_:_:_|           _  o               ,;'))((
#       |:_:_:_/  _ | _  \_:_:_:|          (_O                   ((  ))
#  _____|_:_:_|  (o)-(o)  |_:_:_|--'`-.     ,--.                (((\'/
#   ', ;|:_:_:| -( .-. )- |:_:_:| ', ; `--._\  /,---.~           \`))
#  .  ` |_:_:_|   \`-'/   |_:_:_|.  ` .  `  /()\.__( ) .,-----'`-\((
#   ', ;|:_:_:|    `-'    |:_:_:| ', ; ', ; `--'|   \ ', ; ', ; ',')).,--
#  .  ` MJP ` .  ` .  ` .  ` .  ` .  ` .  ` .    .  ` .  ` .  ` .  ` .  `
#   ', ; ', ; ', ; ', ; ', ; ', ; ', ; ', ; ', ; ', ; ', ; ', ; ', ; ', ;

if status is-interactive
    # Commands to run in interactive sessions can go here
end

# On Startup
wal -R && clear
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
