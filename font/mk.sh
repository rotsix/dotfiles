#!/bin/bash

dir="$(dirname $0)"
echo "creating env"
rm -rf $dir/env &> /dev/null
virtualenv2 $dir/env &> /dev/null
source $dir/env/bin/activate  &> /dev/null
pip install fontTools &> /dev/null
echo "customizing font"
rm -rf $dir/Output_Fonts &> /dev/null
mkdir $dir/Output_Fonts &> /dev/null
mkdir ~/.local/share/fonts &> /dev/null
shopt -s globstar
python $dir/Scripts/inputCustomize.py $dir/Input_Fonts/**/*.ttf --dest=$dir/Output_Fonts --a --g --asterisk &> /dev/null
echo "generating cache"
cp $dir/Output_Fonts/**/*.ttf ~/.local/share/fonts &> /dev/null
fc-cache -fv &> /dev/null
echo "done"
deactivate &> /dev/null
rm -rf $dir/env &> /dev/null
