#!/bin/bash

#!/bin/sh

DIR=`pwd`

mkdir -p .downloads

cd .downloads


JDK_VERSION=1.8.0_181

if [ ! -f ${DIR}/blobs/java/openjdk-${JDK_VERSION}.tar.gz ];then
    curl -L -O -J https://download.run.pivotal.io/openjdk-jdk/trusty/x86_64/openjdk-${JDK_VERSION}.tar.gz
    bosh add-blob --dir=${DIR} openjdk-${JDK_VERSION}.tar.gz java/openjdk-${JDK_VERSION}.tar.gz
fi

cd -
