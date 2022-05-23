# OpenJDK BOSH Release

This BOSH release contains [Liberica JDK](https://bell-sw.com/pages/downloads/), versions: 17, 11 and 8.

## How to use it

```yaml
---
name: my_solution
instance_groups:
- name: my_java_app
  azs: [z1]
  instances: 1
  vm_type: default
  stemcell: default
  networks: [{name: default}]
  jobs:
  - name: my_java_app
    release: my_java_app
    properties:
      nexus:
        java_home: "/var/vcap/packages/openjdk-17"
  - name: openjdk-17
    release: openjdk

releases:
- name: my_java_app
  version: latest
- name: openjdk
  version: 17.0.0
  url: https://github.com/kinjelom/openjdk-boshrelease/releases/download/17.0.0/openjdk-boshrelease-17.0.0.tgz
  sha1: b79d7faeee09d4b979651e54ba39ba5177e7ec41
```


## Creating your custom release

1. Clone repo
2. Make your changes
3. Release it:
```
./add-blobs.sh
bosh create-release --name=openjdk --force --timestamp-version --tarball=/tmp/openjdk-boshrelease.tgz && bosh upload-release /tmp/openjdk-boshrelease.tgz 
```

https://bosh.io/docs/create-release/
