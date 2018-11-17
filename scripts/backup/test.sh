#!/bin/bash
server_key="RWnLWVxcZ8cykaTOs+If4HO+x6tN1X5K7y6ncd0ihcc"

file=$(mktemp)
ssh-keyscan localhost > $file 2> /dev/null
ssh-keygen -l -f $file > /tmp/file
sshkey=$(pcregrep -M -o1 '^2048\sSHA256:([a-zA-Z0-9+]+)' /tmp/file)

check=$(echo "$sshkey" | grep "$server_key")
if [ $check ] ; then
  echo "It's your box"
else
  echo "It's a TRAP"
fi
