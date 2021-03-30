#! /bin/bash
# @auther Haoshenqi
# @rep  https://github.com/Haoshenqi0123/open/shell/centos/docker.sh
# @desc centos 安装python  -v可以指定版本 默认3.8
# @before  更新阿里yum源
version=3.8.5
largeversion=${version%.*}
path=/usr/local/python${version}

function install(){
    echo -e "\033[31m install beginning ...  \033[0m"
    echo -e "\033[31m install dependence ...  \033[0m"
    yum -y groupinstall 'Development Tools'
    yum -y install zlib-devel bzip2-devel  openssl-devel ncurses-devel wget
    echo -e "\033[31m download Python-${version}.tgz ...  \033[0m"
    wget --no-check-certificate https://www.python.org/ftp/python/${version}/Python-${version}.tgz
    echo -e "\033[31m mkdir ${path}  \033[0m"
    mkdir ${path}
    echo -e "\033[31m unpack Python-${version}.tgz  \033[0m"
    tar -zxf Python-${version}.tgz
    cd Python-${version}/
    ./configure --prefix=${path} 
    echo -e "\033[31m installing python  \033[0m"
    make
    make install
    echo -e "\033[31m add path  \033[0m"
    echo -e "\033[31m ln -s ${path}/bin/python${largeversion} /usr/bin/python3  \033[0m"
    ln -s ${path}/bin/python${largeversion} /usr/bin/python3
    echo -e "\033[31m ln -s ${path}/bin/pip3 /usr/bin/pip3  \033[0m"
    ln -s ${path}/bin/pip3 /usr/bin/pip3
    pip3 install --upgrade pip
    echo -e "\033[31m install finished  \033[0m"
}

function version(){
    version=$OPTARG
    echo ${version}
}
function path(){
    path=$OPTARG
    echo ${path}
}
function help(){
    echo -e "\033[31m -v 可以指定版本 eg: -v3.85 会自动安装3.85版本python 默认3.85  \033[0m"
    echo -e "\033[31m -p 可以指定安装路径 eg: -p/usr/local/python3 会自动安装到 /usr/local/python3 默认 /usr/local/python3  \033[0m"
    echo -e "\033[31m -l 列出当前可用版本  \033[0m"
    return
}
function list(){
    echo `curl -s https://www.python.org/ftp/python/ |cut -d ">" -f 2|cut -d "/" -f 1|grep ^[0-9]`
}

while getopts "hv:p:l" arg #选项后面的冒号表示该选项需要参数
do
    case $arg in
         v)
            version $2
            ;;
         p)
            path
            ;;
         l)
            list
            exit 1
            ;;
         ?) #当有不认识的选项的时候arg为?
        help
    exit 1
    ;;
    esac
done

install
