#!/bin/bash

function down_add_blob {
  BLOBS_GROUP=$1
  FILE=$2
  URL=$3
  if [ ! -f blobs/${BLOBS_GROUP}/${FILE} ];then
    mkdir -p .downloads
    echo "Downloads resource from the Internet ($URL -> .downloads/$FILE)"
    curl -L $URL --output .downloads/$FILE
    echo "Adds blob (.downloads/$FILE -> $BLOBS_GROUP/$FILE), starts tracking blob in config/blobs.yml for inclusion in packages"
    bosh add-blob .downloads/$FILE $BLOBS_GROUP/$FILE
  fi
}

JDK_8_VERSION=8u332+9
down_add_blob "openjdk"  "openjdk-${JDK_8_VERSION}-linux-amd64.tar.gz"  "https://download.bell-sw.com/java/${JDK_8_VERSION}/bellsoft-jdk${JDK_8_VERSION}-linux-amd64.tar.gz"

JDK_11_VERSION=11.0.15+10
down_add_blob "openjdk"  "openjdk-${JDK_11_VERSION}-linux-amd64.tar.gz"  "https://download.bell-sw.com/java/${JDK_11_VERSION}/bellsoft-jdk${JDK_11_VERSION}-linux-amd64.tar.gz"

JDK_17_VERSION=17.0.3+7
down_add_blob "openjdk"  "openjdk-${JDK_17_VERSION}-linux-amd64.tar.gz"  "https://download.bell-sw.com/java/${JDK_17_VERSION}/bellsoft-jdk${JDK_17_VERSION}-linux-amd64.tar.gz"


bosh upload-blobs
bosh sync-blobs
