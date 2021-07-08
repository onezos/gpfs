#!/bin/bash

yum install -y wget
yum install -y unzip 
mkdir /gpfs
cd /gpfs 
wget -O /gpfs/linux_amd64.zip https://github.com/gpfs-group/gpfs-mining/releases/download/v0.8.1/linux_amd64.zip
unzip /gpfs/linux_amd64.zip 
chmod 766 /gpfs/linux_amd64/gpfs
cp /gpfs/linux_amd64/gpfs /usr/local/bin/

echo "请输入要搭建的gpfs节点数量"
read tCnt
for ((i=1; i<=tCnt; i ++))
    do  
        echo "请输入你的0x开头的钱包地址："
        read qb
        mkdir /gpfs/gpfs${i}
        cd /gpfs/gpfs${i}
        export IPFS_PATH=/gpfs/gpfs${i}
        gpfs daemon --init
        sleep 3 
        if (("$i" < 9)); then
            sed -i "s/8080/600${i}/g" /gpfs/gpfs${i}/config
            sed -i "s/4001/400${i}/g" /gpfs/gpfs${i}/config
	        sed -i "s/5001/500${i}/g" /gpfs/gpfs${i}/config
#        else 
#           sed -i "s/8080/60${i}/g" /gpfs/gpfs${i}/config
#           sed -i "s/4001/40${i}/g" /gpfs/gpfs${i}/config
#           sed -i "s/5001/50${i}/g" /gpfs/gpfs${i}/config
        fi
        nohup --miner-address=$qb >> /usr/local/node/output${i}/.log 2>&1 &
    done