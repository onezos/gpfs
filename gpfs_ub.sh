#!/bin/bash

function print_tips
{
    echo "********************************************"
    echo "(1) 安装多个gpfs节点"
    echo "(2) 删除所有gpfs节点"
    echo "(Q/q) 退出"
    echo "********************************************"
}

function gpfs_rm
{
    rm -rf /gpfs
}

function gpfs_down
{
    apt install -y wget
    apt install -y unzip 
    mkdir /gpfs
    cp $(pwd)/file.txt /gpfs/
    cd /gpfs 
    wget -O /gpfs/linux_amd64.zip https://github.com/gpfs-group/gpfs-mining/releases/download/v0.8.1/linux_amd64.zip
    unzip /gpfs/linux_amd64.zip 
    chmod 766 /gpfs/linux_amd64/gpfs
    cp /gpfs/linux_amd64/gpfs /usr/local/bin/
}


function gpfs_duo
{
    echo "请输入要搭建的gpfs节点数量"
    read tCnt
    for ((i=1; i<=tCnt; i ++))
        do  
            echo "请输入你的0x开头的钱包地址："
            read qb
            mkdir /gpfs/gpfs${i}
            cd /gpfs/gpfs${i}
            export IPFS_PATH=/gpfs/gpfs${i}
            echo "设置环境变量IPFS_PATH=$IPFS_PATH"
            gpfs daemon --init  >& /gpfs/gpfs${i}/output.log
            sleep 3 
            if (("$i" < 9)); then
                sed -i "s/8080/600${i}/g" /gpfs/gpfs${i}/config
                sed -i "s/4001/700${i}/g" /gpfs/gpfs${i}/config
    	        sed -i "s/5001/900${i}/g" /gpfs/gpfs${i}/config
            else 
                sed -i "s/8080/60${i}/g" /gpfs/gpfs${i}/config
                sed -i "s/4001/40${i}/g" /gpfs/gpfs${i}/config
                sed -i "s/5001/50${i}/g" /gpfs/gpfs${i}/config
           fi
           sleep 1
           nohup gpfs daemon --init --miner-address=$qb > /gpfs/output${i}.log 2>&1 &
           echo "gpfs${i}已部署完成，日志查看tail -f /gpfs/output${i}.log"
        done
}

function gpfs_help
{
    echo "======================================================"
    echo "查看第几个节点就用数字几："
    echo "查看运行日志：tail -f /gpfs/output1.log "
    echo "文件存放在/gpfs/"
    echo "=========================================== Aven7 ==="
}

while true
do
    print_tips
    read -p "请输入你的选项(1|2|q|Q):" choice
 
    case $choice in
        1)
            gpfs_down
            gpfs_duo
            gpfs_help
            exit
            ;;
        2)
            gpfs_rm
            ;;
        q|Q)
            exit
            ;;
        *)
            echo "Error,input only in {1|2|q|Q}"
            ;;
    esac
done