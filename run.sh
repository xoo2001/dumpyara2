#!/bin/bash

Link="https://hugeota.d.miui.com/20.10.19/miui_BEGONIA_20.10.19_ed7c98faae_10.0.zip"
FileName="$(pwd)/miui_BEGONIA_20.10.19_ed7c98faae_10.0.zip"
apt-get -y update && apt-get -y upgrade && apt-get install -y unace unrar zip unzip p7zip-full p7zip-rar sharutils rar uudeview mpack arj cabextract file-roller device-tree-compiler liblzma-dev python3 python3-pip brotli liblz4-tool axel gawk aria2 detox wget
pip3 install backports.lzma protobuf pycrypto docopt

CurrentFolder=$(pwd)

wget "$Link" -O "$FileName"
git clone https://"$GIT_OAUTH_TOKEN"@github.com/ZyCromerZ/gdrive_uploader for-upload
cd for-upload
chmod +x run.sh
. run.sh "$FileName" doc "$(date +'%m-%d-%Y')-Memeui-ROM"
cd $CurrentFolder
rm -rf for-upload

bash dumpyara.sh "$FileName" "$GIT_SECRET" "$BOT_TOKEN"

cd "$CurrentFolder"

git clone https://"$GIT_OAUTH_TOKEN"@github.com/ZyCromerZ/begonia_gpu.git gpu_lib
cd gpu_lib
chmod +x getlib.sh
ZipName="$FileName"
. getlib.sh

cd "$CurrentFolder"

cd for-upload
chmod +x run.sh
. run.sh "$GpuZipName" doc "$(date +'%m-%d-%Y')-Begonia Mali Gpu"

cd "$CurrentFolder" && rm -rf "$CurrentFolder/*"