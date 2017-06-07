#!/bin/bash

#tmux-battery
rm -rf ~/.tmux/plugins/tmux-battery 2> /dev/null
echo -e "Installing tmux-battery:"
git clone https://github.com/tmux-plugins/tmux-battery ~/.tmux/plugins/tmux-battery
echo -e "Done.\n"

#tpm
rm -rf ~/.tmux/plugins/tpm 2> /dev/null
echo -e "Installing tpm:"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
echo -e "Done.\n"

