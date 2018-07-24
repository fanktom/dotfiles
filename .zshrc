# start ssh-agent if not running
if [[ "$SSH_AGENT_PID" == "" ]]; then
		eval `ssh-agent`
		ssh-add ~/.ssh/tommy
fi

# oh-my-zsh
export ZSH=/home/tommy/.oh-my-zsh
ZSH_THEME="robbyrussell"
source $ZSH/oh-my-zsh.sh

# ruby
export PATH=/home/tommy/.gem/ruby/2.5.0/bin:$PATH

# yarn
export PATH=/home/tommy/.yarn/bin:$PATH

# last dir
function cd {
  builtin cd $@
  pwd > ~/.last_dir
}
if [ -f ~/.last_dir ]
	then cd `cat ~/.last_dir`
fi

# ls
alias l="ls -lah --group-directories-first"
alias ll="ls -lh --group-directories-first"
export LS_COLORS='di=1;34:fi=37:ln=96:pi=34:so=34:bd=34:cd=34:or=31:mi=0:ex=32:'

# ssh TERM
export TERM=xterm-256color

# config
export EDITOR='nvim'
alias e='nvim'
alias erc='nvim $HOME/.config/nvim/init.vim'

# vifm
bindkey -s '^f' 'vifm .\n'
bindkey -s '^e' '^x^e'

# env
export GTK2_RC_FILES=$HOME/.gtkrc-2.0
export GTK_THEME=Adapta-Nokto
export GDK_DPI_SCALE=2

# go
export PATH=~/go/bin:$PATH

# QT
QT_STYLE_OVERRIDE=GTK+

# direnv
eval "$(direnv hook zsh)"

# network
function netctl-home {
  sudo netctl stop-all && sudo netctl start home
}
function netctl-wire {
  sudo netctl stop-all && sudo netctl start wire
}
function netctl-eduroam {
  sudo netctl stop-all && sudo netctl start eduroam
}

function netctl-stop {
  sudo netctl stop-all
}

# displays
function xrandr-off {
  xrandr --output DP1-1 --off
  xrandr --output DP1 --off
}
function xrandr-top {
  xrandr --output DP1-1 --auto --above eDP1
}
function xrandr-mirror { 
  xrandr --output DP1 --auto --same-as eDP1
}

# sd-card
alias mount-sd='sudo mount -o umask=0,uid=nobody,gid=nobody /dev/mmcblk0p1 /mnt/sd'
alias umount-sd='sudo umount /mnt/sd'

# vpn
function vpnctl {
  sudo systemctl $1 openvpn-client@$2
}

# lang
export LC_ALL="en_US.UTF-8"

# private
source $HOME/.zshrc-private
