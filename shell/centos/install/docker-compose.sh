#! /bin/bash
# @auther Haoshenqi
# @rep  https://github.com/Haoshenqi0123/open/shell/centos/aliyun_yum.sh
# @desc centos 安装docker-compose
# @before  安装docker ce
version=1.17.1
url=https://github.com/docker/compose/releases

func install(){
    curl -L https://github.com/docker/compose/releases/download/$1/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
    chmod 755 /usr/local/bin/docker-compose
    docker-compose version
    echo $1
}
func help(){
    echo "-v 选择版本安装 默认版本${version}"
    echo "-l 显示可选版本"
}