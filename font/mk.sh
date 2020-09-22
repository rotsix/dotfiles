#!/bin/bash

dir="$(dirname "$0")"

echo "creating env"
rm -rf "$dir/env" &> /dev/null
virtualenv "$dir/env" &> /dev/null
source "$dir/env/bin/activate" &> /dev/null
pip install fontTools &> /dev/null

echo "customizing font"
rm -rf "$dir/output" &> /dev/null
mkdir "$dir/output" &> /dev/null
mkdir ~/.local/share/fonts &> /dev/null
shopt -s globstar &> /dev/null
python "$dir/mk.py" "$dir"/input/**/*.ttf --dest="$dir/output" --a --g --asterisk &> /dev/null

echo "generating cache"
cp "$dir"/output/**/*.ttf ~/.local/share/fonts &> /dev/null
fc-cache -fv &> /dev/null

echo "done"
deactivate &> /dev/null
rm -rf "$dir/env" &> /dev/null
