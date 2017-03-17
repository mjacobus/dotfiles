#!/usr/bin/env bash

if [[ -f ~/.bashrc ]]; then
  echo 'source ~/.profile.d/bash_setup.sh' >> ~/.bashrc
fi

if [[ -f ~/.bash_profile ]]; then
  echo 'source ~/.profile.d/bash_setup.sh' >> ~/.bash_profile
fi
