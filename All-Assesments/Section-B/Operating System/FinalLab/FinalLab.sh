# Code was given for the second batch and error 
# dhondh kr usei executable krna tha login sb whi rkhni thi 

#!/bin/bash

if [ $# -eq 0 ]; then
    echo "Usage: $0 user1 [user2..]" >&2
    exit 1
fi

missing=0

for u in "$@"; do
    if id "$u" &>/dev/null; then
        shell=$(getent passwd "$u" | cut -d: -f7)
        echo "$u uid=$(id -u "$u") shell=$shell"
    else
        echo "$u does not exist" >&2
        missing=$((missing+1))
    fi
done

exit $missing
