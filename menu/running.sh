#!/bin/bash
GREEN#!/bin/bash
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
###########- COLOR CODE -##############
colornow=$(cat /etc/casper/theme/color.conf)
export NC="\e[0m"
export YELLOW='\033[0;33m';
export RED="\033[0;31m"
export COLOR1="$(cat /etc/casper/theme/$colornow | grep -w "TEXT" | cut -d: -f2|sed 's/ //g')"
export COLBG1="$(cat /etc/casper/theme/$colornow | grep -w "BG" | cut -d: -f2|sed 's/ //g')"
WH='\033[1;37m'
###########- END COLOR CODE -##########
tram=$( free -h | awk 'NR==2 {print $2}' )
uram=$( free -h | awk 'NR==2 {print $3}' )
ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10 )
CITY=$(curl -s ipinfo.io/city )


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
Isadmin=$(curl -sS https://raw.githubusercontent.com/casper9/permission/main/ipmini | grep $MYIP | awk '{print $5}')
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

x="ok"


PERMISSION

if [ "$res" = "Expired" ]; then
Exp="\e[36mExpired\033[0m"
rm -f /home/needupdate > /dev/null 2>&1
else
Exp=$(curl -sS https://raw.githubusercontent.com/casper9/permission/main/ipmini | grep $MYIP | awk '{print $3}')
fi
export RED='\033[0;31m'
export GREEN='\033[0;32m'
clear

# GETTING OS INFORMATION
source /etc/os-release
Versi_OS=$VERSION
ver=$VERSION_ID
Tipe=$NAME
URL_SUPPORT=$HOME_URL
basedong=$ID

# VPS ISP INFORMATION
#ITAM='\033[0;30m'
echo -e "$ITAM"
REGION=$( curl -s ipinfo.io/region )
#clear
#COUNTRY=$( curl -s ipinfo.io/country )
#clear
#WAKTU=$( curl -s ipinfo.ip/timezone )
#clear
CITY=$( curl -s ipinfo.io/city )
#clear
#REGION=$( curl -s ipinfo.io/region )
#clear

# CHEK STATUS
openvpn_service="$(systemctl show openvpn.service --no-page)"
oovpn=$(echo "${openvpn_service}" | grep 'ActiveState=' | cut -f2 -d=)
status_openvp=$(/etc/init.d/openvpn status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
#status_ss_tls="$(systemctl show shadowsocks-libev-server@tls.service --no-page)"
#ss_tls=$(echo "${status_ss_tls}" | grep 'ActiveState=' | cut -f2 -d=)
#sst_status=$(systemctl status shadowsocks-libev-server@tls | grep Active | awk '{print $0}' | cut -d "(" -f2 | cut -d ")" -f1)
#ssh_status=$(systemctl status shadowsocks-libev-server@http | grep Active | awk '{print $0}' | cut -d "(" -f2 | cut -d ")" -f1)
#status_ss_http="$(systemctl show shadowsocks-libev-server@http.service --no-page)"
#ss_http=$(echo "${status_ss_http}" | grep 'ActiveState=' | cut -f2 -d=)
#sssohtt=$(systemctl status shadowsocks-libev-server@*-http | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
#status="$(systemctl show shadowsocks-libev.service --no-page)"
#status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
tls_v2ray_status=$(systemctl status xray | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
nontls_v2ray_status=$(systemctl status xray | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
vless_tls_v2ray_status=$(systemctl status xray | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
vless_nontls_v2ray_status=$(systemctl status xray | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
shadowsocks=$(systemctl status xray | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
#ssr_status=$(systemctl status ssrmu | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
trojan_server=$(systemctl status xray | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
dropbear_status=$(/etc/init.d/dropbear status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
stunnel_service=$(/etc/init.d/stunnel4 status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
#sstp_service=$(systemctl status accel-ppp | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
#squid_service=$(/etc/init.d/squid status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
ssh_service=$(/etc/init.d/ssh status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
vnstat_service=$(/etc/init.d/vnstat status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
cron_service=$(/etc/init.d/cron status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
fail2ban_service=$(/etc/init.d/fail2ban status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
#wg="$(systemctl show wg-quick@wg0.service --no-page)"
#swg=$(echo "${wg}" | grep 'ActiveState=' | cut -f2 -d=)
#trgo="$(systemctl show trojan-go.service --no-page)"
#strgo=$(echo "${trgo}" | grep 'ActiveState=' | cut -f2 -d=)
#sswg=$(systemctl status wg-quick@wg0 | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
wstls=$(systemctl status ws-stunnel.service | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
wsdrop=$(systemctl status ws-dropbear.service | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
wsovpn=$(systemctl status ws-ovpn | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
wsopen=$(systemctl status ws-openssh | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
osslh=$(systemctl status sslh | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
ohp=$(systemctl status dropbear-ohp | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
ohq=$(systemctl status openvpn-ohp | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
ohr=$(systemctl status ssh-ohp | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)

# COLOR VALIDATION
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT='\033[0;37m'
clear

# STATUS SERVICE OPENVPN
if [[ $oovpn == "active" ]]; then
  status_openvpn=" ${GREEN}Running ${NC}( No Error )"
else
  status_openvpn="${RED}  Not Running ${NC}  ( Error )"
fi

# STATUS SERVICE  SSH
if [[ $ssh_service == "running" ]]; then
   status_ssh=" ${GREEN}Running ${NC}( No Error )"
else
   status_ssh="${RED}  Not Running ${NC}  ( Error )"
fi

# STATUS SERVICE  SQUID
if [[ $squid_service == "running" ]]; then
   status_squid=" ${GREEN}Running ${NC}( No Error )"
else
   status_squid="${RED}  Not Running ${NC}  ( Error )"
fi

# STATUS SERVICE  VNSTAT
if [[ $vnstat_service == "running" ]]; then
   status_vnstat=" ${GREEN}Running ${NC}( No Error )"
else
   status_vnstat="${RED}  Not Running ${NC}  ( Error )"
fi

# STATUS SERVICE  CRONS
if [[ $cron_service == "running" ]]; then
   status_cron=" ${GREEN}Running ${NC}( No Error )"
else
   status_cron="${RED}  Not Running ${NC}  ( Error )"
fi

# STATUS SERVICE  FAIL2BAN
if [[ $fail2ban_service == "running" ]]; then
   status_fail2ban=" ${GREEN}Running ${NC}( No Error )"
else
   status_fail2ban="${RED}  Not Running ${NC}  ( Error )"
fi

# STATUS SERVICE  TLS
if [[ $tls_v2ray_status == "running" ]]; then
   status_tls_v2ray=" ${GREEN}Running${NC} ( No Error )"
else
   status_tls_v2ray="${RED}  Not Running${NC}   ( Error )"
fi

# STATUS SERVICE NON TLS V2RAY
if [[ $nontls_v2ray_status == "running" ]]; then
   status_nontls_v2ray=" ${GREEN}Running ${NC}( No Error )${NC}"
else
   status_nontls_v2ray="${RED}  Not Running ${NC}  ( Error )${NC}"
fi

# STATUS SERVICE VLESS HTTPS
if [[ $vless_tls_v2ray_status == "running" ]]; then
  status_tls_vless=" ${GREEN}Running${NC} ( No Error )"
else
  status_tls_vless="${RED}  Not Running ${NC}  ( Error )${NC}"
fi

# STATUS SERVICE VLESS HTTP
if [[ $vless_nontls_v2ray_status == "running" ]]; then
  status_nontls_vless=" ${GREEN}Running${NC} ( No Error )"
else
  status_nontls_vless="${RED}  Not Running ${NC}  ( Error )${NC}"
fi
# STATUS SERVICE TROJAN
if [[ $trojan_server == "running" ]]; then
   status_virus_trojan=" ${GREEN}Running ${NC}( No Error )${NC}"
else
   status_virus_trojan="${RED}  Not Running ${NC}  ( Error )${NC}"
fi
# STATUS SERVICE DROPBEAR
if [[ $dropbear_status == "running" ]]; then
   status_beruangjatuh=" ${GREEN}Running${NC} ( No Error )${NC}"
else
   status_beruangjatuh="${RED}  Not Running ${NC}  ( Error )${NC}"
fi

# STATUS SERVICE STUNNEL
if [[ $stunnel_service == "running" ]]; then
   status_stunnel=" ${GREEN}Running ${NC}( No Error )"
else
   status_stunnel="${RED}  Not Running ${NC}  ( Error )}"
fi
# STATUS SERVICE WEBSOCKET TLS
if [[ $wstls == "running" ]]; then
   swstls=" ${GREEN}Running ${NC}( No Error )${NC}"
else
   swstls="${RED}  Not Running ${NC}  ( Error )${NC}"
fi

# STATUS SERVICE WEBSOCKET DROPBEAR
if [[ $wsdrop == "running" ]]; then
   swsdrop=" ${GREEN}Running ${NC}( No Error )${NC}"
else
   swsdrop="${RED}  Not Running ${NC}  ( Error )${NC}"
fi

# STATUS SERVICE SSLH / SSH
if [[ $osslh == "running" ]]; then 
   sosslh=" ${GREEN}Running ${NC}( No Error )${NC}"
else
   sosslh="${RED}  Not Running ${NC}  ( Error )${NC}"
fi

# STATUS OHP DROPBEAR
if [[ $ohp == "running" ]]; then 
   sohp=" ${GREEN}Running ${NC}( No Error )${NC}"
else
   sohp="${RED}  Not Running ${NC}  ( Error )${NC}"
fi

# STATUS OHP OpenVPN
if [[ $ohq == "running" ]]; then 
   sohq=" ${GREEN}Running ${NC}( No Error )${NC}"
else
   sohq="${RED}  Not Running ${NC}  ( Error )${NC}"
fi

# STATUS OHP SSH
if [[ $ohr == "running" ]]; then 
   sohr=" ${GREEN}Running ${NC}( No Error )${NC}"
else
   sohr="${RED}  Not Running ${NC}  ( Error )${NC}"
fi

# STATUS SHADOWSOCKS
if [[ $shadowsocks == "running" ]]; then
   status_shadowsocks=" ${GREEN}Running ${NC}( No Error )${NC}"
else
   status_shadowsocks="${RED}  Not Running ${NC}  ( Error )${NC}"
fi



# TOTAL RAM
total_ram=` grep "MemTotal: " /proc/meminfo | awk '{ print $2}'`
totalram=$(($total_ram/1024))

# TIPE PROCESSOR
#totalcore="$(grep -c "^processor" /proc/cpuinfo)"
#totalcore+=" Core"
#corediilik="$(grep -c "^processor" /proc/cpuinfo)"
#tipeprosesor="$(awk -F ': | @' '/model name|Processor|^cpu model|chip type|^cpu type/ {
  #                      printf $2;
      #                  exit
    #                    }' /proc/cpuinfo)"

# GETTING CPU INFORMATION
#cpu_usage1="$(ps aux | awk 'BEGIN {sum=0} {sum+=$3}; END {print sum}')"
#cpu_usage="$((${cpu_usage1/\.*} / ${corediilik:-1}))"
#cpu_usage+=" %"

# OS UPTIME
#uptime="$(uptime -p | cut -d " " -f 2-10)"

# KERNEL TERBARU
kernelku=$(uname -r)

# WAKTU SEKARANG
DATE=$(date +'%Y-%m-%d')
datediff() {
    d1=$(date -d "$1" +%s)
    d2=$(date -d "$2" +%s)
    echo -e "$COLOR1 $NC Expiry In   : $(( (d1 - d2) / 86400 )) Days"
}
mai="datediff "$Exp" "$DATE""

today=`date -d "0 days" +"%Y-%m-%d"`

# CERTIFICATE STATUS
d1=$(date -d "$exp" +%s)
d2=$(date -d "$today" +%s)
certificate=$(( (d1 - d2) / 86400 ))

# DNS PATCH
#tipeos2=$(uname -m)
Name=$(curl -sS https://raw.githubusercontent.com/casper9/permission/main/ipmini | grep $MYIP | awk '{print $2}')
# GETTING DOMAIN NAME
Domen="$(cat /etc/xray/domain)"
echo -e ""
echo -e "$COLOR1┌───────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1 ${NC}                ${WH}⇱ SYSTEM INFORMATION ⇲${NC}                       $COLOR1 $NC"
echo -e "$COLOR1└───────────────────────────────────────────────────┘${NC}"
echo -e " $COLOR1 $NC                                              ${NC} $COLOR1 $NC"
echo -e "$COLOR1┌───────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1 $NC  ${WH}❇️ Hostname    ${COLOR1}: ${WH}$HOSTNAME$NC"
echo -e "$COLOR1 $NC  ${WH}❇️ OS Name     ${COLOR1}: ${WH}$Tipe$NC"
echo -e "$COLOR1 $NC  ${WH}❇️ Total RAM   ${COLOR1}: ${WH}${totalram}MB$NC"
echo -e "$COLOR1 $NC  ${WH}❇️ Public IP   ${COLOR1}: ${WH}$MYIP$NC"
echo -e "$COLOR1 $NC  ${WH}❇️ Domain      ${COLOR1}: ${WH}$Domen$NC"
echo -e "$COLOR1└───────────────────────────────────────────────────┘${NC}"
echo -e " $COLOR1 $NC                                              ${NC} $COLOR1 $NC"
echo -e "$COLOR1┌───────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1 ${NC}                ${WH}⇱ SUBSCRIPTION INFORMATION ⇲${NC}                $COLOR1 $NC"
echo -e "$COLOR1└───────────────────────────────────────────────────┘${NC}"
echo -e " $COLOR1 $NC                                              ${NC} $COLOR1 $NC"
echo -e "$COLOR1┌───────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1 $NC  ${WH}❇️ Client Name ${COLOR1}: ${WH}$Name${NC}"
echo -e "$COLOR1 $NC  ${WH}❇️ License     ${COLOR1}: ${WH}$certificate days${NC}"
echo -e "$COLOR1 $NC  ${WH}❇️ Version     ${COLOR1}: ${WH}$(cat /opt/.ver) Latest Version${NC}"
echo -e "$COLOR1└───────────────────────────────────────────────────┘${NC}"
echo -e " $COLOR1 $NC                                              ${NC} $COLOR1 $NC"
echo -e "$COLOR1┌───────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1 ${NC}                ${WH}⇱ SERVICE INFORMATION ⇲${NC}                 $COLOR1 $NC"
echo -e "$COLOR1└───────────────────────────────────────────────────┘${NC}"
echo -e " $COLOR1 $NC                                              ${NC} $COLOR1 $NC"
echo -e "$COLOR1┌───────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1 $NC  ${WH}❇️ SSH / TUN               ${COLOR1}: ${WH}$status_ssh${NC}"
echo -e "$COLOR1 $NC  ${WH}❇️ OpenVPN                 ${COLOR1}: ${WH}$status_openvpn${NC}"
echo -e "$COLOR1 $NC  ${WH}❇️ Dropbear                ${COLOR1}: ${WH}$status_beruangjatuh${NC}"
echo -e "$COLOR1 $NC  ${WH}❇️ Stunnel4                ${COLOR1}: ${WH}$status_stunnel${NC}"
#echo -e "❇️ Squid                   :$status_squid"
echo -e "$COLOR1 $NC  ${WH}❇️ Fail2Ban                ${COLOR1}: ${WH}$status_fail2ban${NC}"
echo -e "$COLOR1 $NC  ${WH}❇️ Crons                   ${COLOR1}: ${WH}$status_cron${NC}"
echo -e "$COLOR1 $NC  ${WH}❇️ Vnstat                  ${COLOR1}: ${WH}$status_vnstat${NC}"
echo -e "$COLOR1 $NC  ${WH}❇️ XRAYS Vmess TLS         ${COLOR1}: ${WH}$status_tls_v2ray${NC}"
echo -e "$COLOR1 $NC  ${WH}❇️ XRAYS Vmess None TLS    ${COLOR1}: ${WH}$status_nontls_v2ray${NC}"
echo -e "$COLOR1 $NC  ${WH}❇️ XRAYS Vless TLS         ${COLOR1}: ${WH}$status_tls_vless${NC}"
echo -e "$COLOR1 $NC  ${WH}❇️ XRAYS Vless None TLS    ${COLOR1}: ${WH}$status_nontls_vless${NC}"
echo -e "$COLOR1 $NC  ${WH}❇️ XRAYS Trojan            ${COLOR1}: ${WH}$status_virus_trojan${NC}"
echo -e "$COLOR1 $NC  ${WH}❇️ Shadowsocks             ${COLOR1}: ${WH}$status_shadowsocks${NC}"
echo -e "$COLOR1 $NC  ${WH}❇️ Websocket TLS           ${COLOR1}: ${WH}$swstls${NC}"
echo -e "$COLOR1 $NC  ${WH}❇️ Websocket None TLS      ${COLOR1}: ${WH}$swstls${NC}"
echo -e "$COLOR1 $NC  ${WH}❇️ OHP Dropbear            ${COLOR1}: ${WH}$sohp${NC}"
echo -e "$COLOR1 $NC  ${WH}❇️ OHP OpenVPN             ${COLOR1}: ${WH}$sohq${NC}"
echo -e "$COLOR1 $NC  ${WH}❇️ OHP SSH                 ${COLOR1}: ${WH}$sohr${NC}"
#echo -e "❇️ SSL / SSH Multiplexer   :$sosslh"
echo -e "$COLOR1└───────────────────────────────────────────────────┘${NC}"
echo -e " $COLOR1 $NC                                              ${NC} $COLOR1 $NC"
echo -e "$COLOR1┌───────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1 ${NC}                ${WH}♧ SCRIPT ♧ ${NC}                    $COLOR1 $NC"
echo -e "$COLOR1 ${NC}                ${WH}♤ PREMIUM ♤ ${NC}                   $COLOR1 $NC"
echo -e "$COLOR1 ${NC}                ${WH}◇   BY   ◇ ${NC}                    $COLOR1 $NC"
echo -e "$COLOR1 ${NC}             ${WH}♡ C A S P E R ♡ ${NC}                 $COLOR1 $NC"
echo -e "$COLOR1└───────────────────────────────────────────────────┘${NC}"
