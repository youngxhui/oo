
$PROTOC_OPTS='-I tensorflow -I serving --go_out=plugins=grpc:boot'

Invoke-Expression "protoc $PROTOC_OPTS serving/tensorflow_serving/apis/*.proto"
Invoke-Expression "protoc $PROTOC_OPTS serving/tensorflow_serving/config/*.proto"
Invoke-Expression "protoc $PROTOC_OPTS serving/tensorflow_serving/util/*.proto"
Invoke-Expression "protoc $PROTOC_OPTS serving/tensorflow_serving/sources/storage_path/*.proto"

Invoke-Expression "protoc $PROTOC_OPTS tensorflow/tensorflow/core/example/*.proto"
Invoke-Expression "protoc $PROTOC_OPTS tensorflow/tensorflow/core/lib/core/*.proto"
Invoke-Expression "protoc $PROTOC_OPTS tensorflow/tensorflow/core/protobuf/saver.proto"
Invoke-Expression "protoc $PROTOC_OPTS tensorflow/tensorflow/core/protobuf/meta_graph.proto"