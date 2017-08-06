#!/bin/sh
#set -x
set -v

source ios-env.sh

cd openssh-portable

autoconf

autoheader

./configure \
  --build=aarch64-apple-darwin \
  --host=x86_64-apple-darwin \
  --without-openssl \
  --without-openssl-header-check \
  --disable-utmp \
  --disable-libutil \
  --disable-pututline \
  --with-sandbox=no \
  --with-default-path="/usr/bin:/bin:/usr/sbin:/sbin" \
  --with-cppflags="-I/usr/local/opt/openssl/include"


