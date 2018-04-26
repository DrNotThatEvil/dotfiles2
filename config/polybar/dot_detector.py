#!/usr/bin/python
from git import Repo
from os import path
from pathlib import Path

home = str(Path.home())
dotfiles = path.join(home, '.dotfiles')
repo = Repo(dotfiles)

def detectChanges():
	changedFiles = [ item.a_path for item in repo.index.diff(None) ]
	changedFiles = changedFiles + repo.untracked_files
	if len(changedFiles) > 0:
		return "%{F5 F#f00}%{F-}%{F#f00} Dotfiles changed. Commit them!%{F-}"
	return ""

if __name__ == "__main__":
	print(detectChanges())
