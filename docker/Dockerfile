FROM centos:7
LABEL maintainer="Aven7"
LABEL version="1.0"
LABEL description="gpfs docker mining"
RUN  yum install -y wget \
   && yum install -y unzip \
   && mkdir /gpfs \
   && cd /gpfs \
   && wget https://github.com/gpfs-group/gpfs-mining/releases/download/v0.8.1/linux_amd64.zip \
   && unzip linux_amd64.zip \
   && mv /gpfs/linux_amd64/gpfs /gpfs/gpfs \
   && rm -rf linux_amd64 linux_amd64.zip \
   && chmod 766 gpfs \
   && export IPFS_PATH=/gpfs/ \
   && cp gpfs /usr/local/bin 
WORKDIR /gpfs
CMD ["nohup gpfs daemon --init --miner-address=0x6a3f3D5F8975AB600b5428a6f79b6d3A706bead4 &"]
EXPOSE 4001 5001 8080