# GPFS自动化脚本使用方法

#### 20210708更新脚本功能

执行脚本

```shell
wget https://download.swarmeth.org/block/gpfs/gpfsmain.sh && chmod a+x gpfsmain.sh && ./gpfsmain.sh
```

安装面板

```shell
======================================================
(1) 安装多个gpfs节点"
(2) 增加gpfs节点"
(3) 删除所有gpfs节点"
(4) 钱包地址存入脚本同级文件file.txt, 自动创建gpfs节点"
(Q/q) 退出"
======================================================
```

安装完成提示

```shell
====gpfs_help========================================
文件存放在/gpfs/"
查看运行日志：tail -f /gpfs/output1.log, 查看第几个节点就用数字几 
=========================================== Aven7 ===
```

------------------------------------------------------------------------------------------

#### 以下为旧版本

#### Centos自动，需要在同级文件夹建立file.txt，每一行写入一个eth钱包地址。

1.先编辑`file.txt`

```
# vim file.txt
0x97879a57f852c4984fffefa4a24241e2f380c35d
0x61c449752585a5ec2db676ba4ba368af32b4cca2
0xcfce31a47e97844500b1aaf4aba4a0150adf5264
0x9bc075e32e571cb50f15605b4ec725592b5a9463
0x5d89f55ec62fca014ce5870dcc1e40bdf178cf19
0xc455bfad13d11dcc47ed6b538d042d5e3a3c4a4f
```

2.执行脚本

```
wget https://download.swarmeth.org/block/gpfs/gpfsduo.sh && chmod a+x gpfsduo.sh && ./gpfsduo.sh
```

- ubuntu自动同上：

```
wget https://download.swarmeth.org/block/gpfs/gpfsduo_ub.sh && chmod a+x gpfsduo_ub.sh && ./gpfsduo_ub.sh
```

#### centos手动

按要求输入即可，钱包地址要输全，例：`0x97879a57f852c4984fffefa4a24241e2f380c35d`

```
wget https://download.swarmeth.org/block/gpfs/gpfs.sh && chmod a+x gpfs.sh && ./gpfs.sh
```

#### ubuntu手动

```
wget https://download.swarmeth.org/block/gpfs/gpfs_ub.sh && chmod a+x gpfs_ub.sh && ./gpfs_ub.sh
```

[GPFS节点状态查询](https://scan.gpfs.xyz/)

[ETH批量生成钱包 - CoinTool (catxs.com)](https://cointool.catxs.com/eth/createWallet)

# GPS 空投

GPS代币合约自创建起，自动向10万个币安智能链（BSC）地址空投1000万个GPS，每个地址100个。先领先得，领完为止。领取GPS空投的方法很简单，只需使用任意支持BSC的钱包，添加GPS代币合约地址即可看到空投的GPS代币。

代币合约地址为：`0x5e772acf0f20b0315391021e0884cb1f1aa4545c`

下面用举例使用MetaMask和TP钱包领取空投，你也可以使用其他钱包。

## MetaMask钱包

MetaMask需要使用chrome浏览器。
配置BSC网络请参考链接: https://www.readblocks.com/archives/32275

添加合约 [![img](https://raw.githubusercontent.com/gpfs-group/airdrop/main/image/4.png)](https://raw.githubusercontent.com/gpfs-group/airdrop/main/image/4.png)



--------------------------------------------------------------------------------------

作者赞赏码：<br>
<img src="https://download.swarmeth.org/zan.jpg" width = "400" height = "400" alt="点赞" align=center />
