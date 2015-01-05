#!/bin/bash
####copy map-conf to each host#####
for host in $(</home/wzhuo/wzhuodata/shell/hostlist)
do
echo $host "is starting to copy my-conf!!!"
ssh wzhuo@$host 'rm /home/wzhuo/hadoop-1.1.2/conf/hdfs-site.xml;exit;';
scp /home/wzhuo/hadoop-1.1.2/conf/hdfs-site.xml wzhuo@$host:/home/wzhuo/hadoop-1.1.2/conf/;
echo $host "is finished to copy my-conf!!!!!"
done

