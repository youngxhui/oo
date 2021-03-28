$GO_TARGET="boot/protos"
$DART_TARGET="rocket/lib/protos"
$NG_TARGET="ng/lib/src/generated"
$GO_COMMON_TARGET="boot/protos/common"
$DART_GOOGLE_API_TARGET="rocket/lib/google/protobuf"
$JAVA_TARGET="bootstrap/build/generated/source/proto/main/grpc"
Write-Output("📦开始编译")
Get-ChildItem .\protos -Include *.proto -Recurse | ForEach-Object -Process {
    if ($_ -is [System.IO.FileInfo]) {
        $name=$_.name
        # 编译 Go
        Write-Output("🏗 "+$name)
        protoc -I protos/. protos/$name --go_out=plugins=grpc:$GO_TARGET
        protoc --dart_out=grpc:$DART_TARGET -I protos/. protos/$name
    }
}
Write-Output("🎉完成编译")