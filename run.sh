#!/bin/bash

Link="https://shared.zyc-files.workers.dev/0:/miui_BEGONIAININGlobal_V12.0.2.0.QGGINXM_6d7b066360_10.0.zip"
FileName="miui_BEGONIAININGlobal_V12.0.2.0.QGGINXM_6d7b066360_10.0.zip"
apt-get -y update && apt-get -y upgrade && apt-get install -y unace unrar zip unzip p7zip-full p7zip-rar sharutils rar uudeview mpack arj cabextract file-roller device-tree-compiler liblzma-dev python3 python3-pip brotli liblz4-tool axel gawk aria2 detox wget
pip3 install backports.lzma protobuf pycrypto docopt
wget "$Link" -O "$FileName"
bash dumpyara.sh "$FileName" "$GIT_SECRET" "$BOT_TOKEN"