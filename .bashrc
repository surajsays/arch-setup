#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '






# customized 

alias hx='helix'

export PKG_CONFIG_PATH=/usr/lib/pkgconfig:$PKG_CONFIG_PATH
. "$HOME/.cargo/env"


export JAVA_HOME=/opt/android-studio/jbr

export ANDROID_HOME="$HOME/Android/Sdk"
export NDK_HOME="$ANDROID_HOME/ndk/$(ls -1 $ANDROID_HOME/ndk)"
