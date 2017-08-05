#!/usr/bin/env/bash
#
# rotsix - (c) wtfpl 2017
# trololo install script

echo "Cloning dotfiles in ~/dotfiles"
case "$(hostname)" in
  "fry"|"lili"|"isaac")
  	git clone "git@github.com:rotsix/dotfiles.git" "$HOME/dotfiles" &> /dev/null
  	;;
  *)
	git clone "https://github.com/rotsix/dotfiles.git" "$HOME/dotfiles" &> /dev/null
  	;;
esac
shift

cd "$HOME/dotfiles" && git config filter.qualia.clean qualia
cd "$HOME/dotfiles" && git config filter.qualia.smudge "qualia $(hostname)"
echo "Done"

echo "Managing simlinks"
cd "$HOME/dotfiles" && make
echo "Done"
