FROM centos:7
LABEL maintainer="Aven7"
LABEL version="1.0"
LABEL description="gpfs docker mining"
RUN  yum install -y wget \
   && yum install -y unzip \
   && mkdir /gpfs \
   && cd /gpfs \
   && wget -O /gpfs/linux_amd64.zip https://github.com/gpfs-group/gpfs-mining/releases/download/v0.8.1/linux_amd64.zip \
   && unzip /gpfs/linux_amd64.zip \
   && chmod 766 /gpfs/linux_amd64/gpfs \
   && export IPFS_PATH=/gpfs/ \
   && cp /gpfs/linux_amd64/gpfs /usr/local/bin/ \
   && echo "nohup gpfs daemon --init --miner-address=0x6a3f3D5F8975AB600b5428a6f79b6d3A706bead4 &" >/gpfs/gpfs.sh \
   && chmod a+x /gpfs/gpfs.sh
ENTRYPOINT ["/gpfs/gpfs.sh"]
EXPOSE 4001 5001 8080