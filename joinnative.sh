#!/bin/bash
for ro in 20 30 40 50 60 
do
rm -r /home/wzhuo/hadoop-1.1.2/conf/mapred-site.xml;
cp /home/wzhuo/wzhuodata/increbalance/join/reduce$ro/mapred-site.xml /home/wzhuo/hadoop-1.1.2/conf/;

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

for i in 1 2 3
do
/home/wzhuo/hadoop-1.1.2/bin/hadoop jar /home/wzhuo/hadoop-1.1.2/nativejoin_dir_r$ro.jar Join_act joinbothdata5X nativejoin$ro$i;
echo "finished"
sleep 5;
done

sh /home/wzhuo/hadoop-1.1.2/bin/stop-all.sh;
echo "finish native"$ro


done
echo "native all done!"

