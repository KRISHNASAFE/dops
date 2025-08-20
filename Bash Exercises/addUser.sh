#!/bin/bash

server=$(cat servers.txt)

echo -n "Enter username:"
read name

echo -n "Enter id of user:"
read id

for i in $server; do
echo $i

ssh $i "sudo useradd -m -u $id $name "
if [ $? -eq 0 ]; then
echo " User $name added on $i"
else
echo "Error on $i"
fi
done










