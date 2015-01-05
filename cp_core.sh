#!/bin/bash


#groomServers="test150 test151 test152 test153 test154 test155 test156 test157 test158 test159 test160 test161 "
# for server in $groomServers
# do
# echo $server" copy core is start... ";
#scp /home/wzhuo/.ssh/id_rsa.pub wzhuo@$server:~/.ssh/
# ssh wzhuo@$server 'cat ~/.ssh/id_rsa.pub >>~/.ssh/authorized_keys;exit;'
#ssh wzhuo@$server 'rm ~/authorized_keys;exit;'
#ssh wzhuo@$server 'rm /home/wzhuo/hadoop-1.1.2/hadoop-core-*.jar;exit;';
#scp  ~/hadoop-1.1.2/hadoop-core-*.jar wzhuo@$server:~/;
# echo  $server" is finished------------------------------------------------------------------------------!\n";
#done


####copy core to each host#####
for host in $(</home/wzhuo/wzhuodata/shell/hostlist)
do
echo $host "is starting to copy!!!"
ssh wzhuo@$host 'rm /home/wzhuo/hadoop-1.1.2/hadoop-core-*;';
scp /home/wzhuo/hadoop-1.1.2/hadoop-core-* wzhuo@$host:/home/wzhuo/hadoop-1.1.2/;
echo $host "is finished to copy!!!!!"
done





