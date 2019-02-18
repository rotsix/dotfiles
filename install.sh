#!/usr/bin/env/bash
#
# rotsix - (c) wtfpl 2017
# trololo install script

echo "Creating default folders"
mkdir -p "$HOME/src"
mkdir -p "$HOME/trash"
mkdir -p "$HOME/usr"
echo "Done"

echo "Cloning dotfiles in ~/dotfiles"
if [ "$1" = "--ssh" ]; then
  git clone "git@github.com:rotsix/dotfiles.git" "$HOME/dotfiles" > /dev/null 2>&1
else
  git clone "https://github.com/rotsix/dotfiles.git" "$HOME/dotfiles" > /dev/null 2>&1
fi
shift
echo "Done"

echo "Managing simlinks"
cd "$HOME/dotfiles" && make > /dev/null 2>&1
echo "Done"

