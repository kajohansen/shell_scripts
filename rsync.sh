#!/bin/bash

# get past part of path (current working directory)
cwd=`pwd | rev | cut -d "/" -f -1 | rev`
# build the string for the remote path (to remote working directory)
rwd=/Volumes/BackupSme/Bilder/$cwd/
echo $rwd
# sync current working directory up to remote server
rsync -av ./ nserve:$rwd
rsync -av nserve:$rwd ./
