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
MYIP=$(wget -qO- ipinfo.io/ip);
echo "Checking VPS"
CEKEXPIRED () {
    today=$(date -d +1day +%Y-%m-%d)
    Exp1=$(curl -sS https://raw.githubusercontent.com/casper9/permission/main/ipmini | grep $MYIP | awk '{print $3}')
    if [[ $today < $Exp1 ]]; then
    echo -e "\e[32mSTATUS SCRIPT AKTIF...\e[0m"
    else
    echo -e "\e[31mSCRIPT ANDA EXPIRED!\e[0m";

    exit 0
fi
}
IZIN=$(curl -sS https://raw.githubusercontent.com/casper9/permission/main/ipmini | awk '{print $4}' | grep $MYIP)
if [ $MYIP = $IZIN ]; then
echo -e "\e[32mPermission Accepted...\e[0m"
CEKEXPIRED
else
echo -e "\e[31mPermission Denied!\e[0m";

exit 0
fi
clear
function ins-helium(){
clear
if [[ -e /usr/bin/ins-helium ]]; then
     echo ""
     echo -e "${green}Ads Block Already Install${NC}"
     echo ""
	 read -n1 -r -p "Press any key to continue..."
	 menu
else

rm -rf /usr/bin/ins-helium
wget -q -O /usr/bin/ins-helium "https://raw.githubusercontent.com/vinstechmy/AdsBlock/main/ins-helium.sh" && chmod +x /usr/bin/ins-helium && ins-heliumchmod +x /usr/local/sbin/helium
helium

fi
}
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1 ${NC} ${COLBG1}               ${WH}• SYSTEM MENU •                 ${NC} $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e " $COLOR1 $NC                                              ${NC} $COLOR1 $NC"
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "  ${WH}[${COLOR1}01${WH}]${NC} ${COLOR1}• ${WH}CHANGE DOMAIN   ${WH} ${WH}[${COLOR1}07${WH}]${NC} ${COLOR1}• ${WH}WEBMIN MENU ${WH}        $COLOR1 $NC"
#echo -e " $COLOR1 $NC                                              ${NC} $COLOR1 $NC"
echo -e "  ${WH}[${COLOR1}02${WH}]${NC} ${COLOR1}• ${WH}SPEEDTEST   ${WH}     ${WH}[${COLOR1}08${WH}]${NC} ${COLOR1}• ${WH}LIMIT SPEED SERVER ${WH} $COLOR1 $NC"
#echo -e " $COLOR1 $NC                                              ${NC} $COLOR1 $NC"
echo -e "  ${WH}[${COLOR1}03${WH}]${NC} ${COLOR1}• ${WH}AUTO REBOOT   ${WH}   ${WH}[${COLOR1}09${WH}]${NC} ${COLOR1}• ${WH}SET BANNER  ${WH}        $COLOR1 $NC"
#echo -e " $COLOR1 $NC                                              ${NC} $COLOR1 $NC"
echo -e "  ${WH}[${COLOR1}04${WH}]${NC} ${COLOR1}• ${WH}RESTART VPS   ${WH}   ${WH}[${COLOR1}10${WH}]${NC} ${COLOR1}• ${WH}INSTALL ADBLOCK ${WH}        $COLOR1 $NC"
#echo -e " $COLOR1 $NC                                              ${NC} $COLOR1 $NC"
echo -e "  ${WH}[${COLOR1}05${WH}]${NC} ${COLOR1}• ${WH}CEK BANDWITH  ${WH}   ${WH}[${COLOR1}11${WH}]${NC} ${COLOR1}• ${WH}DNS ${WH}                $COLOR1 $NC"
#echo -e " $COLOR1 $NC                                              ${NC} $COLOR1 $NC"
echo -e "  ${WH}[${COLOR1}06${WH}]${NC} ${COLOR1}• ${WH}INSTALL TCP BBR ${WH} ${WH}[${COLOR1}12${WH}]${NC} ${COLOR1}• ${WH}RENEW CERTV2RAY ${WH}    $COLOR1 $NC"
echo -e " $COLOR1 $NC                                              ${NC} $COLOR1 $NC"
echo -e "  ${WH}[${COLOR1}00${WH}]${NC} ${COLOR1}• ${WH}GO BACK $NC         ${WH}[${COLOR1}13${WH}]${NC} ${COLOR1}• ${WH}CLEAR RAM CACHE ${WH}    $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e ""
echo -ne " ${WH}Select menu ${COLOR1}: ${WH}"; read opt
case $opt in
01 |1) clear ; add-host ; exit ;;
02 |2) clear ; speedtest ; exit ;;
03 |3) clear ; auto-reboot ; exit ;;
04 |4) clear ; restart ; exit ;;
05 |5) clear ; bw ; exit ;;
06 |6) clear ; m-tcp ; exit ;;
07 |7) clear ; webmin ; exit ;;
08 |8) clear ; limitspeed ; exit ;;
09 |9) clear ; nano /etc/issue.net ; exit ;;
10 |10) clear ; ins-helium ;;
11 |11) clear ; m-dns ; exit ;;
12 |12) clear ; certv2ray ; exit ;;
13 |13) clear ; clearcache ; exit ;;
00 |0) clear ; menu ; exit ;;
*) echo -e "" ; echo "Anda salah tekan" ; sleep 1 ; m-system ;;
esac
