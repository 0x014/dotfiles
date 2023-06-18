#!/bin/fish

# ------------------------------
# Bin
# ------------------------------

# NOTE: Personal binary place instead of /usr/local/bin/ due to permission
# ref:
# - https://superuser.com/questions/1289534/how-to-install-when-permission-denied-to-usr-local-bin
# - https://stackoverflow.com/questions/793858/how-to-mkdir-only-if-a-dir-does-not-already-exist
if not test -d ~/bin
    mkdir ~/bin
end
set -gx PATH "$HOME/bin" $PATH 

# ------------------------------
# ClI
# ------------------------------

# Direnv
if type -q "direnv"
  eval "$(direnv hook fish)"
end

# FZF
if type -q "fzf"
  set FZF_DEFAULT_OPTS "--bind ctrl-d:page-down,ctrl-u:page-up --reverse --inline-info"
  set FZF_DEFAULT_COMMAND 'ag --hidden --ignore .git -g ""' # see https://github.com/junegunn/fzf/issues/634
end

# Autojump
source /usr/share/autojump/autojump.fish

# for VCPKG
if test -d ~/vcpkg/
    set -gx PATH ~/vcpkg/ $PATH 
end

# ------------------------------
# C/C++
# ------------------------------

# # root (CRAN)
# if test -d ~/root/
#     fish_add_path ~/root/bin/ --path
# end

# ------------------------------
# Python
# ------------------------------

# Anaconda3
set -gx PATH "/home/mike/anaconda3/bin" $PATH 

# pyenv
set -gx PYENV_ROOT "$HOME/.pyenv"
set -gx PATH "$PYENV_ROOT/bin" $PATH 
eval "$(pyenv init --path)"

# for pipenv on ubuntu
set -gx PATH "$HOME/.local/bin" $PATH 

# poetry
set POETRY_FOLDER $HOME/.poetry
if test -d "$POETRY_FOLDER"
    source $HOME/.poetry/env
end


# ------------------------------
# Java
# ------------------------------

# JAVA
if type -q "java"
  set -gx JAVA_HOME $(readlink -f /usr/bin/javac | sed "s:/bin/javac::")
  set -gx PATH $JAVA_HOME/bin $PATH 
end

# ------------------------------
# Node
# ------------------------------

# NVM
# export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm


# ------------------------------
# Ruby
# ------------------------------

# # Ruby Env
# if type "rbenv" > /dev/null; then
#   export PATH="$HOME/.rbenv/bin:$PATH"
#   eval "$(rbenv init -)"
# fi

# ------------------------------
# Android
# ------------------------------

# Android
# export ANDROID_HOME=${HOME}/Android/Sdk
# export PATH=${PATH}:${ANDROID_HOME}/tools
# export PATH=${PATH}:${ANDROID_HOME}/platform-tools


# ------------------------------
# Go
# ------------------------------

# Golang
if type "go" > /dev/null
   set -gx GO111MODULE on
   set -gx GOPATH "$HOME/go"
   set -gx PATH $GOPATH/bin $PATH
end


# ------------------------------
# GCP
# ------------------------------

# export CLOUDSDK_PYTHON=python2
#
# # The next line updates PATH for the Google Cloud SDK.
# if [ -f '/home/mike/google-cloud-sdk/path.zsh.inc' ]; then source '/home/mike/google-cloud-sdk/path.zsh.inc'; fi
#
# # The next line enables shell command completion for gcloud.
# if [ -f '/home/mike/google-cloud-sdk/completion.zsh.inc' ]; then source '/home/mike/google-cloud-sdk/completion.zsh.inc'; fi

# ------------------------------
# Perl
# ------------------------------

# # perl
# if type "perl" > /dev/null; then
#   PATH="/home/mike/perl5/bin${PATH:+:${PATH}}"; export PATH;
#   PERL5LIB="/home/mike/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
#   PERL_LOCAL_LIB_ROOT="/home/mike/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
#   PERL_MB_OPT="--install_base \"/home/mike/perl5\""; export PERL_MB_OPT;
#   PERL_MM_OPT="INSTALL_BASE=/home/mike/perl5"; export PERL_MM_OPT;
# fi

# ------------------------------
# Rust
# ------------------------------
set -gx PATH  ~/.cargo/bin/ $PATH

# ------------------------------
# Code
# ------------------------------
set -gx PATH "/mnt/c/Program Files/Microsoft VS Code/bin" $PATH 
set -gx PATH "/mnt/c/Users/mgold/AppData/Local/Programs/Microsoft VS Code/bin" $PATH 

# ------------------------------
# Cmd and PowerShell
# ------------------------------
set -gx PATH "/mnt/c/Windows/System32" $PATH  # cmd.exe
set -gx PATH "/mnt/c/Windows/System32/WindowsPowerShell/v1.0" $PATH  # powershell
