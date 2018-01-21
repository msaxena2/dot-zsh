#!/bin/bash

configure_dot_home() {
    if find ~/.home -iname dot_home_setup 2> /dev/null; then
        if type dot_home_setup 2> /dev/null; then
            echo "== Dot Home Installed and Present in Path"
        else
            export PATH=$PATH:"~/.home/_dot-home/bin"
        fi
    else
        echo 1>&2 "== Expected to be run from within an existing ~/.home"
        exit 1
    fi
}

install_homebrew() {
    if type brew 2> /dev/null; then
        echo "== Homebrew already installed"
    else
        # https curl
        mkdir homebrew && curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C homebrew
    fi
}


install_zsh() {
    if type zsh 2> /dev/null; then
        echo "== Zsh already installed"
    else
        brew install zsh
    fi
    echo "== Changing Shell to zsh"
    echo $( eval chsh -s $(which zsh) )
}

echo "== Setup"

echo "== dot-home Setup"

configure_dot_home

echo "== Installing Homebrew"

install_homebrew

echo "== Installing and configuring zsh"

install_zsh






