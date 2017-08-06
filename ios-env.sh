#!/usr/bin/env sh

SDK=iPhoneOS.sdk
ARCH=arm64
PLATFORM=iPhoneOS.platform
DEVELOPER=$(xcode-select -print-path)
FRAMEWORKS=()

export SDKROOT="${DEVELOPER}/Platforms/${PLATFORM}/Developer/SDKs/${SDK}"
export CC="gcc -arch ${ARCH}"
#export CC="gcc -arch ${ARCH}\
#  -F ${DEVELOPER}/Platforms/${PLATFORM}/Developer/SDKs/$SDK/System/Library/Frameworks \
#  -I ${DEVELOPER}/Platforms/${PLATFORM}/DeviceSupport/Latest/Symbols/usr/include  \
#  -L ${DEVELOPER}/Platforms/${PLATFORM}/Developer/SDKs/$SDK/usr/lib"

