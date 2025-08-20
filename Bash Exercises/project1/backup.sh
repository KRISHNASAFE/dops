#!/bin/bash

backup_dir=$("/workspaces/dops/Bash Exercises/project1/")
dest_dir="/backup"
dest_server="server1"
date=$(date +%b-%d-%y)

echo "Starting backup of ${backup_dir[@]}"

for i in "${backup_dir[@]}"; do
sudo tar -Pczvf /tmp/$i-$date.tar.gz $i

if [ $? -eq 0 ]; then
echo "$i backup succeded"
else
echo "$i backup failed"
fi

scp /tmp/$i-$date.tar.gz $dest_server:$dest_dir
if [ $? -eq 0 ]; then
echo "Task completed"
else
echo "Task failed" 
fi
done











