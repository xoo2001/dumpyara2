#!/bin/bash
TAGS="android-10.0.0_r47"
gcc64="$(pwd)/gcc64Folder"
gcc32="$(pwd)/gcc32Folder"
git clone https://android.googlesource.com/platform/prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9 -b "$TAGS" "$gcc64" --depth=1
git clone https://android.googlesource.com/platform/prebuilts/gcc/linux-x86/arm/arm-linux-androideabi-4.9 -b "$TAGS" "$gcc32" --depth=1

cd $gcc64
git tag -d $TAGS
git config user.name ZyCromerZ
git config user.email neetroid97@gmail.com
git checkout --orphan $TAGS
git add . && git commit -s -m "add files from https://android.googlesource.com/platform/prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9/+/refs/tags/$TAGS"
sed -i "s/self.print_deprecation_warning.*/ /g" "./bin/aarch64-linux-android-gcc" && \
git add . && git commit -s -m 'bin: aarch64-linux-android-gcc: remove warning message'
git remote add up https://$GIT_SECRET@github.com/ZyCromerZ/aarch64-linux-android-4.9.git && git push -f up "$TAGS"

cd $gcc32
git tag -d $TAGS
git config user.name ZyCromerZ
git config user.email neetroid97@gmail.com
git checkout --orphan $TAGS
git add . && git commit -s -m "add files from https://android.googlesource.com/platform/prebuilts/gcc/linux-x86/arm/arm-linux-androideabi-4.9/+/refs/tags/$TAGS"
sed -i "s/self.print_deprecation_warning.*/ /g" "./bin/arm-linux-androideabi-gcc" && \
git add . && git commit -s -m 'bin: arm-linux-androideabi-gcc: remove warning message'
git remote add up https://$GIT_SECRET@github.com/ZyCromerZ/arm-linux-androideabi-4.9.git && git push -f up "$TAGS"

cd ..
rm -rf $gcc64
rm -rf $gcc32