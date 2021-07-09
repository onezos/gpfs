#!/bin/bash

function print_tips
{
    echo "======================================================"
    echo "(1) 安装多个gpfs节点"
    echo "(2) 增加gpfs节点"
    echo "(3) 删除所有gpfs节点"
    echo "(4) 钱包地址存入脚本同级文件file.txt, 自动创建gpfs节点"
    echo "(Q/q) 退出"
    echo "======================================================"
}

function gpfs_rm
{
    rm -rf /gpfs
    echo "======================================================"
    echo "所有gpfs文件已经全部删除！"
    echo "======================================================"
}

function gpfs_init
{
    lnx_ver=`uname -a|grep 'Ubuntu'`
    if [ -n "$lnx_ver" ];then
        echo "this is a Ubuntu"
        echo $lnx_ver
        apt install -y wget
        apt install -y unzip
    else
        echo "this is a centos"
        echo $lnx_ver
        yum install -y wget
        yum install -y unzip 
    fi
    mkdir /gpfs
    if [ -f $(pwd)/file.txt ];then
        cp $(pwd)/file.txt /gpfs/
    fi
    cd /gpfs 
    wget -O /gpfs/linux_amd64.zip https://github.com/gpfs-group/gpfs-mining/releases/download/v0.8.1/linux_amd64.zip
    unzip /gpfs/linux_amd64.zip 
    chmod 766 /gpfs/linux_amd64/gpfs
    cp /gpfs/linux_amd64/gpfs /usr/local/bin/
    rm -rf /gpfs/linux_amd64 /gpfs/linux_amd64.zip 
}

function gpfs_new
{
    echo "===gpfs_new==========================================="
    echo "请输入要搭建的gpfs节点数量"
    read tCnt
    echo "开始创建$tCnt个gpfs节点"
    echo "======================================================"
    iCnt=1
    gpfs_main
}

function gpfs_add
{
    echo "====gpfs_add=========================================="
    echo "请输入要增加的gpfs节点数量"
    read tCnt
    echo "开始增加$tCnt个gpfs节点"
    echo "======================================================"
    iCnt=`ls -l /gpfs|grep "gpfs"|wc -l`
    tCnt=$(($iCnt + $tCnt))
    iCnt=$(($iCnt + 1))
    gpfs_main
}

function gpfs_main
{
    for ((i=iCnt; i<=tCnt; i ++))
        do  
            echo "===gpfs_main=========================================="
            echo "请输入你的0x开头的钱包地址："
            read qb
            echo "您的钱包地址是$qb"
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
           echo "gpfs${i}已部署完成，日志查看: tail -f /gpfs/output${i}.log"
           echo "======================================================"
        done
}

function gpfs_file_main
{
    tCnt=`awk 'END{print NR}' /gpfs/file.txt`
    for ((i=1; i<=tCnt; i ++))
        do  
            echo "===gpfs_file_main====================================="
            qb=`cat /gpfs/file.txt | sed -n "${i}p"`
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
           echo "gpfs${i}已部署完成，日志查看: tail -f /gpfs/output${i}.log"
           echo "======================================================"
        done
}

function gpfs_help
{
    echo "====gpfs_help========================================"
    echo "文件存放在/gpfs/"
    echo "查看运行日志：tail -f /gpfs/output1.log, 查看第几个节点就用数字几 "
    echo "=========================================== Aven7 ==="
}

while true
do
    print_tips
    read -p "请输入你的选项(1|2|3|4|q|Q):" choice
 
    case $choice in
        1)
            gpfs_init
            gpfs_new
            gpfs_help
            exit
            ;;
        2)
            gpfs_add
            exit
            ;;
        3)
            gpfs_rm
            ;;
        4)
            gpfs_file_main
            exit
            ;;
        q|Q)
            exit
            ;;
        *)
            echo "Error,input only in {1|2|3|4|q|Q}"
            ;;
    esac
done