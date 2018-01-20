#!/usr/bin/env/bash
#
# rotsix - (c) wtfpl 2017
# trololo install script

echo "Creating default folders"
mkdir -pv "$HOME/backup"
mkdir -pv "$HOME/log"
mkdir -pv "$HOME/mnt"
mkdir -pv "$HOME/src"
mkdir -pv "$HOME/tmp"
mkdir -pv "$HOME/trash"
mkdir -pv "$HOME/usr"
echo "Done"

echo "Cloning dotfiles in ~/dotfiles"
case "$(whoami)" in
  "victor"|"piczel"|"rotsix")
  	git clone "git@github.com:rotsix/dotfiles.git" "$HOME/dotfiles" &> /dev/null
  	;;
  *)
	git clone "https://github.com/rotsix/dotfiles.git" "$HOME/dotfiles" &> /dev/null
  	;;
esac
shift
echo "Done"

echo "Managing simlinks"
cd "$HOME/dotfiles" && make
echo "Done"

