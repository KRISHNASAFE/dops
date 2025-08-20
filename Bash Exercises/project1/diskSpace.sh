#!/bin/bash
filesystems=("/" "/$dir1" "/$dir2")
for i in ${filesystems[@]}; do
usage=$(df -h $i | tail -n 1 | awk '{print $5}' | cut -d % -f1)
if [ $usage -ge 90 ]; then
alert="Running out of space on $i, Usage is: $usage%"
echo "Sending out a disk space alert email."
echo $alert | mail -s "$i is $usage% full" your_email
fi
done



corntab -e

0 */6 * * * /home/monitoring/dickSpace.sh              # -------example setup of cron to monitor disk space on server every 6 hrs.
0 0 * * * /home/monitoring/backup.sh                   # -------example of cron to set up backup at 12 ebery day. 