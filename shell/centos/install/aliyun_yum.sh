#! /bin/bash
# @auther Haoshenqi
# @rep  https://github.com/Haoshenqi0123/open/shell/centos/aliyun_yum.sh
# @desc centos更新 阿里yum源 版本 CeontOS 7
wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo
yum install -y epel-release
yum clean all
yum makecache