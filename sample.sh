#!/bin/bash
sh /home/wzhuo/hadoop-1.1.2/bin/stop-all.sh;
for i in 1 2 3 4 5 6 8
do
for j in $(seq 1 3)
do
sh /home/wzhuo/hadoop-1.1.2/bin/start-all.sh;
echo "sleep 60!!"
sleep 60;
/home/wzhuo/hadoop-1.1.2/bin/hadoop jar /home/wzhuo/hadoop-1.1.2/sample5x5d$i.jar wordcount zip07 sampling_$i$j;
echo "finished"
sleep 5;
sh /home/wzhuo/hadoop-1.1.2/bin/stop-all.sh;
sleep 10;
done
done
echo "all finish"
