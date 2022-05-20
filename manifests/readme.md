
```
bosh -d openjdk-test deploy openjdk-test.yaml

bosh -d openjdk-test ssh -c "/var/vcap/packages/openjdk-8/bin/java -version"
bosh -d openjdk-test ssh -c "/var/vcap/packages/openjdk-11/bin/java -version"
bosh -d openjdk-test ssh -c "/var/vcap/packages/openjdk-17/bin/java -version"

```