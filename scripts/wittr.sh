#!/usr/bin/sh

# Fetch weather data with the required format
req=$(curl -s wttr.in/?format="%t|%l|%c|%f|%h|%C")

# Extract the temperature and weather symbol for the bar
bar=$(echo $req | awk -F "|" '{print $1" "$3}')

# Extract the tooltip information, which includes location and detailed weather
tooltip=$(echo $req | awk -F "|" '{print $2" ("$3") "$4", "$6}')

# Output the JSON
echo "{\"text\":\"$bar\", \"tooltip\":\"$tooltip\"}"

