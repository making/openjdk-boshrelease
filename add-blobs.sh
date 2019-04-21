#!/bin/bash

#!/bin/sh

DIR=`pwd`

mkdir -p .downloads

cd .downloads


JDK_VERSION=11.0.3_07

if [ ! -f ${DIR}/blobs/java/openjdk-${JDK_VERSION}.tar.gz ];then
    curl -L -O -J https://download.run.pivotal.io/openjdk-jdk/bionic/x86_64/openjdk-jdk-${JDK_VERSION}-bionic.tar.gz
    bosh add-blob --dir=${DIR} openjdk-jdk-${JDK_VERSION}-bionic.tar.gz java/openjdk-${JDK_VERSION}.tar.gz
fi

cd -
