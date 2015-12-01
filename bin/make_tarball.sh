#!/bin/bash

mkdir -p tmp/$1/etc
cp $1/assets/etc/hosts tmp/$1/etc/hosts
cp $1/assets/etc/timezone tmp/$1/etc/timezone
TAR=bsdtar
which bsdtar &>/dev/null || TAR=tar
${TAR} -C tmp/$1 -czf ${1}.tar.gz etc @../${1}.tar
