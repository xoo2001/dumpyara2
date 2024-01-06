#!/bin/bash

# Link="https://gcc-drive.zyc-files.workers.dev/1:/miui_BEGONIAIDGlobal_V12.5.2.0.RGGIDXM_c690ecd789_11.0.zip"
# GDid="1SwFDVKkvHmBRUwf3lizheSu_H9zSiD4a"
# FileName="$(pwd)/memeui.zip"
Link="${1}"
FileName="${2}"
Type="${3}"

if [[ -z "${GIT_SECRET}" ]] && [[ -z "${BOT_TOKEN}" ]];then
    echo "token null"
    exit
fi

export DEBIAN_FRONTEND=noninteractive
sudo apt-get -y update && sudo apt-get -y upgrade && sudo apt-get install -y unace unrar zip unzip p7zip-full p7zip-rar sharutils rar uudeview mpack arj cabextract device-tree-compiler liblzma-dev python3 python3-pip brotli liblz4-tool axel gawk aria2 detox cpio rename wget liblz4-dev curl python3-venv
# python3 -m venv .venv
# source .venv/bin/activate
# "$PIP" install aospdtgen backports.lzma extract-dtb protobuf pycryptodome docopt zstandard

CurrentFolder=$(pwd)

if [[ "$Type" == "gd" ]];then
    echo "download ${FileName} files, it takes some minutes, maybe"
    wget --quiet --load-cookies cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id='${Link} -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=${Link}" -O "$FileName" && rm -rf cookies.txt
elif [[ "$Type" == "url" ]];then
    echo "download ${FileName} files, it takes some minutes, maybe"
    wget --quiet "$Link" -O "$FileName"
else
    echo "url type error, only 'gd' and 'url' can be used"
fi

bash dumpyara.sh "$FileName" "${GIT_SECRET}" "${BOT_TOKEN}"

cd "$CurrentFolder" && rm -rf "$CurrentFolder/*"