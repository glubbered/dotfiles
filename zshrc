# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# filetype highlighting
eval `dircolors -b ~/dotfiles/dircolors`

# consistent terminfo
export TERM=screen-256color

# faster switching between vi modes
export KEYTIMEOUT=1

# Aliases {{{

# run tmux in color mode
alias tmux='tmux -2'
# run newsbeuter with correct paths
alias newsbeuter='newsbeuter -C ~/.newsbeuter.conf -u ~/yandex/newsbeuter/urls'
# Enhanced WHOIS lookups
alias whois="whois -h whois-servers.net"
# View HTTP traffic
alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""
# URL-encode strings
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1]);"'
# find duplicates in current dir by md5 hash
alias finddups="find -type f -exec md5sum '{}' ';' | sort | uniq --all-repeated=separate -w 33 | cut -c 35-"
# file info: file name, octal permissions, owner
alias oct="stat -c '%N %a %U'"
# list open ports
alias openports="netstat -anp | grep --color -i -E 'listen|listening'"
# my ip address
alias myip="curl ip.appspot.com"
# local ip address
alias mylocalip="ifconfig  | grep 'inet addr:'| grep -v '127.0.0.1' | cut -d: -f2 | awk '{ print \$1}'"
# Intuitive map function
# For example, to list all directories that contain a certain file:
# find . -name .gitattributes | map dirname
alias map="xargs -n1"
# more readable $PATH
alias path='echo -e ${PATH//:/\\n}'
# top 10 memory usage
alias topmem='ps -e -orss=,args= | sort -b -k1,1n| head -10'
# top 10 cpu usage
alias topcpu='ps -e -o pcpu,cpu,nice,state,cputime,args|sort -k1 -nr | head -10'
# vimrc editing
alias ve='vim ~/.vimrc'

# }}}

# Functions {{{

# Terminal colors list in tmux format

function tmuxcolors() {
  for i in {0..255} ; do
    printf "\x1b[38;5;${i}mcolour${i}\n"
  done
}

# Start an HTTP server from a directory, optionally specifying the port
function server() {
  local port="${1:-8000}"
  sleep 1 && xdg-open "http://localhost:${port}/" &
  # Set the default Content-Type to `text/plain` instead of `application/octet-stream`
  # And serve everything as UTF-8 (although not technically correct, this doesn’t break anything for binary files)
  python -c $'import SimpleHTTPServer;\nmap = SimpleHTTPServer.SimpleHTTPRequestHandler.extensions_map;\nmap[""] = "text/plain";\nfor key, value in map.items():\n\tmap[key] = value + ";charset=UTF-8";\nSimpleHTTPServer.test();' "$port"
}

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

# Find files and exec commands at them.
# $ find-exec .coffee cat | wc -l
# # => 9762
function find-exec() {
  find . -type f -iname "*${1:-}*" -exec "${2:-file}" '{}' \;
}

# create a new script, automatically populating the shebang line, editing the
# script, and making it executable.
# http://www.commandlinefu.com/commands/view/8050/
shebang() {
  if i=$(which $1);
  then
    printf '#!/usr/bin/env %s\n\n' $1 > $2 && chmod 755 $2 && vim + $2 && chmod 755 $2;
  else
    echo "'which' could not find $1, is it in your \$PATH?";
  fi;
  # in case the new script is in path, this throw out the command hash table and
  # start over (man zshbuiltins)
  rehash
}

# http://www.commandlinefu.com/commands/view/7294/backup-a-file-with-a-date-time-stamp
buf () {
    oldname=$1;
    if [ "$oldname" != "" ]; then
        datepart=$(date +%Y-%m-%d);
        firstpart=`echo $oldname | cut -d "." -f 1`;
        newname=`echo $oldname | sed s/$firstpart/$firstpart.$datepart/`;
        cp -R ${oldname} ${newname};
    fi
}

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
function installed_packages() {
  sudo aptitude search '~i !~M' -F '%p' | sed 's/[ \t]*$//' | sort -u > /tmp/currentlyinstalled.txt
  wget -qO - http://mirror.pnl.gov/releases/raring/ubuntu-13.04-desktop-amd64.manifest | cut -f1 | sed 's/[ \t]*$//' | sort -u > /tmp/defaultinstalled.txt
  comm -23 /tmp/currentlyinstalled.txt /tmp/defaultinstalled.txt
}

# Kills any process that matches a regexp passed to it
killit() {
    ps aux | awk "/$@/ && !/awk/ {print $2}" | xargs sudo kill
}

# }}}

if [ -f ~/.zshrc.local ]
then
  source ~/.zshrc.local
fi

# vim: foldlevel=0
