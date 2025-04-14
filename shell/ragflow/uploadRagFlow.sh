#!/bin/bash
# author haoshenqi
# 使用方法：./uploadRagFlow.sh /path/to/your/markdown/files

if [ -z "$1" ]; then
    echo "请传入文件目录作为参数，例如：./uploadRagFlow.sh /app/hugo/hugo/content/熊逸·宋词10讲"
    exit 1
fi

DATASET_ID="YOUR_DATA_BASE_ID"
AUTH_TOKEN="YOUR_TOKEN"
# CHANGE 192.168.31.10:8055 to YOUR HOST AND PORT
URL="http://192.168.31.10:8055/api/v1/datasets/${DATASET_ID}/documents"
UPLOAD_DIR="$1"

# 遍历指定目录下所有 Markdown 文件(.md)
for file in "$UPLOAD_DIR"/*.md; do
    echo "正在上传 ${file}..."
    curl --request POST "$URL" \
         --header "Content-Type: multipart/form-data" \
         --header "Authorization: Bearer ${AUTH_TOKEN}" \
         --form "file=@${file}"
    echo -e "\n上传结束：${file}\n"
done
