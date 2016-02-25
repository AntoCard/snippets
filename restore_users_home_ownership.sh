#!/bin/bash

while IFS=':' read -r login pass uid gid uname homedir comment; do
    if [[ "$homedir" = **/home/** ]]; then
        if [ -d "$homedir" ]; then
            chown -R $uid:$gid "$homedir";
        fi
    fi
done < /etc/passwd
