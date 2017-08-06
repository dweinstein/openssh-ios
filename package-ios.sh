#!/usr/bin/env sh

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

cd ./openssh-portable && zip -r ../release.zip ${TARGETS[@]}
