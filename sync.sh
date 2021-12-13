#!/bin/bash

if ! command -v coscli >/dev/null; then
	echo "错误: 你需要先安装 coscli 命令行工具 https://github.com/justjavac/dl-deno-sync#readme" 1>&2
	exit 1
fi

remote_version=$(curl -sSf https://dl.deno.land/release-latest.txt)
local_version=$(curl -sSf https://dl.deno.js.cn/release-latest.txt)

if [ $remote_version != $local_version ]; then
    echo "发现新版本 $remote_version"
    echo $remote_version > release-latest.txt
    coscli sync ./release-latest.txt cos://dl-deno-js-cn/release-latest.txt
    rm ./release-latest.txt

    # CDN 预热
    for target in 'x86_64-apple-darwin' 'aarch64-apple-darwin' 'x86_64-unknown-linux-gnu' 'x86_64-pc-windows-msvc'
    do
        curl -sSf "https://dl.deno.js.cn/release/$remote_version/deno-$target.zip"
        echo "sync $target"
    done
fi

remote_version=$(curl -sSf https://dl.deno.land/canary-latest.txt)
local_version=$(curl -sSf https://dl.deno.js.cn/canary-latest.txt)

if [ $remote_version != $local_version ]; then
    echo "发现新 canary 版本 $remote_version"
    echo $remote_version > canary-latest.txt
    coscli sync ./canary-latest.txt cos://dl-deno-js-cn/canary-latest.txt
    rm ./canary-latest.txt
fi
