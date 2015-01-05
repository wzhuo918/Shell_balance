#!/bin/bash
for k in 1 2 3 4 5 6 7 8 9
do
for i in 1
do
sh /home/wzhuo/hadoop-1.1.2/bin/start-all.sh;
echo "sleep 60!!"
sleep 60;
/home/wzhuo/hadoop-1.1.2/bin/hadoop jar /home/wzhuo/hadoop-1.1.2/zipfourx20$k.jar zipfwordcount zip0$k zipfour20X$k$i;
echo "finished"
sleep 3;
sh /home/wzhuo/hadoop-1.1.2/bin/stop-all.sh;
sleep 5;
done
done

echo "all done!!!"
