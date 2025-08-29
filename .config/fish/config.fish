if status is-interactive
    # Commands to run in interactive sessions can go here
    source ~/.config/fish/lscolors.csh
    # export tide_pwd_bg_color=285940
    export tide_git_icon=\ue702
    export PATH="$PATH:$HOME/.scripts/bin"
    alias fastfetch='fastfetch -l "Aperture"'
    alias gst='git status'
    alias gpl='git pull'
    alias gco='git checkout'
    alias gcm='git commit -m'
    alias vim='nvim'
end
