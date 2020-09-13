#!/bin/bash

apt-get -y update && apt-get -y upgrade && apt-get install -y unace unrar zip unzip p7zip-full p7zip-rar sharutils rar uudeview mpack arj cabextract file-roller device-tree-compiler liblzma-dev python3 python3-pip brotli liblz4-tool axel gawk aria2 detox wget
pip3 install backports.lzma protobuf pycrypto docopt
wget "https://shared.zyc-files.workers.dev/0:/miui_BEGONIA_20.9.10_c84222bc2b_10.0.zip" -O miui_BEGONIA_20.9.10_c84222bc2b_10.0.zip
bash dumpyara.sh miui_BEGONIA_20.9.10_c84222bc2b_10.0.zip "$GIT_SECRET" "$BOT_TOKEN"