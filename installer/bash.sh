#!/usr/bin/env bash

# TODO: Check whether the inclusion of .dotfiles/bash_profile exists in either
# ~/.bashrc or ~/bashrc and write it otherwise

symlink_or_ask ~/.dotfiles/shells/bashrc ~/.bash_profile
symlink_or_ask ~/.dotfiles/shells/bashrc ~/.bashrc
