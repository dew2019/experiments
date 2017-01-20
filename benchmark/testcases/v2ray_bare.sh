#!/bin/bash

nohup $GOPATH/bin/receiver -port 10001 & PID=$!
echo "receiver running on $PID"
nohup /usr/bin/v2ray/v2ray -config=$GOPATH/src/github.com/v2ray/experiments/benchmark/testcases/v2ray_doko_free.json & VPID=$!
$GOPATH/bin/loadgen -amount=10
kill -15 $VPID
kill -15 $PID