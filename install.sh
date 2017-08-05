#!/usr/bin/env/bash
#
# rotsix - (c) wtfpl 2017
# trololo install script

usage () {
  "./install.sh <ssh|http> <qualia qualities>"
}


echo "Cloning dotfiles in ~/dotfiles"
case "$1" in
  ssh)
  	git clone "git@github.com:rotsix/dotfiles.git" "$HOME/dotfiles" &> /dev/null
  	;;
  http)
	git clone "https://github.com/rotsix/dotfiles.git" "$HOME/dotfiles" &> /dev/null
  	;;
  *)
  	echo "Failed"
  	usage
  	exit 127
  	;;
esac
shift

cd "$HOME/dotfiles" && git config filter.qualia.clean qualia
cd "$HOME/dotfiles" && git config filter.qualia.smudge "qualia $*"
echo "Done"

echo "Managing simlinks"
cd "$HOME/dotfiles" && make
echo "Done"
