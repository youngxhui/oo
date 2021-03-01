$GO_TARGET="boot/protos"
$DART_TARGET="rocket/lib/src/generated"
$NG_TARGET="ng/lib/src/generated"

Write-Output("📱 Flutter, 🐹 Golang, 🛡 Angular")
Write-Output("📦开始编译")
Get-ChildItem .\protos -Include *.proto -Recurse | ForEach-Object -Process {
    if ($_ -is [System.IO.FileInfo]) {
        $name=$_.name
        # 编译 Go
        protoc -I . protos/$name --go_out=plugins=grpc:$GO_TARGET
    }
}
Write-Output("🎉完成编译")