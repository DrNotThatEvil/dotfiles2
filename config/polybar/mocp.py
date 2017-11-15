#!/usr/bin/python

import subprocess

song = stdoutdata = subprocess.getoutput("mocp -Q %song")
album = stdoutdata = subprocess.getoutput("mocp -Q %album")
artist = stdoutdata = subprocess.getoutput("mocp -Q %artist")

ret = song
if len(artist) > 0:
    ret = ret + " by " + artist

if len(album) > 0:
    ret = ret + " on " + album

print(ret)
