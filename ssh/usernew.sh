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
cekray=`cat /root/log-install.txt | grep -ow "XRAY" | sort | uniq`
if [ "$cekray" = "XRAY" ]; then
domen=`cat /etc/xray/domain`
else
domen=`cat /etc/v2ray/domain`
fi
nameserver=`cat /root/nsdomain`
sldomain=`cat /etc/xray/slwdomain`
slkey=`cat /etc/slowdns/server.pub`
#nameserver1=`cat /etc/slowdns/infons`
#slkey1=`cat /root/server.pub`
portsshws=`cat ~/log-install.txt | grep -w "SSH Websocket" | cut -d: -f2 | awk '{print $1}'`
wsssl=`cat /root/log-install.txt | grep -w "SSH SSL Websocket" | cut -d: -f2 | awk '{print $1}'`
ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10 )
CITY=$(curl -s ipinfo.io/city )

echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1 ${NC} ${COLBG1}               ${WH}• SSH PANEL MENU •              ${NC} $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
read -p "Username : " Login
read -p "Password : " Pass
read -p "Expired (hari): " masaaktif

IP=$(curl -sS ifconfig.me);
ossl=`cat /root/log-install.txt | grep -w "OpenVPN" | cut -f2 -d: | awk '{print $6}'`
opensh=`cat /root/log-install.txt | grep -w "OpenSSH" | cut -f2 -d: | awk '{print $1}'`
db=`cat /root/log-install.txt | grep -w "Dropbear" | cut -f2 -d: | awk '{print $1,$2}'`
ssl="$(cat ~/log-install.txt | grep -w "Stunnel4" | cut -d: -f2)"
sqd="$(cat ~/log-install.txt | grep -w "Squid" | cut -d: -f2)"
ovpn="$(netstat -nlpt | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
ovpn2="$(netstat -nlpu | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"

OhpSSH=`cat /root/log-install.txt | grep -w "OHP SSH" | cut -d: -f2 | awk '{print $1}'`
OhpDB=`cat /root/log-install.txt | grep -w "OHP DBear" | cut -d: -f2 | awk '{print $1}'`
OhpOVPN=`cat /root/log-install.txt | grep -w "OHP OpenVPN" | cut -d: -f2 | awk '{print $1}'`
sleep 1
clear
clear
clear
clear
useradd -e `date -d "$masaaktif days" +"%Y-%m-%d"` -s /bin/false -M $Login
exp="$(chage -l $Login | grep "Account expires" | awk -F": " '{print $2}')"
echo -e "$Pass\n$Pass\n"|passwd $Login &> /dev/null
PID=`ps -ef |grep -v grep | grep sshws |awk '{print $2}'`

if [[ ! -z "${PID}" ]]; then
echo -e "$COLOR1┌────────────────────┐${NC}" | tee -a /etc/log-create-user.log
echo -e "$COLOR1 ${NC}    ${COLBG1}${WH}• SSH Account Premium•              ${NC} $COLOR1 $NC" | tee -a /etc/log-create-user.log
echo -e "$COLOR1└────────────────────┘${NC}" | tee -a /etc/log-create-user.log
echo -e "$COLOR1┌────────────────────┐${NC}" | tee -a /etc/log-create-user.log
echo -e "$COLOR1 $NC  ${WH}Username   ${COLOR1}: ${WH}$Login"  | tee -a /etc/log-create-user.log
echo -e "$COLOR1 $NC  ${WH}Password   ${COLOR1}: ${WH}$Pass" | tee -a /etc/log-create-user.log
echo -e "$COLOR1 $NC  ${WH}Expired On ${COLOR1}: ${WH}$exp"  | tee -a /etc/log-create-user.log
echo -e "$COLOR1└────────────────────┘${NC}" | tee -a /etc/log-create-user.log
echo -e "$COLOR1┌────────────────────┐${NC}" | tee -a /etc/log-create-user.log
echo -e "$COLOR1 $NC  ${WH}ISP        ${COLOR1}: ${WH}$ISP" | tee -a /etc/log-create-user.log
echo -e "$COLOR1 $NC  ${WH}City       ${COLOR1}: ${WH}$CITY" | tee -a /etc/log-create-user.log
echo -e "$COLOR1 $NC  ${WH}IP         ${COLOR1}: ${WH}$IP" | tee -a /etc/log-create-user.log
echo -e "$COLOR1 $NC  ${WH}Host       ${COLOR1}: ${WH}$domen" | tee -a /etc/log-create-user.log
#echo -e "$COLOR1 $NC  ${WH}Wildcard   ${COLOR1}: ${WH}(bug.com).$domen" | tee -a /etc/log-create-user.log
echo -e "$COLOR1 $NC  ${WH}OpenSSH    ${COLOR1}: ${WH}$opensh" | tee -a /etc/log-create-user.log
echo -e "$COLOR1 $NC  ${WH}Dropbear   ${COLOR1}: ${WH}$db" | tee -a /etc/log-create-user.log
echo -e "$COLOR1 $NC  ${WH}SSH-WS     ${COLOR1}: ${WH}80,8080" | tee -a /etc/log-create-user.log
echo -e "$COLOR1 $NC  ${WH}SSH-SSL-WS ${COLOR1}: ${WH}$wsssl" | tee -a /etc/log-create-user.log
echo -e "$COLOR1 $NC  ${WH}SSL/TLS    ${COLOR1}: ${WH}8443,8880" | tee -a /etc/log-create-user.log
echo -e "$COLOR1 $NC  ${WH}Ovpn Ws    ${COLOR1}: ${WH}2086" | tee -a /etc/log-create-user.log
echo -e "$COLOR1 $NC  ${WH}Port TCP   ${COLOR1}: ${WH}$ovpn" | tee -a /etc/log-create-user.log
echo -e "$COLOR1 $NC  ${WH}Port UDP   ${COLOR1}: ${WH}$ovpn2" | tee -a /etc/log-create-user.log
echo -e "$COLOR1 $NC  ${WH}Port SSL   ${COLOR1}: ${WH}990" | tee -a /etc/log-create-user.log
echo -e "$COLOR1 $NC  ${WH}OVPN TCP   ${COLOR1}: ${WH}http://$IP:89/tcp.ovpn" | tee -a /etc/log-create-user.log
echo -e "$COLOR1 $NC  ${WH}OVPN UDP   ${COLOR1}: ${WH}http://$IP:89/udp.ovpn" | tee -a /etc/log-create-user.log
echo -e "$COLOR1 $NC  ${WH}OVPN SSL   ${COLOR1}: ${WH}http://$IP:89/ssl.ovpn" | tee -a /etc/log-create-user.log
echo -e "$COLOR1 $NC  ${WH}UDPGW      ${COLOR1}: ${WH}7100-7300" | tee -a /etc/log-create-user.log
echo -e "$COLOR1└────────────────────┘${NC}" | tee -a /etc/log-create-user.log
echo -e "$COLOR1┌────────────────────┐${NC}" | tee -a /etc/log-create-user.log
echo -e "$COLOR1 $NC  ${WH}PORT SLWDNS${COLOR1}: ${WH}22,80,8080,8880,443,8443"
echo -e "$COLOR1 $NC  ${WH}HOST SLWDNS${COLOR1}: ${WH}$sldomain"
echo -e "$COLOR1 $NC  ${WH}NAMESERVER ${COLOR1}: ${WH}$nameserver"
echo -e "$COLOR1 $NC  ${WH}PUB KEY    ${COLOR1}: ${WH}$slkey"
#echo -e "$COLOR1 $NC  ${WH}NAMESERVER ${COLOR1}: ${WH}$nameserver1"
#echo -e "$COLOR1 $NC  ${WH}PUB KEY    ${COLOR1}: ${WH}$slkey1"
echo -e "$COLOR1└────────────────────┘${NC}" | tee -a /etc/log-create-user.log
echo -e "$COLOR1┌────────────────────┐${NC}" | tee -a /etc/log-create-user.log
echo -e "$COLOR1 ${NC}  ${WH}           Payload WSS                                       ${NC}" | tee -a /etc/log-create-user.log
echo -e "$COLOR1 ${NC}  ${WH}GET wss://bug.com HTTP/1.1[crlf]Host: ${domen}[crlf]Upgrade: websocket[crlf][crlf]${NC}" | tee -a /etc/log-create-user.log
echo -e "$COLOR1└────────────────────┘${NC}" | tee -a /etc/log-create-user.log
echo -e "$COLOR1┌────────────────────┐${NC}" | tee -a /etc/log-create-user.log
echo -e "$COLOR1 ${NC}  ${WH}           Payload WS                   ${NC}" | tee -a /etc/log-create-user.log
echo -e "$COLOR1 ${NC}  ${WH}GET / HTTP/1.1[crlf]Host: $domen[crlf]Upgrade: websocket[crlf][crlf]${NC}" | tee -a /etc/log-create-user.log
echo -e "$COLOR1└────────────────────┘${NC}" | tee -a /etc/log-create-user.log
echo -e "$COLOR1┌────────────────────┐${NC}" | tee -a /etc/log-create-user.log
echo -e "$COLOR1 ${NC}    ${WH}• t.me/casperinject •${NC}                 $COLOR1 $NC" | tee -a /etc/log-create-user.log
echo -e "$COLOR1└────────────────────┘${NC}" | tee -a /etc/log-create-user.log
else

echo -e "$COLOR1┌────────────────────┐${NC}" | tee -a /etc/log-create-user.log
echo -e "$COLOR1 ${NC}     ${COLBG1}${WH}• SSH Account Premium •              ${NC} $COLOR1 $NC" | tee -a /etc/log-create-user.log
echo -e "$COLOR1└────────────────────┘${NC}" | tee -a /etc/log-create-user.log
echo -e "$COLOR1┌────────────────────┐${NC}" | tee -a /etc/log-create-user.log
echo -e "$COLOR1 $NC  ${WH}Username   ${COLOR1}: ${WH}$Login"  | tee -a /etc/log-create-user.log
echo -e "$COLOR1 $NC  ${WH}Password   ${COLOR1}: ${WH}$Pass" | tee -a /etc/log-create-user.log
echo -e "$COLOR1 $NC  ${WH}Expired On ${COLOR1}: ${WH}$exp"  | tee -a /etc/log-create-user.log
echo -e "$COLOR1└────────────────────┘${NC}" | tee -a /etc/log-create-user.log
echo -e "$COLOR1┌────────────────────┐${NC}" | tee -a /etc/log-create-user.log
echo -e "$COLOR1 $NC  ${WH}ISP        ${COLOR1}: ${WH}$ISP" | tee -a /etc/log-create-user.log
echo -e "$COLOR1 $NC  ${WH}City       ${COLOR1}: ${WH}$CITY" | tee -a /etc/log-create-user.log
echo -e "$COLOR1 $NC  ${WH}IP         ${COLOR1}: ${WH}$IP" | tee -a /etc/log-create-user.log
echo -e "$COLOR1 $NC  ${WH}Host       ${COLOR1}: ${WH}$domen" | tee -a /etc/log-create-user.log
#echo -e "$COLOR1 $NC  ${WH}Wildcard   ${COLOR1}: ${WH}(bug.com).$domen" | tee -a /etc/log-create-user.log
echo -e "$COLOR1 $NC  ${WH}OpenSSH    ${COLOR1}: ${WH}$opensh" | tee -a /etc/log-create-user.log
echo -e "$COLOR1 $NC  ${WH}Dropbear   ${COLOR1}: ${WH}$db" | tee -a /etc/log-create-user.log
echo -e "$COLOR1 $NC  ${WH}SSH-WS     ${COLOR1}: ${WH}80,8080" | tee -a /etc/log-create-user.log
echo -e "$COLOR1 $NC  ${WH}SSH-SSL-WS ${COLOR1}: ${WH}$wsssl" | tee -a /etc/log-create-user.log
echo -e "$COLOR1 $NC  ${WH}SSL/TLS    ${COLOR1}: ${WH}8443,8880" | tee -a /etc/log-create-user.log
echo -e "$COLOR1 $NC  ${WH}Ovpn Ws    ${COLOR1}: ${WH}2086" | tee -a /etc/log-create-user.log
echo -e "$COLOR1 $NC  ${WH}Port TCP   ${COLOR1}: ${WH}$ovpn" | tee -a /etc/log-create-user.log
echo -e "$COLOR1 $NC  ${WH}Port UDP   ${COLOR1}: ${WH}$ovpn2" | tee -a /etc/log-create-user.log
echo -e "$COLOR1 $NC  ${WH}Port SSL   ${COLOR1}: ${WH}990" | tee -a /etc/log-create-user.log
echo -e "$COLOR1 $NC  ${WH}OVPN TCP   ${COLOR1}: ${WH}http://$IP:89/tcp.ovpn" | tee -a /etc/log-create-user.log
echo -e "$COLOR1 $NC  ${WH}OVPN UDP   ${COLOR1}: ${WH}http://$IP:89/udp.ovpn" | tee -a /etc/log-create-user.log
echo -e "$COLOR1 $NC  ${WH}OVPN SSL   ${COLOR1}: ${WH}http://$IP:89/ssl.ovpn" | tee -a /etc/log-create-user.log
echo -e "$COLOR1 $NC  ${WH}UDPGW      ${COLOR1}: ${WH}7100-7300" | tee -a /etc/log-create-user.log
echo -e "$COLOR1└────────────────────┘${NC}" | tee -a /etc/log-create-user.log
echo -e "$COLOR1┌────────────────────┐${NC}" | tee -a /etc/log-create-user.log
echo -e "$COLOR1 $NC  ${WH}PORT SLWDNS${COLOR1}: ${WH}22,80,8080,8880,443,8443"
echo -e "$COLOR1 $NC  ${WH}HOST SLWDNS${COLOR1}: ${WH}$sldomain"
echo -e "$COLOR1 $NC  ${WH}NAMESERVER ${COLOR1}: ${WH}$nameserver"
echo -e "$COLOR1 $NC  ${WH}PUB KEY    ${COLOR1}: ${WH}$slkey"
#echo -e "$COLOR1 $NC  ${WH}NAMESERVER ${COLOR1}: ${WH}$nameserver1"
#echo -e "$COLOR1 $NC  ${WH}PUB KEY    ${COLOR1}: ${WH}$slkey1"
echo -e "$COLOR1└────────────────────┘${NC}" | tee -a /etc/log-create-user.log
echo -e "$COLOR1┌────────────────────┐${NC}" | tee -a /etc/log-create-user.log
echo -e "$COLOR1 ${NC}  ${WH}           Payload WSS                                       ${NC}" | tee -a /etc/log-create-user.log
echo -e "$COLOR1 ${NC}  ${WH}GET wss://bug.com HTTP/1.1[crlf]Host: ${domen}[crlf]Upgrade: websocket[crlf][crlf]${NC}" | tee -a /etc/log-create-user.log
echo -e "$COLOR1└────────────────────┘${NC}" | tee -a /etc/log-create-user.log
echo -e "$COLOR1┌────────────────────┐${NC}" | tee -a /etc/log-create-user.log
echo -e "$COLOR1 ${NC}  ${WH}           Payload WS                   ${NC}" | tee -a /etc/log-create-user.log
echo -e "$COLOR1 ${NC}  ${WH}GET / HTTP/1.1[crlf]Host: $domen[crlf]Upgrade: websocket[crlf][crlf]${NC}" | tee -a /etc/log-create-user.log
echo -e "$COLOR1└────────────────────┘${NC}" | tee -a /etc/log-create-user.log
echo -e "$COLOR1┌────────────────────┐${NC}" | tee -a /etc/log-create-user.log
echo -e "$COLOR1 ${NC}    ${WH}• t.me/casperinject •${NC}                 $COLOR1 $NC" | tee -a /etc/log-create-user.log
echo -e "$COLOR1└────────────────────┘${NC}" | tee -a /etc/log-create-user.log
fi
echo "" | tee -a /etc/log-create-user.log
read -n 1 -s -r -p "Press any key to back on menu"
menu
