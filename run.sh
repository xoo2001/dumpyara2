#!/bin/bash

apt-get -y update && apt-get -y upgrade && apt-get install -y unace unrar zip unzip p7zip-full p7zip-rar sharutils rar uudeview mpack arj cabextract file-roller device-tree-compiler liblzma-dev python3 python3-pip brotli liblz4-tool axel gawk aria2 detox wget
pip3 install backports.lzma protobuf pycrypto docopt

TAGS="android-10.0.0_r47"
gcc64="$(pwd)/gcc64Folder"
gcc32="$(pwd)/gcc32Folder"
wget "https://android.googlesource.com/platform/prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9/+archive/84fb09fafc92a3d9b4d160f049d46c3c784cc941.tar.gz" -O "$gcc64/file.tar.gz"
wget "https://android.googlesource.com/platform/prebuilts/gcc/linux-x86/arm/arm-linux-androideabi-4.9/+archive/5a8beef7b1aa2c8ca0dfe4a00358559d12dfa3b6.tar.gz" -O "$gcc32/file.tar.gz"

cd $gcc64
tar -zxvf file.tar.gz && rm -rf file.tar.gz
git init
git config user.name ZyCromerZ
git config user.email neetroid97@gmail.com
git checkout -b $TAGS
git add . && git commit -s -m "add files from https://android.googlesource.com/platform/prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9/+/refs/tags/$TAGS"
sed -i "s/self.print_deprecation_warning.*/ /g" "./bin/aarch64-linux-android-gcc" && \
git add . && git commit -s -m 'bin: aarch64-linux-android-gcc: remove warning message'
git remote add origin https://$GIT_SECRET@github.com/ZyCromerZ/aarch64-linux-android-4.9 && git push -f origin $TAGS

cd $gcc32
tar -zxvf file.tar.gz && rm -rf file.tar.gz
git init
git config user.name ZyCromerZ
git config user.email neetroid97@gmail.com
git checkout -b $TAGS
git add . && git commit -s -m "add files from https://android.googlesource.com/platform/prebuilts/gcc/linux-x86/arm/arm-linux-androideabi-4.9/+/refs/tags/$TAGS"
sed -i "s/self.print_deprecation_warning.*/ /g" "./bin/arm-linux-androideabi-gcc" && \
git add . && git commit -s -m 'bin: arm-linux-androideabi-gcc: remove warning message'
git remote add origin https://$GIT_SECRET@github.com/ZyCromerZ/arm-linux-androideabi-4.9 && git push -f origin $TAGS

cd ..
rm -f $gcc64
rm -f $gcc32