HISTSIZE=50000
# alias
alias gs="git status"
alias gd='git diff'
alias gl='git log --graph --decorate --oneline'
alias grep="grep --color=auto"
alias ll="ls -l"
alias ls="ls -aFG"
alias m="make"
alias mp="make package"
alias mi="make install"
alias mc="make clean"
alias rd="rm *.deb"
alias vu="vagrant up"
alias vh="vagrant halt"
alias vs="vagrant ssh"
alias be="bundle exec"
alias vimsjis='vim -c ":e ++enc=cp932"'
alias miall="
export THEOS_DEVICE_IP=i6; mi;
export THEOS_DEVICE_IP=i5s; mi;
export THEOS_DEVICE_IP=i5; mi;
export THEOS_DEVICE_IP=i4s; mi;
export THEOS_DEVICE_IP=i4; mi;
export THEOS_DEVICE_IP=mini2; mi;
export THEOS_DEVICE_IP=ipad3; mi;
export THEOS_DEVICE_IP=ipad1; mi;
"

# theos
export THEOS=/opt/theos
export THEOS_DEVICE_IP=i6s

# rbenv PATH
if [ -d ~/.rbenv ]; then
    export PATH=~/.rbenv/shims:$PATH
fi

# homebrew git
if [ -f /usr/local/etc/bash_completion.d/git-completion.bash ]; then
    . /usr/local/etc/bash_completion.d/git-prompt.sh
    . /usr/local/etc/bash_completion.d/git-completion.bash
    export PS1='\[\033[32m\]\u@\h\[\033[00m\]:\[\033[34m\]\w\[\033[31m\]$(__git_ps1)\[\033[00m\]\$ '
fi

function git_rebase_remote() {
# ex. $1: master $2: local
    if [ $# -lt 2 ]; then
        echo "must have 2 args"
        return
    fi
    git co $1
    git pull
    git co $2
    git rebase $1
}

function git_push_remote() {
# ex. $1: master $2: local
    if [ $# -lt 2 ]; then
        echo "must have 2 args"
        return
    fi
    git co $1
    git rebase $2
    git push
    git co $2
}

alias grr="git_rebase_remote"
alias gpr="git_push_remote"

# source un tracked file.
if [ -f ~/.bashrc_local ]; then
    . ~/.bashrc_local
fi
