#!/bin/bash
for ro in 20 30 40 50 60 
do
rm -r /home/wzhuo/hadoop-1.1.2/conf/mapred-site.xml;
cp /home/wzhuo/wzhuodata/increbalance/wordcount/reduce$ro/mapred-site.xml /home/wzhuo/hadoop-1.1.2/conf/;

for host in $(</home/wzhuo/wzhuodata/shell/hostlist)
do
echo $host "is starting to copy mapred-site!!!"
ssh wzhuo@$host 'rm /home/wzhuo/hadoop-1.1.2/conf/mapred-site.xml;exit;';
scp /home/wzhuo/hadoop-1.1.2/conf/mapred-site.xml wzhuo@$host:/home/wzhuo/hadoop-1.1.2/conf/;
echo $host "is finished to copy mapred-site!!!!!"
done

sleep 3;
sh /home/wzhuo/hadoop-1.1.2/bin/start-all.sh;
echo "sleep 60!!!"
sleep 60;

for i in 1
do
/home/wzhuo/hadoop-1.1.2/bin/hadoop jar /home/wzhuo/hadoop-1.1.2/nativewordr$ro.jar nativewordcount dataAirline nativewordrun$ro$i;
echo "finished"
sleep 5;
done

sh /home/wzhuo/hadoop-1.1.2/bin/stop-all.sh;
echo "finish native"$ro
done
echo "native all done!"


echo "begin german"
for ro in 20 30 40 50 60
do

rm -r /home/wzhuo/hadoop-1.1.2/conf/mapred-site.xml;
cp /home/wzhuo/wzhuodata/increbalance/wordcount/reduce$ro/mapred-site.xml /home/wzhuo/hadoop-1.1.2/conf/;

for host in $(</home/wzhuo/wzhuodata/shell/hostlist)
do
echo $host "is starting to copy mapred-site!!!"
ssh wzhuo@$host 'rm /home/wzhuo/hadoop-1.1.2/conf/mapred-site.xml;exit;';
scp /home/wzhuo/hadoop-1.1.2/conf/mapred-site.xml wzhuo@$host:/home/wzhuo/hadoop-1.1.2/conf/;
echo $host "is finished to copy mapred-site!!!!!"
done


rm -r /home/wzhuo/hadoop-1.1.2/hadoop-core-*;
cp /home/wzhuo/wzhuodata/increbalance/wordcount/reduce$ro/hadoop-core-1.1.3-german$ro.jar /home/wzhuo/hadoop-1.1.2/;

for host in $(</home/wzhuo/wzhuodata/shell/hostlist)
do
echo $host "is starting to copy!!!"
ssh wzhuo@$host 'rm /home/wzhuo/hadoop-1.1.2/hadoop-core-*.jar;exit;';
scp /home/wzhuo/hadoop-1.1.2/hadoop-core-*.jar wzhuo@$host:/home/wzhuo/hadoop-1.1.2/;
echo $host "is finished to copy!!!!!"
done

sleep 3;
for i in 1
do
sh /home/wzhuo/hadoop-1.1.2/bin/start-all.sh;
echo "sleep 60!!"
sleep 60;
/home/wzhuo/hadoop-1.1.2/bin/hadoop jar /home/wzhuo/hadoop-1.1.2/germanwordr$ro.jar wordcount dataAirline germanwordrun$ro$i;
echo "finished"
sleep 3;
sh /home/wzhuo/hadoop-1.1.2/bin/stop-all.sh;
sleep 3;
done

done

echo "all done!!!"

