#!/bin/bash
echo "begin german"
for ro in 30 40 50 60
do

rm -r /home/wzhuo/hadoop-1.1.2/conf/mapred-site.xml;
cp /home/wzhuo/wzhuodata/increbalance/secondsort/reduce$ro/mapred-site.xml /home/wzhuo/hadoop-1.1.2/conf/;

for host in $(</home/wzhuo/wzhuodata/shell/hostlist)
do
echo $host "is starting to copy mapred-site!!!"
ssh wzhuo@$host 'rm /home/wzhuo/hadoop-1.1.2/conf/mapred-site.xml;exit;';
scp /home/wzhuo/hadoop-1.1.2/conf/mapred-site.xml wzhuo@$host:/home/wzhuo/hadoop-1.1.2/conf/;
echo $host "is finished to copy mapred-site!!!!!"
done


rm -r /home/wzhuo/hadoop-1.1.2/hadoop-core-*;
cp /home/wzhuo/wzhuodata/increbalance/secondsort/reduce$ro/hadoop-core-1.1.3-germansortr$ro.jar /home/wzhuo/hadoop-1.1.2/;

for host in $(</home/wzhuo/wzhuodata/shell/hostlist)
do
echo $host "is starting to copy!!!"
ssh wzhuo@$host 'rm /home/wzhuo/hadoop-1.1.2/hadoop-core-*.jar;exit;';
scp /home/wzhuo/hadoop-1.1.2/hadoop-core-*.jar wzhuo@$host:/home/wzhuo/hadoop-1.1.2/;
echo $host "is finished to copy!!!!!"
done

sleep 3;
for i in 1 2 3 4 5
do
sh /home/wzhuo/hadoop-1.1.2/bin/start-all.sh;
echo "sleep 60!!"
sleep 60;
/home/wzhuo/hadoop-1.1.2/bin/hadoop jar /home/wzhuo/hadoop-1.1.2/germansecondscortr$ro.jar Secondsort twitterOK germanssortout$ro$i;
echo "finished"
sleep 3;
sh /home/wzhuo/hadoop-1.1.2/bin/stop-all.sh;
sleep 3;
done

done

echo "all done!!!"

