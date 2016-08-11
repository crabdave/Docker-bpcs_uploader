#!/bin/bash
mkdir -p /data/docker/upload
# touch a file use for init bpcs_uploader, this file whill not upload to remote server
touch /data/docker/upload/test.txt
DIRECTORY=/data/docker/upload
while true;
do
  echo "start uploading"
  if [ "`ls -A $DIRECTORY`" = "" ]; then
        echo "$DIRECTORY is indeed empty"
   else
        echo "$DIRECTORY is not empty"
        datename=$(date +%Y%m%d-%H%M%S)
        UPLOAD=/data/docker/$datename
	echo "mkdir $UPLOAD"
  	mkdir -p $UPLOAD
        cd $UPLOAD
    
	echo "move files to uploading dir: $UPLOAD"
        mv $DIRECTORY/* ./
        echo "the number of files for uploading:" `ls -l |grep "^-"|wc -l` 
	echo "rename for files avoid file name errors"
        /root/rename.sh
        echo "start uploading"
        /root/up.sh
        echo "remove the uploading dir $UPLOAD"
        rm -rf $UPLOAD
        echo "the current status of disk"
        df -lh
  fi
  echo "sleep 1 minutes for next upload"
  sleep 60s
done
