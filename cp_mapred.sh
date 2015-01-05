#!/bin/bash


#groomServers="test151 test152 test153 test154 test155 test156 test157 test158 test159 test160 test161 "
# for server in $groomServers
# do
# echo $server" copy mapred-site.xml is start... ";
#scp /home/wzhuo/.ssh/id_rsa.pub wzhuo@$server:~/.ssh/
# ssh wzhuo@$server 'rm ~/hadoop-1.1.2/conf/mapred-site.xml;
#		exit;'
#scp ~/hadoop-1.1.2/conf/mapred-site.xml wzhuo@$server:~/hadoop-1.1.2/conf/
#ssh wzhuo@$server 'rm ~/authorized_keys;exit;'
#scp -r ~/hadoop-1.1.2 wzhuo@$server:~/;
# echo  $server" is finished------------------------------------------------------------------------------!\n";
#done


####copy map-site to each host#####
for host in $(</home/wzhuo/wzhuodata/shell/hostlist)
do
echo $host "is starting to copy mapred-site!!!"
ssh wzhuo@$host 'rm /home/wzhuo/hadoop-1.1.2/conf/mapred-site.xml;exit;';
scp /home/wzhuo/hadoop-1.1.2/conf/mapred-site.xml wzhuo@$host:/home/wzhuo/hadoop-1.1.2/conf/;
echo $host "is finished to copy mapred-site!!!!!"
done

