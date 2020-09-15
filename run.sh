#!/bin/bash

Link="https://shared.zyc-files.workers.dev/0:/begonia_global_images_V12.0.3.0.QGGMIXM_20200902.0000.00_10.0_global_abde420a62.tgz"
FileName="begonia_global_images_V12.0.3.0.QGGMIXM_20200902.0000.00_10.0_global_abde420a62.tgz"
apt-get -y update && apt-get -y upgrade && apt-get install -y unace unrar zip unzip p7zip-full p7zip-rar sharutils rar uudeview mpack arj cabextract file-roller device-tree-compiler liblzma-dev python3 python3-pip brotli liblz4-tool axel gawk aria2 detox wget
pip3 install backports.lzma protobuf pycrypto docopt
echo "downloading files"
wget "$Link" -O "$FileName" >/dev/null
echo "downloading files done . . ."
bash dumpyara.sh "$FileName" "$GIT_SECRET" "$BOT_TOKEN"