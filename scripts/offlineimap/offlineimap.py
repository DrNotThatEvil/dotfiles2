#! /usr/bin/env python2
from subprocess import check_output 

def get_pass(account):
    return check_output("pass General/Work/Projects/Server/" + account, shell=True).splitlines()[0]
