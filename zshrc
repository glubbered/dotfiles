# Initialize colors.
autoload -U colors
colors
# Prompt support
autoload -U promptinit
promptinit
# Line editor
autoload edit-command-line;
zle -N edit-command-line

# filetype highlighting
eval `dircolors -b ~/dotfiles/dircolors`

# History {{{
# store 10000 entries in history
export HISTSIZE=10000
export SAVEHIST=$HISTSIZE
# history file
export HISTFILE="$HOME/.zhistory"
# prevent history from recording duplicate entries
setopt hist_ignore_all_dups
setopt hist_ignore_dups
# prevent particular entries from being recorded into a history by preceding them with at least one space
setopt hist_ignore_space
# write to the history file immediately, not when the shell exits.
setopt inc_append_history
# Share history between all sessions.
setopt share_history
# Do not write a duplicate event to the history file.
setopt hist_save_no_dups
# }}}

# cd without typing cd command
setopt autocd
# activate complex pattern globbing
setopt extended_glob
# include dotfiles in globbing
setopt glob_dots
# Append a trailing `/' to all directory names resulting from globbing
setopt mark_dirs
# Ignore lines prefixed with '#'.
setopt interactivecomments
# Don't kill background jobs when shell exits
setopt nohup
# avoid "beep"ing
setopt nobeep

# Completion {{{
#
# add custom completion scripts
fpath=(~/.zsh/completion $fpath)

# Enable tab-completion
autoload -U compinit
compinit

setopt complete_in_word    # complete from both ends of a word.
setopt always_to_end       # move cursor to the end of a completed word.
setopt path_dirs           # perform path search even on command names with slashes.
setopt auto_menu           # show completion menu on a succesive tab press.
setopt auto_list           # automatically list choices on ambiguous completion.
setopt auto_param_slash    # if completed parameter is a directory, add a trailing slash.
unsetopt menu_complete     # do not autoselect the first completion entry.
unsetopt flow_control      # disable start/stop characters in shell editor.

# use caching to make completion for cammands such as dpkg and apt usable.
zstyle ':completion::complete:*' use-cache on
zstyle ':completion::complete:*' cache-path "$home/.zcompcache"
# case insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-za-z}={a-za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
unsetopt case_glob
# graphical menu with arrows navigation
zstyle ':completion:*:*:*:*:*' menu select
# group enties by type
zstyle ':completion:*:matches' group 'yes'
# describe options in full
zstyle ':completion:*:options' description 'yes'
# zstyle ':completion:*:corrections' format ' %F{green}-- %d (errors: %e) --%f'
# zstyle ':completion:*:descriptions' format ' %F{yellow}-- %d --%f'
# zstyle ':completion:*:messages' format ' %F{purple} -- %d --%f'
# zstyle ':completion:*:warnings' format ' %F{red}-- no matches found --%f'
# zstyle ':completion:*:default' list-prompt '%S%M matches%s'
# zstyle ':completion:*' format ' %F{yellow}-- %d --%f'
# use the name of the tag as group name
zstyle ':completion:*' group-name ''
# provide verbose completion information
zstyle ':completion:*' verbose yes

# Fuzzy match mistyped completions.
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric

# Directories
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:*:cd:*' tag-order local-directories directory-stack path-directories
zstyle ':completion:*:*:cd:*:directory-stack' menu yes select
zstyle ':completion:*:-tilde-:*' group-order 'named-directories' 'path-directories' 'users' 'expand'
zstyle ':completion:*' squeeze-slashes true

# Kill
# show user processes
zstyle ':completion:*:*:*:*:processes' command 'ps -u $USER -o pid,user,comm -w'
# prettier menu
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;36=0=01'
# show menu with processes
zstyle ':completion:*:*:kill:*' menu yes select
# always show menu
zstyle ':completion:*:*:kill:*' force-list always

# ignore completion functions for commands you don't have
zstyle ':completion:*:functions' ignored-patterns '(_*|pre(cmd|exec))'

# }}}

# Prompt {{{

# Allow for functions in the prompt.
setopt prompt_subst

function parse_git_branch {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo " %F{108}⭠ %F{35}${ref#refs/heads/}"
}

# collapsed path
function get_pwd() {
  local pwd="${PWD/#$HOME/~}"

  if [[ "$pwd" == (#m)[/~] ]]; then
    echo $MATCH
    unset MATCH
  else
    echo "${${${(@j:/:M)${(@s:/:)pwd}##.#?}:h}%/}/${pwd:t}"
  fi
}

# Prompt depends on vim mode
PROMPT='%F{cyan}$(get_pwd)$(parse_git_branch) ${vim_mode}%f%k '

# }}}

# Vi mode {{{
bindkey -v

# Vi mode indication {{{
vim_ins_mode="%F{red}❯%F{green}❯%F{yellow}❯"
vim_cmd_mode="%F{red}❮%F{green}❮%F{yellow}❮"
vim_mode=$vim_ins_mode

function zle-keymap-select {
  vim_mode="${${KEYMAP/vicmd/${vim_cmd_mode}}/(main|viins)/${vim_ins_mode}}"
  zle reset-prompt
}
zle -N zle-keymap-select

function zle-line-finish {
  vim_mode=$vim_ins_mode
}
zle -N zle-line-finish
# }}}

# Bindings {{{
bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^r' history-incremental-search-backward
bindkey "^K" kill-whole-line
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line
bindkey -M vicmd "/" history-incremental-search-backward
bindkey -M vicmd "?" history-incremental-search-forward
bindkey -M vicmd v edit-command-line
# }}}

# }}}

# Directories stack {{{
setopt auto_pushd           # push the old directory onto the stack on cd.
setopt pushd_ignore_dups    # do not store duplicates in the stack.
setopt pushd_silent         # do not print the directory stack after pushd or popd.
setopt pushd_to_home        # push to home directory when no argument is given.
alias d='dirs -v'
for index ({1..9}) alias "$index"="cd +${index}"; unset index
# }}}

# consistent terminfo
export TERM=screen-256color
export EDITOR="vim"
export VISUAL="vim"
export PAGER="less"
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='37;45'

# Uses the command-not-found package zsh support
# as seen in http://www.porcheron.info/command-not-found-for-zsh/
# this is installed in Ubuntu
[[ -e /etc/zsh_command_not_found ]] && source /etc/zsh_command_not_found

# fasd https://github.com/clvv/fasd {{{
cache_file=/home/wedens/dotfiles/zprezto/modules/fasd/cache.zsh
# command and word modes completion definitions
init_args=(zsh-hook zsh-ccomp zsh-ccomp-install zsh-wcomp zsh-wcomp-install)
fasd --init "$init_args[@]" >! "$cache_file" 2> /dev/null
source "$cache_file"
unset cache_file init_args

function fasd_cd {
  local fasd_ret="$(fasd -d "$@")"
  if [[ -d "$fasd_ret" ]]; then
    cd "$fasd_ret"
  else
    print "$fasd_ret"
  fi
}

# Changes the current working directory interactively.
alias j='fasd_cd -i'
# }}}

# faster switching between vi modes
export KEYTIMEOUT=1

# Aliases {{{

alias g=git
alias ls="ls -bh -CF --color=auto"
alias la="ls -lhAF"
# Always highlight grep search term
alias grep='grep --color=auto'

alias '..'='cd ..'
# The -g makes them global aliases, so they're expaned even inside commands
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'

# Upgrades outdated packages.
alias debU='sudo apt-get update && sudo apt-get upgrade'
# Updates the package lists.
alias debu='sudo apt-get update'
# Installs packages from repositories.
# # Installs packages from repositories.
alias debi='sudo apt-get install'
# Removes packages, their configuration, and unneeded dependencies.
alias debX='sudo apt-get remove --purge && sudo apt-get autoremove --purge'
# Searches for packages.
alias debs='apt-cache search'

alias extract='patool extract'

# run tmux in color mode
alias tmux='tmux -2'
# run newsbeuter with correct paths
alias newsbeuter='newsbeuter -C ~/.newsbeuter.conf -u ~/yandex/newsbeuter/urls'
# # Enhanced WHOIS lookups
# alias whois="whois -h whois-servers.net"
# # View HTTP traffic
# alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
# alias httpdump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""
# # URL-encode strings
# alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1]);"'
# # find duplicates in current dir by md5 hash
# alias finddups="find -type f -exec md5sum '{}' ';' | sort | uniq --all-repeated=separate -w 33 | cut -c 35-"
# # file info: file name, octal permissions, owner
# alias oct="stat -c '%N %a %U'"
# # list open ports
# alias openports="netstat -anp | grep --color -i -E 'listen|listening'"
# # my ip address
# alias myip="curl ip.appspot.com"
# # local ip address
# alias mylocalip="ifconfig  | grep 'inet addr:'| grep -v '127.0.0.1' | cut -d: -f2 | awk '{ print \$1}'"
# # Intuitive map function
# # For example, to list all directories that contain a certain file:
# # find . -name .gitattributes | map dirname
# alias map="xargs -n1"
# # more readable $PATH
# alias path='echo -e ${PATH//:/\\n}'
# # top 10 memory usage
# alias topmem='ps -e -orss=,args= | sort -b -k1,1n| head -10'
# # top 10 cpu usage
# alias topcpu='ps -e -o pcpu,cpu,nice,state,cputime,args|sort -k1 -nr | head -10'
# # vimrc editing
# alias ve='vim ~/.vimrc'

# }}}

# Functions {{{

# Terminal colors list in tmux format

# function tmuxcolors() {
#   for i in {0..255} ; do
#     printf "\x1b[38;5;${i}mcolour${i}\n"
#   done
# }

function zshcolors() {
  for COLOR in $(seq 0 255)
  do
    for STYLE in "38;5"
    do
      TAG="\033[${STYLE};${COLOR}m"
      STR="${STYLE};${COLOR}"
      echo -ne "${TAG}${STR}${NONE}  "
    done
    echo
  done
}

# # Start an HTTP server from a directory, optionally specifying the port
# function server() {
#   local port="${1:-8000}"
#   sleep 1 && xdg-open "http://localhost:${port}/" &
#   # Set the default Content-Type to `text/plain` instead of `application/octet-stream`
#   # And serve everything as UTF-8 (although not technically correct, this doesn’t break anything for binary files)
#   python -c $'import SimpleHTTPServer;\nmap = SimpleHTTPServer.SimpleHTTPRequestHandler.extensions_map;\nmap[""] = "text/plain";\nfor key, value in map.items():\n\tmap[key] = value + ";charset=UTF-8";\nSimpleHTTPServer.test();' "$port"
# }

# find process by substring
psgrep() {
    if [ ! -z $1 ] ; then
        echo "Grepping for processes matching $1..."
        ps aux | awk "/$1/ && !/awk/"
    else
        echo "!! Need name to grep for"
    fi
}

# Killing tomcat
killtom() {
    pids=( $(ps aux | awk '/apache-tomcat/ && /bin\\/java && !/awk/ {print $2}') )
    if [ -z "$pids" ]
    then
        echo "Tomcat is not running!"
    else
        for pid in "${pids[@]}"; do
          echo "Killing Tomcat PID: $pid"
          kill -9 $pid
        done
    fi
}

# mkdir, cd into it (via http://onethingwell.org/post/586977440/mkcd-improved)
function mkcd () {
    mkdir -p "$*"
    cd "$*"
}

# # Find files and exec commands at them.
# # $ find-exec .coffee cat | wc -l
# # # => 9762
# function find-exec() {
#   find . -type f -iname "*${1:-}*" -exec "${2:-file}" '{}' \;
# }

# # create a new script, automatically populating the shebang line, editing the
# # script, and making it executable.
# # http://www.commandlinefu.com/commands/view/8050/
# shebang() {
#   if i=$(which $1);
#   then
#     printf '#!/usr/bin/env %s\n\n' $1 > $2 && chmod 755 $2 && vim + $2 && chmod 755 $2;
#   else
#     echo "'which' could not find $1, is it in your \$PATH?";
#   fi;
#   # in case the new script is in path, this throw out the command hash table and
#   # start over (man zshbuiltins)
#   rehash
# }

# # http://www.commandlinefu.com/commands/view/7294/backup-a-file-with-a-date-time-stamp
# buf () {
#     oldname=$1;
#     if [ "$oldname" != "" ]; then
#         datepart=$(date +%Y-%m-%d);
#         firstpart=`echo $oldname | cut -d "." -f 1`;
#         newname=`echo $oldname | sed s/$firstpart/$firstpart.$datepart/`;
#         cp -R ${oldname} ${newname};
#     fi
# }

# Determine size of a file or total size of a directory
function fs() {
  if du -b /dev/null > /dev/null 2>&1; then
    local arg=-sbh
  else
    local arg=-sh
  fi
  if [[ -n "$@" ]]; then
    du $arg -- "$@"
  else
    du $arg .[^.]* *
  fi
}

# List of installed packages excluding default
# function installed_packages() {
#   sudo aptitude search '~i !~M' -F '%p' | sed 's/[ \t]*$//' | sort -u > /tmp/currentlyinstalled.txt
#   wget -qO - http://mirror.pnl.gov/releases/raring/ubuntu-13.04-desktop-amd64.manifest | cut -f1 | sed 's/[ \t]*$//' | sort -u > /tmp/defaultinstalled.txt
#   comm -23 /tmp/currentlyinstalled.txt /tmp/defaultinstalled.txt
# }

# # Kills any process that matches a regexp passed to it
# killit() {
#     ps aux | awk "/$@/ && !/awk/ {print $2}" | xargs sudo kill
# }

# }}}

if [ -f ~/.zshrc.local ]
then
  source ~/.zshrc.local
fi

# vim: foldlevel=0
