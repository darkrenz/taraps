#!/bin/bash
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
###########- COLOR CODE -##############
colornow=$(cat /etc/casper/theme/color.conf)
NC="\e[0m"
RED="\033[0;31m"
COLOR1="$(cat /etc/casper/theme/$colornow | grep -w "TEXT" | cut -d: -f2|sed 's/ //g')"
COLBG1="$(cat /etc/casper/theme/$colornow | grep -w "BG" | cut -d: -f2|sed 's/ //g')"
WH='\033[1;37m'
###########- END COLOR CODE -##########

BURIQ () {
    curl -sS https://raw.githubusercontent.com/casper9/permission/main/ipmini > /root/tmp
    data=( `cat /root/tmp | grep -E "^### " | awk '{print $2}'` )
    for user in "${data[@]}"
    do
    exp=( `grep -E "^### $user" "/root/tmp" | awk '{print $3}'` )
    d1=(`date -d "$exp" +%s`)
    d2=(`date -d "$biji" +%s`)
    exp2=$(( (d1 - d2) / 86400 ))
    if [[ "$exp2" -le "0" ]]; then
    echo $user > /etc/.$user.ini
    else
    rm -f /etc/.$user.ini > /dev/null 2>&1
    fi
    done
    rm -f /root/tmp
}

MYIP=$(curl -sS ipv4.icanhazip.com)
Name=$(curl -sS https://raw.githubusercontent.com/casper9/permission/main/ipmini | grep $MYIP | awk '{print $2}')
echo $Name > /usr/local/etc/.$Name.ini
CekOne=$(cat /usr/local/etc/.$Name.ini)

Bloman () {
if [ -f "/etc/.$Name.ini" ]; then
CekTwo=$(cat /etc/.$Name.ini)
    if [ "$CekOne" = "$CekTwo" ]; then
        res="Expired"
    fi
else
res="Permission Accepted..."
fi
}

PERMISSION () {
    MYIP=$(curl -sS ipv4.icanhazip.com)
    IZIN=$(curl -sS https://raw.githubusercontent.com/casper9/permission/main/ipmini | awk '{print $4}' | grep $MYIP)
    if [ "$MYIP" = "$IZIN" ]; then
    Bloman
    else
    res="Permission Denied!"
    fi
    BURIQ
}
red='\e[1;31m'
green='\e[1;32m'
NC='\e[0m'
green() { echo -e "\\033[32;1m${*}\\033[0m"; }
red() { echo -e "\\033[31;1m${*}\\033[0m"; }
PERMISSION
if [ -f /home/needupdate ]; then
red "Your script need to update first !"
exit 0
elif [ "$res" = "Permission Accepted..." ]; then
echo -ne
else
red "Permission Denied!"
exit 0
fi
clear
cekray=`cat /root/log-install.txt | grep -ow "XRAY" | sort | uniq`
if [ "$cekray" = "XRAY" ]; then
domain=`cat /etc/xray/domain`
else
domain=`cat /etc/v2ray/domain`
fi
tls="$(cat ~/log-install.txt | grep -w "Shadowsocks WS TLS" | cut -d: -f2|sed 's/ //g')"
ntls="$(cat ~/log-install.txt | grep -w "Shadowsocks WS none TLS" | cut -d: -f2|sed 's/ //g')"
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1 ${NC} ${COLBG1}          ${WH}• Add Shadowsocks Account •             ${NC} $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"

		read -rp "User: " -e user
		CLIENT_EXISTS=$(grep -w $user /etc/xray/config.json | wc -l)

		if [[ ${CLIENT_EXISTS} == '1' ]]; then
clear
            echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
	    echo -e "$COLOR1 ${NC} ${COLBG1}          ${WH}• Add Shadowsocks Account •             ${NC} $COLOR1 $NC"
	    echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
			echo ""
			echo "A client with the specified name was already created, please choose another name."
			echo ""
			echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
			read -n 1 -s -r -p "Press any key to back on menu"
v2ray-menu
		fi
	done

cipher="aes-128-gcm"
uuid=$(cat /proc/sys/kernel/random/uuid)
read -p "Expired (days): " masaaktif
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#ssws$/a\### '"$user $exp"'\
},{"password": "'""$uuid""'","method": "'""$cipher""'","email": "'""$user""'"' /etc/xray/config.json
sed -i '/#ssgrpc$/a\### '"$user $exp"'\
},{"password": "'""$uuid""'","method": "'""$cipher""'","email": "'""$user""'"' /etc/xray/config.json
echo $cipher:$uuid > /tmp/log
shadowsocks_base64=$(cat /tmp/log)
echo -n "${shadowsocks_base64}" | base64 > /tmp/log1
shadowsocks_base64e=$(cat /tmp/log1)
shadowsockslink="ss://${shadowsocks_base64e}@isi_bug_disini:$tls?path=ss-ws&security=tls&host=${domain}&type=ws&sni=${domain}#${user}"
shadowsockslink1="ss://${shadowsocks_base64e}@isi_bug_disini:$ntls?path=ss-ws&security=none&host=${domain}&type=ws#${user}"
shadowsockslink2="ss://${shadowsocks_base64e}@${domain}:$tls?mode=gun&security=tls&type=grpc&serviceName=ss-grpc&sni=bug.com#${user}"
systemctl restart xray
rm -rf /tmp/log
rm -rf /tmp/log1
cat > /home/vps/public_html/ss-$user.txt <<-END
# sodosok ws
{ 
 "dns": {
    "servers": [
      "8.8.8.8",
      "8.8.4.4"
    ]
  },
 "inbounds": [
   {
      "port": 10808,
      "protocol": "socks",
      "settings": {
        "auth": "noauth",
        "udp": true,
        "userLevel": 8
      },
      "sniffing": {
        "destOverride": [
          "http",
          "tls"
        ],
        "enabled": true
      },
      "tag": "socks"
    },
    {
      "port": 10809,
      "protocol": "http",
      "settings": {
        "userLevel": 8
      },
      "tag": "http"
    }
  ],
  "log": {
    "loglevel": "none"
  },
  "outbounds": [
    {
      "mux": {
        "enabled": true
      },
      "protocol": "shadowsocks",
      "settings": {
        "servers": [
          {
            "address": "$domain",
            "level": 8,
            "method": "$cipher",
            "password": "$uuid",
            "port": 443
          }
        ]
      },
      "streamSettings": {
        "network": "ws",
        "security": "tls",
        "tlsSettings": {
          "allowInsecure": true,
          "serverName": "isi_bug_disini"
        },
        "wsSettings": {
          "headers": {
            "Host": "$domain"
          },
          "path": "/ss-ws"
        }
      },
      "tag": "proxy"
    },
    {
      "protocol": "freedom",
      "settings": {},
      "tag": "direct"
    },
    {
      "protocol": "blackhole",
      "settings": {
        "response": {
          "type": "http"
        }
      },
      "tag": "block"
    }
  ],
  "policy": {
    "levels": {
      "8": {
        "connIdle": 300,
        "downlinkOnly": 1,
        "handshake": 4,
        "uplinkOnly": 1
      }
    },
    "system": {
      "statsOutboundUplink": true,
      "statsOutboundDownlink": true
    }
  },
  "routing": {
    "domainStrategy": "Asls",
"rules": []
  },
  "stats": {}
 }
 
 # SODOSOK grpc


{
    "dns": {
    "servers": [
      "8.8.8.8",
      "8.8.4.4"
    ]
  },
 "inbounds": [
   {
      "port": 10808,
      "protocol": "socks",
      "settings": {
        "auth": "noauth",
        "udp": true,
        "userLevel": 8
      },
      "sniffing": {
        "destOverride": [
          "http",
          "tls"
        ],
        "enabled": true
      },
      "tag": "socks"
    },
    {
      "port": 10809,
      "protocol": "http",
      "settings": {
        "userLevel": 8
      },
      "tag": "http"
    }
  ],
  "log": {
    "loglevel": "none"
  },
  "outbounds": [
    {
      "mux": {
        "enabled": true
      },
      "protocol": "shadowsocks",
      "settings": {
        "servers": [
          {
            "address": "$domain",
            "level": 8,
            "method": "$cipher",
            "password": "$uuid",
            "port": 443
          }
        ]
      },
      "streamSettings": {
        "grpcSettings": {
          "multiMode": true,
          "serviceName": "ss-grpc"
        },
        "network": "grpc",
        "security": "tls",
        "tlsSettings": {
          "allowInsecure": true,
          "serverName": "isi_bug_disini"
        }
      },
      "tag": "proxy"
    },
    {
      "protocol": "freedom",
      "settings": {},
      "tag": "direct"
    },
    {
      "protocol": "blackhole",
      "settings": {
        "response": {
          "type": "http"
        }
      },
      "tag": "block"
    }
  ],
  "policy": {
    "levels": {
      "8": {
        "connIdle": 300,
        "downlinkOnly": 1,
        "handshake": 4,
        "uplinkOnly": 1
      }
    },
    "system": {
      "statsOutboundUplink": true,
      "statsOutboundDownlink": true
    }
  },
  "routing": {
    "domainStrategy": "Asls",
"rules": []
  },
  "stats": {}
}
END
systemctl restart xray > /dev/null 2>&1
service cron restart > /dev/null 2>&1
clear
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}" | tee -a /etc/log-create-user.log
echo -e "$COLOR1 ${NC} ${COLBG1}           ${WH}• Ssws ACCOUNT USERS •              ${NC} $COLOR1 $NC" | tee -a /etc/log-create-user.log
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}" | tee -a /etc/log-create-user.log
echo -e "$COLOR1 ${NC} "
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}" | tee -a /etc/log-create-user.log
echo -e "$COLOR1 ${NC} ${WH}Remarks      ${COLOR1}: ${WH}${user}" | tee -a /etc/log-create-user.log
echo -e "$COLOR1 ${NC} ${WH}Domain       ${COLOR1}: ${WH}${domain}" | tee -a /etc/log-create-user.log
echo -e "$COLOR1 ${NC} ${WH}Wildcard     ${COLOR1}: ${WH}(bug.com).${domain}" | tee -a /etc/log-create-user.log
echo -e "$COLOR1 ${NC} ${WH}Port TLS     ${COLOR1}: ${WH}${tls}" | tee -a /etc/log-create-user.log
echo -e "$COLOR1 ${NC} ${WH}Port none TLS${COLOR1}: ${WH}${ntls}" | tee -a /etc/log-create-user.log
echo -e "$COLOR1 ${NC} ${WH}Port gRPC    ${COLOR1}: ${WH}${tls}" | tee -a /etc/log-create-user.log
echo -e "$COLOR1 ${NC} ${WH}Password     ${COLOR1}: ${WH} ${uuid}" | tee -a /etc/log-create-user.log
echo -e "$COLOR1 ${NC} ${WH}Ciphers      ${COLOR1}: ${WH}${cipher}" | tee -a /etc/log-create-user.log
echo -e "$COLOR1 ${NC} ${WH}Network      ${COLOR1}: ${WH}ws/grpc" | tee -a /etc/log-create-user.log
echo -e "$COLOR1 ${NC} ${WH}Path         ${COLOR1}: ${WH}/ss-ws" | tee -a /etc/log-create-user.log
echo -e "$COLOR1 ${NC} ${WH}ServiceName  ${COLOR1}: ${WH}ss-grpc" | tee -a /etc/log-create-user.log
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}" | tee -a /etc/log-create-user.log
echo -e "$COLOR1 ${NC} "
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}" | tee -a /etc/log-create-user.log
echo -e "$COLOR1 ${NC} ${WH}Link TLS     ${COLOR1}: ${WH}${shadowsockslink}" | tee -a /etc/log-create-user.log
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}" | tee -a /etc/log-create-user.log
echo -e "$COLOR1 ${NC} "
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}" | tee -a /etc/log-create-user.log
echo -e "$COLOR1 ${NC} ${WH}Link none TLS${COLOR1}: ${WH}${shadowsockslink1}" | tee -a /etc/log-create-user.log
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}" | tee -a /etc/log-create-user.log
echo -e "$COLOR1 ${NC} "
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}" | tee -a /etc/log-create-user.log
echo -e "$COLOR1 ${NC} ${WH}Link gRPC    ${COLOR1}: ${WH}${shadowsockslink2}" | tee -a /etc/log-create-user.log
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}" | tee -a /etc/log-create-user.log
echo -e "$COLOR1 ${NC} "
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}" | tee -a /etc/log-create-user.log
echo -e "$COLOR1 ${NC} ${WH}Expired On   ${COLOR1}: ${WH}$exp" | tee -a /etc/log-create-user.log
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}" | tee -a /etc/log-create-user.log
echo -e "$COLOR1 ${NC} "
echo -e "$COLOR1┌────────────────────── ${WH}BY${NC} ${COLOR1}───────────────────────┐${NC}"
echo -e "$COLOR1 ${NC}                ${WH}• C A S P E R •${NC}                 $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo "" | tee -a /etc/log-create-user.log
read -n 1 -s -r -p "Press any key to back on menu"
menu
fi
