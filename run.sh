#!/bin/bash

Link="https://gcc-drive.zyc-files.workers.dev/1:/miui_BEGONIAIDGlobal_V12.5.2.0.RGGIDXM_c690ecd789_11.0.zip"
GDid="10pNyWcDJ2pQSwKFB_Rm5VF8P__bSlzpm"
FileName="$(pwd)/memeui.zip"
export DEBIAN_FRONTEND=noninteractive
apt-get -y update && apt-get -y upgrade && apt-get install -y unace unrar zip unzip p7zip-full p7zip-rar sharutils rar uudeview mpack arj cabextract device-tree-compiler liblzma-dev python3 python3-pip brotli liblz4-tool axel gawk aria2 detox cpio rename wget
pip3 install backports.lzma extract-dtb protobuf pycrypto docopt zstandard twrpdtgen

CurrentFolder=$(pwd)

if [ ! -z "$Link" ];then
    # wget "$Link" -O "$FileName"
    wget --load-cookies cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id='${GDid} -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=${GDid}" -O "$FileName" && rm -rf cookies.txt
    bash dumpyara.sh "$FileName" "$GIT_SECRET" "$BOT_TOKEN"
fi

cd "$CurrentFolder" && rm -rf "$CurrentFolder/*"