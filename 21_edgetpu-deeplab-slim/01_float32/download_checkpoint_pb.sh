#!/bin/bash

curl -sc /tmp/cookie "https://drive.google.com/uc?export=download&id=1lBydNzxJkv7B6RQyMLeUk4uB6KkmpZfl" > /dev/null
CODE="$(awk '/_warning_/ {print $NF}' /tmp/cookie)"
curl -Lb /tmp/cookie "https://drive.google.com/uc?export=download&confirm=${CODE}&id=1lBydNzxJkv7B6RQyMLeUk4uB6KkmpZfl" -o checkpoint_pb.tar.gz
tar -zxvf checkpoint_pb.tar.gz
rm checkpoint_pb.tar.gz
echo Download finished.
