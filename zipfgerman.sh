#!/bin/bash
for k in 8 9
do
for i in 1
do
sh /home/wzhuo/hadoop-1.1.2/bin/start-all.sh;
echo "sleep 60!!"
sleep 60;
/home/wzhuo/hadoop-1.1.2/bin/hadoop jar /home/wzhuo/hadoop-1.1.2/zipfgerman$k.jar zipfwordcount zip0$k zipfgerman2X$k$i;
echo "finished"
sleep 3;
sh /home/wzhuo/hadoop-1.1.2/bin/stop-all.sh;
sleep 5;
done
done

