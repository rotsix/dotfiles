#!/bin/bash

loc="34090"

mph=$(cliweather $loc| grep 'Wind:' | cut -d' ' -f2)
kmh=$(echo "$(($mph*(8/5)))" | cut -d'.' -f1)
#today_cond="$(cliweather $loc | grep 'Condition:' | sed 's-Condition: --')"
today_temp="$(cliweather $loc | grep 'Temperature:' | sed 's-Temperature: .*/\(.*C\)- \1°-')"
today_humi="$(cliweather $loc | grep 'Humidity:' | sed 's-Humidity: --')"
today_wind="$(cliweather $loc | grep 'Wind:' | sed  "s-Wind: .* mph\( .*\)-"$kmh"km/h-")"

#today
echo $today_temp $today_humi $today_wind

#next days
#cliweather -f 34090 | head -n 9 | sed 's-Day: --' | sed 's- .*/\(.*C\)- \1°-' | sed 's-Condition: --'
