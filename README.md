# GPFS自动化脚本使用方法

#### centos自动，需要在同级文件夹建立file.txt，每一行写入一个eth钱包地址。

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

