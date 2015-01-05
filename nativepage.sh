#!/bin/bash
sh /home/wzhuo/hadoop-1.1.2/bin/start-all.sh;
echo "sleep 60"
sleep 60

for i in $(seq 1 3)
do
/home/wzhuo/hadoop-1.1.2/bin/hadoop dfs -rmr pageranktwitter_newout01
/home/wzhuo/hadoop-1.1.2/bin/hadoop jar /home/wzhuo/hadoop-1.1.2/nativepager30.jar Pagerank
sleep 10
done
echo "native reduce 30 are finished"

sh /home/wzhuo/hadoop-1.1.2/bin/stop-all.sh;

cp /home/wzhuo/wzhuodata/example/pagerank/mapred-site.xml /home/wzhuo/hadoop-1.1.2/conf/;

for host in $(</home/wzhuo/wzhuodata/shell/hostlist)
do
echo $host "is starting to copy mapred-site!!!"
ssh wzhuo@$host 'rm /home/wzhuo/hadoop-1.1.2/conf/mapred-site.xml;exit;';
scp /home/wzhuo/wzhuodata/example/pagerank/mapred-site.xml wzhuo@$host:/home/wzhuo/hadoop-1.1.2/conf/;
echo $host "is finished to copy mapred-site!!!!!"
done

sh /home/wzhuo/hadoop-1.1.2/bin/start-all.sh;
echo "sleep 60"
sleep 60

for i in $(seq 1 3)
do
/home/wzhuo/hadoop-1.1.2/bin/hadoop dfs -rmr pageranktwitter_newout01
/home/wzhuo/hadoop-1.1.2/bin/hadoop jar /home/wzhuo/hadoop-1.1.2/nativepager50.jar Pagerank;
sleep 10
done
echo "native finished"

echo "all done!!!"

