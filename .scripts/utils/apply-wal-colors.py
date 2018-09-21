#!/usr/bin/python

import re
import sys
import os
import json
from pathlib import Path

# Return the complementary color
def compl(color):
    # strip the # from the beginning
    color = color[1:]
 
    # convert the string into hex
    color = int(color, 16)
 
    # invert the three bytes
    # as good as substracting each of RGB component by 255(FF)
    comp_color = 0xFFFFFF ^ color
 
    # convert the color back to hex by prefixing a #
    comp_color = "#%06X" % comp_color
 
    # return the result
    return comp_color


home = str(Path.home())
conkyConfDir = home + '/.config/conky/'
tint2ConfDir = home + '/.config/tint2/'

# Get wal colors

with open(home + '/.cache/wal/colors.json', 'r') as f:
    walcolors = json.load(f)['colors']


#region conky

if("conky" in sys.argv):
    print("Updating conky colors ...")
    # Rename the original conky config to .old
    os.rename(conkyConfDir + 'conky.conf', conkyConfDir + 'conky.conf.old')

    # Open conky config file
    with open(conkyConfDir + 'conky.conf.old','rt') as fin:

        with open(conkyConfDir + 'conky.conf','wt') as fout:
            for line in fin:
                for i in range (0, 10):
                    # Replace colorN=#xxxxx by the color specified by wal
                    j = str(i)
                    regex = r"color" + j + "=[^,]*"
                    replace = "color" + j +"='%s'" % walcolors['color' + j]
                    # print(replace)
                    line = re.sub(regex, replace, line)
                #print(line)
                fout.write(line)

#endregion

#region tint2
if ("tint2" in sys.argv):
    print("Updating tint2 colors ...")
    os.rename(tint2ConfDir + 'tint2rc', tint2ConfDir + 'tint2rc.old')

    # Open conky config file
    with open(tint2ConfDir + 'tint2rc.old','rt') as fin:

        with open(tint2ConfDir + 'tint2rc','wt') as fout:
            write = False        
            for line in fin:
                # Toggle write mode when we encouter a #WAL line
                # toggle it back when we encounter a #ENDWAL line
                if('#WAL' in line):
                    write = True
                if('#ENDWAL' in line):
                    write = False

                if(write):
                    # Replace 'XXX_color = #XXXXXX' by the color specified by wal
                    regex = r".+_color = #.{3,6}"
                    replace = "background_color = %s" % walcolors['color5'].upper()
                    # print(replace)
                    line = re.sub(regex, replace, line)
                    # print(line)
                fout.write(line)

#endregion