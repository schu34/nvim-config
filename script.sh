#! /bin/sh

git pull;
nvim --cmd "PlugInstall" -c "qa!"
