# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
ZSH=/usr/share/oh-my-zsh/

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="af-magic"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)


# User configuration

# export MANPATH="/usr/local/man:$MANPATH"
export MANPAGER="/bin/sh -c \"col -b | vim --not-a-term -c 'set ft=man ts=8 nomod nolist noma' -\""
# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

#-------- Transmission CLI {{{
#------------------------------------------------------
# lightweight torrent daemon, has option for cli, webui, ncurses, and gui frontend 
# demo video: http://www.youtube.com/watch?v=ee4XzWuapsE
# WebUI:	http://localhost:9091/transmission/web/
# 		http://192.168.1.xxx:9091/transmission/web/
tor-clearcompleted() {
        transmission-remote -l | grep 100% | grep Done | \
        awk '{print $1}' | xargs -n 1 -I % transmission-remote -t % -r ;}
tor() { transmission-remote --list ;}
	# numbers of ip being blocked by the blocklist
	# credit: smw from irc #transmission
tor-count() { echo "Blocklist rules:" $(curl -s --data \
	'{"method": "session-get"}' localhost:9091/transmission/rpc -H \
	"$(curl -s -D - localhost:9091/transmission/rpc | grep X-Transmission-Session-Id)" \
	| cut -d: -f 11 | cut -d, -f1) ;}
# demo video: http://www.youtube.com/watch?v=TyDX50_dC0M
tor-blocklist() { $PATH_SCRIPTS/blocklist.sh ;}		# update blocklist
tor-daemon() { transmission-daemon ;}
tor-quit() { killall transmission-daemon ;}
tor-altspeedenable() { transmission-remote --alt-speed ;}	# limit bandwidth
tor-altspeeddisable() {	transmission-remote --no-alt-speed ;}	# dont limit bandwidth
tor-add() { transmission-remote --add "$1" ;}
tor-askmorepeers() { transmission-remote -t"$1" --reannounce ;}
tor-pause() { transmission-remote -t"$1" --stop ;}		# <id> or all
tor-start() { transmission-remote -t"$1" --start ;}		# <id> or all
tor-purge() { transmission-remote -t"$1" --remove-and-delete ;} # delete data also
tor-remove() { transmission-remote -t"$1" --remove ;}		# leaves data alone
tor-info() { transmission-remote -t"$1" --info ;}
tor-speed() { while true;do clear; transmission-remote -t"$1" -i | grep Speed;sleep 1;done ;}

# https://github.com/fagga/transmission-remote-cli
# demo video: http://www.youtube.com/watch?v=hLz7ditUwY8
tor-ncurse() { transmission-remote-cli ;}

#}}}


alias töö="xrandr --output DP2 --right-of eDP1 --auto"
alias tööoff="xrandr --output DP2 --off"
alias cal="cal -3m"
alias mkdir="mkdir -pv"
#
#
ZSH_CACHE_DIR=$HOME/.oh-my-zsh-cache
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi

source $ZSH/oh-my-zsh.sh


cd "$AUTOCD"

PATH="/home/erykroom/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/erykroom/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/erykroom/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/erykroom/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/erykroom/perl5"; export PERL_MM_OPT;



export PATH="/home/erykroom/anaconda3/bin:$PATH"
