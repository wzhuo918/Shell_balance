#!/bin/bash
for i in 10 
do
for j in 1
do
/home/wzhuo/hadoop-1.1.2/bin/hadoop jar /home/wzhuo/hadoop-1.1.2/nativezipf$i.jar zipwordcount zip10 nativezipf3$i$j;
echo "finished"
sleep 5;
done
done
echo "all done!!!"
