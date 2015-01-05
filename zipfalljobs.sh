#!/bin/bash
for k in 0 1 2 3 4 5 6 7 8 9
do
for i in $(seq 1 3)
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


rm -r /home/wzhuo/hadoop-1.1.2/hadoop-core-*;
cp /home/wzhuo/wzhuodata/core/hadoop-core-1.1.2.jar /home/wzhuo/hadoop-1.1.2/;

for host in $(</home/wzhuo/wzhuodata/shell/hostlist)
do
echo $host "is starting to copy!!!"
ssh wzhuo@$host 'rm /home/wzhuo/hadoop-1.1.2/hadoop-core-*.jar;exit;';
scp /home/wzhuo/hadoop-1.1.2/hadoop-core-*.jar wzhuo@$host:/home/wzhuo/hadoop-1.1.2/;
echo $host "is finished to copy!!!!!"
done

sh /home/wzhuo/hadoop-1.1.2/bin/start-all.sh;
echo "sleep 60!!"
sleep 60;

for i in 0 1 2 3 4 5 6 7 8 9
do
for j in 1 2 3
do
/home/wzhuo/hadoop-1.1.2/bin/hadoop jar /home/wzhuo/hadoop-1.1.2/nativezipf$i.jar zipwordcount zip0$i nativezipf1new3$i$j;
echo "finished"
sleep 5;
done
done

echo "all done!!!"
