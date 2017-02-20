#!/usr/bin/env bash

apt-get update
apt-get install -y python python-sklearn python-skimage python-scikits-learn cmake python-tk
apt-get install -y bc libatlas-base-dev libprotobuf-dev libleveldb-dev libsnappy-dev libopencv-dev libboost-all-dev libhdf5-serial-dev
apt-get install -y libgflags-dev libgoogle-glog-dev liblmdb-dev protobuf-compiler  expect-dev
apt-get install -y git
apt-get install -y r-base-core

rm -rf /usr/local/caffe
git clone https://github.com/BVLC/caffe /usr/local/caffe

#chown -R vagrant:vagrant ~/.ipython
chown -R vagrant:vagrant /usr/local/caffe/.*

cd /usr/local/caffe

# make sure we do not use the gpu
sed -e 's/# CPU_ONLY/CPU_ONLY/' Makefile.config.example >  Makefile.config
chown -R vagrant:vagrant /usr/local/caffe/

mkdir /usr/local/caffe/build
cd /usr/local/caffe/build
cmake ..

make -j2 all
make -j2 test
make -j2 runtest
make install


