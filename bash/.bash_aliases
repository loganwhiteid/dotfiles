alias ls="eza"
alias la="eza -a"
alias ll="eza -la"
alias llm="eza -lars=modified"
alias lld="eza -laD"
alias llf="eza -laf"

alias vim="nvim"
alias explore="cosmic-files &"
alias cu="cd .."
alias mkcd='{ IFS= read -r d && mkdir "$d" -p && cd "$d"; } <<<'
alias q="exit"
alias ..="cd .."
alias cls="clear"
alias gs="git status"
alias gaa="git add -A"
alias files="cosmic-files & disown"
alias night="systemctl suspend"

alias dash="tmux a -tdash"
alias tn='tmux new -t"$d"'
alias ta='tmux attach-session -t"$d"'

alias update='sudo apt update && sudo apt upgrade'

alias audio='systemctl --user restart wireplumber pipewire pipewire-pulse'

alias panel='pkill -f cosmic-panel'
