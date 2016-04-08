## Numix Solarized Dark

Numix Solarized Dark is a modification of the [Numix Solarized theme](http://bitterologist.deviantart.com/art/Numix-Solarized-417575928) by [bitterologist](http://bitterologist.deviantart.com/) which is based on the Numix theme by Satyajit Sahoo (satyajit.happy@gmail.com).

In Numix Solarized Dark, all light elements are replaced by dark ones.


### Manual installation

Extract the zip file to the themes directory i.e. `/usr/share/themes/`

To set the theme in Gnome, run the following commands in Terminal,

```
gsettings set org.gnome.desktop.interface gtk-theme "Numix"
gsettings set org.gnome.desktop.wm.preferences theme "Numix"
```

To set the theme in Xfce, run the following commands in Terminal,

```
xfconf-query -c xsettings -p /Net/ThemeName -s "Numix"
xfconf-query -c xfwm4 -p /general/theme -s "Numix"
```

### Requirements

GTK+ 3.6 or above

Murrine theme engine

### Code and license

License: GPL-3.0+
