#!/usr/bin/env sh

set -v
. ios-env.sh

TAG=$1

[ -z "$1" ] && TAG=master

ARCHIVE="openssh-${ARCH}-${TAG}.zip"
echo ${ARCHIVE}

TARGETS=(
    scp
    sftp
    sftp-server
    ssh
    ssh-add
    ssh-agent
    ssh-keygen
    ssh-keyscan
    ssh-keysign
    ssh-pkcs11-helper
    sshd
)

cd ./openssh-portable

for f in ${TARGETS[@]}
do
  echo "signing $f"
  ldid -S "$f"
done

zip -r "../${ARCHIVE}" ${TARGETS[@]}
