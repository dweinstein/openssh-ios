#!/usr/bin/env sh

[ ! -f ./openssh-portable/config.h ] && sh -x ./configure-for-ios.sh

case $(md5 ./openssh-portable/sftp-server.c) in
  *5cfcb0a3813ff7993024d026c542669b*)
    sed -i 's/Handle/SHandle/g' ./openssh-portable/sftp-server.c
    break
    ;;
 *)
   echo "skipping sftp-server.c patch"
   break
   ;;
esac

NPROCS=$(sysctl hw.ncpu | awk '{print $2}')
. ./ios-env.sh
cd ./openssh-portable && make clean && make -j${NPROCS} all
