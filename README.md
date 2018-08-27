# OpenJDK BOSH Release

```
./add-blobs.sh
bosh create-release --name=openjdk --force --timestamp-version --tarball=/tmp/openjdk-boshrelease.tgz && bosh upload-release /tmp/openjdk-boshrelease.tgz 
```
