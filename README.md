项目采用 GRPC 作为通信。



## Dart

```sh
protoc --dart_out=grpc:rocket/lib/src/generated -Iprotos protos/helloworld.proto
```

