#!/usr/bin/python
import sys
from git import Repo
from os import path, environ
from pathlib import Path

home = str(Path.home())
dotfiles = path.join(home, '.dotfiles')
repo = Repo(dotfiles)

def detectChanges(args):
    changedFiles = [ item.a_path for item in repo.index.diff(None) ]
    changedFiles = changedFiles + repo.untracked_files
    if len(changedFiles) > 0:
        return "%{F"+ environ['COLOR_BASE0E' ] + "} %{F-}Dotfiles changed. %{u"+ environ['COLOR_BASE0E'] + "}Commit them!%{-u}"
    # remoteChangedFiles = [ item.a_path for item in repo.index.diff(repo.remotes.origin) ]
    remoteChangedFiles = [ item.a_path for item in repo.index.diff(repo.remotes.origin.refs.master.commit) ]
    if len(remoteChangedFiles) > 0:
        return "%{F" + environ['COLOR_BASE0E'] + "} %{F-} Remote dotfiles changed. %{u"+ environ['COLOR_BASE0D'] + "}Pull them!%{-u}"

    if len(args) > 0:
        repo.remotes.origin.fetch()

    return ""

if __name__ == "__main__":
    print(detectChanges(sys.argv[1:]))
