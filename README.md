项目采用 GRPC 作为通信。



## Dart

```sh
protoc --dart_out=grpc:rocket/lib/src/generated/protos -Iprotos protos/hello.proto

protoc -I protos/ protos/hello.proto --dart_out=grpc:rocket/lib/src/generated
```

## Go

```sh
protoc -I . protos/hello.proto --go_out=plugins=grpc:boot/protos
```

