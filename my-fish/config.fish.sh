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
