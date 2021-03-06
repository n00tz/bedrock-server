#!/bin/bash

server=$1
base_dir="/localstorage/system/conf/bedrock"
work_dir="${base_dir}"/"${server}"

mkdir -p "${work_dir}"
touch "${work_dir}"/whitelist.json
touch "${work_dir}"/server.properties
touch "${work_dir}"/ops.json

docker run -d -h ${server} --name=${server}\
 -v "${work_dir}/whitelist.json:/opt/minecraft/whitelist.json:z"\
 -v "${work_dir}/server.properties:/opt/minecraft/server.properties:z"\
 -v "${work_dir}/ops.json:/opt/minecraft2/ops.json:z"\
 -v "${work_dir}/worlds:/opt/minecraft/worlds:z"\
 --network=bridge\
 -p 19132:19132\
 -p 19133:19133\
 n00tz/minecraft-bedrockserver:latest
