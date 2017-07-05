#! /usr/bin/env python2
from subprocess import check_output 

def get_pass(email, account):
    return check_output("gpg -r " + email + " -dq ~/.config/offlineimap/passwords/" + account + ".gpg", shell=True).strip("\n")

def get_email(email, account):
    return check_output("gpg -r " + email + " -dq ~/.config/offlineimap/emails/" + account + ".gpg", shell=True).strip("\n")
