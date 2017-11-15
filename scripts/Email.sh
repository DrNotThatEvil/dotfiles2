#!/bin/bash
offlineimap -a main -u quiet &
offlineimap -a cockli -u quiet &
offlineimap -a cockli_irc -u quiet &
offlineimap -a electrum-server -u quiet &
offlineimap -a wilvin-server -u quiet &
