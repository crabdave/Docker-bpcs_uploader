

#!/bin/sh

#check files in /data/docker/upload

DIRECTORY=/data/docker/upload
if [ "`ls -A $DIRECTORY`" = "" ]; then
	echo "$DIRECTORY is indeed empty"
else
	echo "$DIRECTORY is not empty"
fi
