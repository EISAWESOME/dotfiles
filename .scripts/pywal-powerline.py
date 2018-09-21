#! /usr/bin/env python

import colortrans
import json

from pathlib import Path
home = str(Path.home())

# open the current config.json and potentially overwrite the right values
colorjsonfile = home + '/.config/powerline/colors.json'
with open(colorjsonfile) as pywaljsonfile:	
	pywaljson = json.load(pywaljsonfile)

# read the pywal cache file
pywalcolors = open(home + '/.cache/wal/colors', "r")
i = 0
for row in pywalcolors:
	# clean up the color
	colorstring = row.strip()
	# remove the hashtag
	colorstring = colorstring.lstrip('#')
	# convert it to short
	colorshort = colortrans.rgb2short(colorstring)[0]
	# print the color
	print(colorshort)
	# overwrite the setting in the json file
	colorname = 'pywal'+str(i)
	pywaljson['colors'][colorname] = int(colorshort)
	i = i+1

# write the json object back to the file
with open(colorjsonfile, 'w') as outfile:
	json.dump(pywaljson, outfile)
