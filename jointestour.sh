#!/bin/bash
rm -r /home/wzhuo/hadoop-1.1.2/hadoop-core-*;
cp /home/wzhuo/wzhuodata/increbalance/join/reduce50/hadoop-core-1.1.3-ourjoin_r50x4d10.jar /home/wzhuo/hadoop-1.1.2/;

for host in $(</home/wzhuo/wzhuodata/shell/hostlist)
do
echo $host "is starting to copy!!!"
ssh wzhuo@$host 'rm /home/wzhuo/hadoop-1.1.2/hadoop-core-*.jar;exit;';
scp /home/wzhuo/hadoop-1.1.2/hadoop-core-*.jar wzhuo@$host:/home/wzhuo/hadoop-1.1.2/;
echo $host "is finished to copy!!!!!"
done


for i in 1 2 3 4 5
do
sh /home/wzhuo/hadoop-1.1.2/bin/start-all.sh;
echo "sleep 60!!"
sleep 60;
/home/wzhuo/hadoop-1.1.2/bin/hadoop jar /home/wzhuo/hadoop-1.1.2/ourjoin_dir_r50x4d10.jar Join_ActDir joinbothdata5X ourjoinoutr50x10$i;
echo "finished"
sleep 3;
sh /home/wzhuo/hadoop-1.1.2/bin/stop-all.sh;
sleep 3;
done


echo "all done!!!"

