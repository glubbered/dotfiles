#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi


# filetype highlighting
eval `dircolors -b ~/dotfiles/dircolors`

# run tmux in color mode
alias tmux='tmux -2'
# Enhanced WHOIS lookups
alias whois="whois -h whois-servers.net"
# View HTTP traffic
alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""
# URL-encode strings
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1]);"'


psgrep() {
    if [ ! -z $1 ] ; then
        echo "Grepping for processes matching $1..."
        ps aux | grep $1 | grep -v grep
    else
        echo "!! Need name to grep for"
    fi
}

# Killing tomcat
killtom() {
    pid=$(ps aux | grep apache-tomcat | grep 'bin/java' | grep -v grep | awk '{print $2}')
    if [ -z "$pid" ]
    then
        echo "Tomcat is not running!"
    else
        echo "Killing Tomcat PID: $pid"
        kill -9 $pid
    fi
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

# Top ten memory hogs
memtop() {ps -eorss,args | sort -nr | pr -TW$COLUMNS | head}



if [ -f ~/.zshrc.local ]
then
  source ~/.zshrc.local
fi
