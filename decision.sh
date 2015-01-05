#!/bin/bash
for k in 12 
do

rm -r /home/wzhuo/hadoop-1.1.2/hadoop-core-*;
cp /home/wzhuo/wzhuodata/increbalance/decision/hadoop-core-1.1.3-decision$k.jar /home/wzhuo/hadoop-1.1.2/;

for host in $(</home/wzhuo/wzhuodata/shell/hostlist)
do
echo $host "is starting to copy!!!"
ssh wzhuo@$host 'rm /home/wzhuo/hadoop-1.1.2/hadoop-core-*.jar;exit;';
scp /home/wzhuo/hadoop-1.1.2/hadoop-core-*.jar wzhuo@$host:/home/wzhuo/hadoop-1.1.2/;
echo $host "is finished to copy!!!!!"
done
sleep 5;

for i in 1 2
do
sh /home/wzhuo/hadoop-1.1.2/bin/start-all.sh;
echo "sleep 60!!"
sleep 60;
/home/wzhuo/hadoop-1.1.2/bin/hadoop jar /home/wzhuo/hadoop-1.1.2/decision$k.jar wordcount dataAirline decision5Xdata$k$i;
echo "finished"
sleep 5;
sh /home/wzhuo/hadoop-1.1.2/bin/stop-all.sh;
sleep 10;
done

done
echo "all done!!!"

