#!/usr/bin/env sh

[ ! -f ./openssh-portable/config.h ] && sh -x ./configure-for-ios.sh

# patch sftp-server Handle (conflicting with MacTypes.h)
[ ! -f ./openssh-portable/sftp-server.c.bak ] && \
  sed -i.bak 's/Handle/SHandle/g' ./openssh-portable/sftp-server.c

NPROCS=$(sysctl hw.ncpu | awk '{print $2}')
. ./ios-env.sh
cd ./openssh-portable && make clean && make -j${NPROCS} all

