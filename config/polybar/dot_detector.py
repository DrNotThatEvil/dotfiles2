#!/usr/bin/python
import sys
from git import Repo
from os import path
from pathlib import Path

home = str(Path.home())
dotfiles = path.join(home, '.dotfiles')
repo = Repo(dotfiles)

def detectChanges(args):
    changedFiles = [ item.a_path for item in repo.index.diff(None) ]
    changedFiles = changedFiles + repo.untracked_files
    if len(changedFiles) > 0:
        return "%{F5 F#f00}%{F-} Dotfiles changed. Commit them!%{F-}"

    # remoteChangedFiles = [ item.a_path for item in repo.index.diff(repo.remotes.origin) ]
    remoteChangedFiles = [ item.a_path for item in repo.index.diff(repo.remotes.origin.refs.master.commit) ]
    if len(remoteChangedFiles) > 0:
        return "%{F5 F#ff0}%{F-} Remote dotfiles changed. Pull them!%{F-}"

    if len(args) > 0:
        for fetch_info in repo.remotes.origin.fetch():
            print("Updated %s to %s" % (fetch_info.ref, fetch_info.commit))

    return ""

if __name__ == "__main__":
    print(detectChanges(sys.argv[1:]))
