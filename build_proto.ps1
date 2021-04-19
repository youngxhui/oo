$GO_TARGET="boot"
$DART_TARGET="rocket/lib/protos"
$NG_TARGET="fly/src/proto"
$GO_COMMON_TARGET="boot/protos/common"
$DART_GOOGLE_API_TARGET="rocket/lib/google/protobuf"
$JAVA_TARGET="bootstrap/build/generated/source/proto/main/grpc"

Write-Output("♻️ Delete, 🐹 golang, 🔱 gRPC gateway, 🦤 flutter, 📐 Angular ")
Write-Output("")


Write-Output("📦开始编译")
Get-ChildItem .\protos -Include *.proto -Recurse | ForEach-Object -Process {
    if ($_ -is [System.IO.FileInfo]) {
        $name=$_.name
        # 删除旧文件
        $file_name = ($name -split "\.")[0]
        $del_go_file_name = $file_name + ".pb.go"
        $del_go_gw_file_name = $file_name + ".pb.gw.go"
        $del_dart_pb_file = $file_name + ".pd.dart"
        $del_dart_enum_file = $file_name + ".pbenum.dart"
        $del_dart_json_file = $file_name + ".pdjson.dart"
        $del_ng_pb_file = $file_name + ".pd.ts"
        $del_ng_conf_file = $file_name + ".pdconf.ts"
        $del_ng_sc_file = $file_name + ".pbsc.ts"
        Write-Output("♻️ 🐹    `t"+$del_go_file_name)
        Write-Output("♻️ 🔱    `t"+$del_go_gw_file_name)
        Write-Output("♻️ 🦤    `t"+$del_dart_pb_file)
        Write-Output("♻️ 🦤    `t"+$del_dart_enum_file)
        Write-Output("♻️ 🦤    `t"+$del_dart_json_file)
        Write-Output("♻️ 📐    `t"+$del_ng_pb_file)
        Write-Output("♻️ 📐    `t"+$del_ng_conf_file)
        Write-Output("♻️ 📐    `t"+$del_ng_sc_file)
        Try {
            del $GO_TARGET/protos/$del_go_file_name -ErrorAction stop
            del $GO_TARGET/protos/$del_go_gw_file_name -ErrorAction stop
            del $DART_TARGET/$del_dart_pb_file -ErrorAction stop
            del $DART_TARGET/$del_dart_enum_file -ErrorAction stop
            del $DART_TARGET/$del_dart_json_file -ErrorAction stop
            del $DART_TARGET/$del_ng_pb_file -ErrorAction stop
            del $DART_TARGET/$del_ng_conf_file -ErrorAction stop
            del $DART_TARGET/$del_ng_sc_file -ErrorAction stop
        } 
        Catch {
            
        }
        
        # 编译
        Write-Output("🎁 "+$name)
        
        protoc -I protos/. ./protos/$name --go_out=plugins=grpc:$GO_TARGET
        protoc -I protos/. ./protos/$name --grpc-gateway_out=logtostderr=true:$GO_TARGET 
        protoc --dart_out=grpc:$DART_TARGET -I protos/. protos/$name
        protoc --plugin=protoc-gen-ng=.\fly\node_modules\.bin\protoc-gen-ng.cmd --ng_out=$NG_TARGET -I protos/. .\protos\$name
        Write-Output("")
    }
}
Write-Output("🎉完成编译")