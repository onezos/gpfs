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
