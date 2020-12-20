# 浏览器打开控制台

# 切换root用户
sudo -i
# 新建root密码 需要输入两次
passwd root

# 修改 sshd 配置文件
wget https://raw.githubusercontent.com/Haoshenqi0123/open/main/shell/ubuntu/sshd_config
# 复制sshd 配置文件
cp -f sshd_config /etc/ssh/
# 重启 sshd
service sshd restart


# 使用任意ssh客户端连接

# 下载脚本
wget https://raw.githubusercontent.com/Haoshenqi0123/open/main/shell/ubuntu/ubuntu_install_v2ray.sh
# 脚本授予执行权限
chmod +x ubuntu_install_v2ray.sh
# 启动脚本
./ubuntu_install_v2ray.sh