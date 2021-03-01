项目采用 GRPC 作为通信。



## Dart

```sh
protoc --dart_out=grpc:rocket/lib/src/protos -Iprotos protos/helloworld.proto
```

## Go

```sh
protoc -I . protos/hello.proto --go_out=plugins=grpc:boot/protos
```

