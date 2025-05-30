#!/usr/bin/env sh

DIR_CONFIG="/tmp"
DIR_RUNTIME="/usr/bin"
DIR_TMP="$(mktemp -d)"

CONFIG_JSON_FILE_NAME=v2demo.json
CONFIG_PB_FILE_NAME=v2demo.pb
V2_ZIP_FILE_NAME=v2demo-linux-64.zip

# Write V2Demo configuration
cat <<EOF >"${DIR_TMP}"/${CONFIG_JSON_FILE_NAME}
{
  "inbounds": [
    {
      "port": ${PORT},
      "protocol": "vmess",
      "settings": {
        "clients": [
          {
            "id": "d6c37778-4a55-4d64-8294-f1bf77f5cc70",
            "alterId": 0
          }
        ],
        "disableInsecureEncryption": true
      },
      "streamSettings": {
        "network": "quic",
        "quicSettings": {
          "security": "chacha20-poly1305",
          "key": "${SEC_KEY}",
          "header": {
            "type": "wechat-video"
          }
        }
      }
    }
  ],
  "outbounds": [
    {
      "protocol": "freedom"
    }
  ]
}
EOF

curl --retry 3 -H "Cache-Control: no-cache" -s \
    -L https://github.com/v2fly/v2ray-core/releases/download/v5.32.0/v2ray-linux-64.zip \
    -o "${DIR_TMP}"/${V2_ZIP_FILE_NAME}
busybox unzip "${DIR_TMP}"/${V2_ZIP_FILE_NAME} -d "${DIR_TMP}"

# Convert to protobuf format configuration
# "${DIR_TMP}"/v2ctl config "${DIR_TMP}"/${CONFIG_JSON_FILE_NAME} >${DIR_CONFIG}/${CONFIG_PB_FILE_NAME}

# Install V2Demo
install -m 755 "${DIR_TMP}"/v2ray ${DIR_RUNTIME}
rm -rf "${DIR_TMP}"

# Delete Self
rm -f "$(realpath "$0")"

# Run V2Demo
${DIR_RUNTIME}/v2ray -config=${DIR_CONFIG}/${CONFIG_JSON_FILE_NAME} >/var/log/v2demo.log 2>&1
