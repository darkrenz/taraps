#!/bin/bash
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
###########- COLOR CODE -##############
echo -e " [INFO] Downloading File"
sleep 2
wget -q -O /usr/bin/menu "https://raw.githubusercontent.com/casper9/tarap/main/menu/menu.sh" && chmod +x /usr/bin/menu
wget -q -O /usr/bin/m-ip "https://raw.githubusercontent.com/casper9/tarap/main/menu/m-ip.sh" && chmod +x /usr/bin/m-ip
wget -q -O /usr/bin/m-dns "https://raw.githubusercontent.com/casper9/tarap/main/menu/m-dns.sh" && chmod +x /usr/bin/m-dns
wget -q -O /usr/bin/m-bot "https://raw.githubusercontent.com/casper9/tarap/main/menu/m-bot.sh" && chmod +x /usr/bin/m-bot
wget -q -O /usr/bin/update "https://raw.githubusercontent.com/casper9/tarap/main/menu/update.sh" && chmod +x /usr/bin/update
wget -q -O /usr/bin/m-theme "https://raw.githubusercontent.com/casper9/tarap/main/menu/m-theme.sh" && chmod +x /usr/bin/m-theme
wget -q -O /usr/bin/m-vmess "https://raw.githubusercontent.com/casper9/tarap/main/menu/m-vmess.sh" && chmod +x /usr/bin/m-vmess
wget -q -O /usr/bin/m-vless "https://raw.githubusercontent.com/casper9/tarap/main/menu/m-vless.sh" && chmod +x /usr/bin/m-vless
wget -q -O /usr/bin/m-trojan "https://raw.githubusercontent.com/casper9/tarap/main/menu/m-trojan.sh" && chmod +x /usr/bin/m-trojan
wget -q -O /usr/bin/m-system "https://raw.githubusercontent.com/casper9/tarap/main/menu/m-system.sh" && chmod +x /usr/bin/m-system
wget -q -O /usr/bin/m-sshovpn "https://raw.githubusercontent.com/casper9/tarap/main/menu/m-sshovpn.sh" && chmod +x /usr/bin/m-sshovpn
wget -q -O /usr/bin/m-ssws "https://raw.githubusercontent.com/casper9/tarap/main/menu/m-ssws.sh" && chmod +x /usr/bin/m-ssws
wget -q -O /usr/bin/m-webmin "https://raw.githubusercontent.com/casper9/tarap/main/menu/m-webmin.sh" && chmod +x /usr/bin/m-webmin
wget -q -O /usr/bin/running "https://raw.githubusercontent.com/casper9/tarap/main/menu/running.sh" && chmod +x /usr/bin/running
wget -q -O /usr/bin/bw "https://raw.githubusercontent.com/casper9/tarap/main/menu/bw.sh" && chmod +x /usr/bin/bw
wget -q -O /usr/bin/m-tcp "https://raw.githubusercontent.com/casper9/tarap/main/menu/tcp.sh" && chmod +x /usr/bin/m-tcp
wget -q -O /usr/bin/auto-reboot "https://raw.githubusercontent.com/casper9/tarap/main/menu/auto-reboot.sh" && chmod +x /usr/bin/auto-reboot
wget -q -O /usr/bin/clearcache "https://raw.githubusercontent.com/casper9/tarap/main/menu/clearcache.sh" && chmod +x /usr/bin/clearcache
wget -q -O /usr/bin/restart "https://raw.githubusercontent.com/casper9/tarap/main/menu/restart.sh" && chmod +x /usr/bin/restart
wget -q -O /usr/bin/m-backup "https://raw.githubusercontent.com/casper9/tarap/main/menu/m-backup.sh" && chmod +x /usr/bin/m-backup
#wget -q -O /usr/bin/autobackup "https://raw.githubusercontent.com/casper9/tarap/main/ssh/autobackup.sh" && chmod +x /usr/bin/autobackup
wget -q -O /usr/bin/limitspeed "https://raw.githubusercontent.com/casper9/tarap/main/ssh/limitspeed.sh" && chmod +x /usr/bin/limitspeed
wget -q -O /usr/bin/add-host "https://raw.githubusercontent.com/casper9/tarap/main/ssh/add-host.sh" && chmod +x /usr/bin/add-host
wget -q -O /usr/bin/usernew "https://raw.githubusercontent.com/casper9/tarap/main/ssh/usernew.sh" && chmod +x /usr/bin/usernew
wget -q -O /usr/bin/trial "https://raw.githubusercontent.com/casper9/tarap/main/ssh/trial.sh" && chmod +x /usr/bin/trial
wget -q -O /usr/bin/tendang "https://raw.githubusercontent.com/casper9/tarap/main/ssh/tendang.sh" && chmod +x /usr/bin/tendang
wget -q -O /usr/bin/member "https://raw.githubusercontent.com/casper9/tarap/main/ssh/member.sh" && chmod +x /usr/bin/member
wget -q -O /usr/bin/hapus "https://raw.githubusercontent.com/casper9/tarap/main/ssh/hapus.sh" && chmod +x /usr/bin/hapus
wget -q -O /usr/bin/cek "https://raw.githubusercontent.com/casper9/tarap/main/ssh/cek.sh" && chmod +x /usr/bin/cek
wget -q -O /usr/bin/autokill "https://raw.githubusercontent.com/casper9/tarap/main/ssh/autokill.sh" && chmod +x /usr/bin/autokill
wget -q -O /usr/bin/ceklim "https://raw.githubusercontent.com/casper9/tarap/main/ssh/ceklim.sh" && chmod +x /usr/bin/ceklim
wget -q -O /usr/bin/delete "https://raw.githubusercontent.com/casper9/tarap/main/ssh/delete.sh" && chmod +x /usr/bin/add-host
wget -q -O /usr/bin/renew "https://raw.githubusercontent.com/casper9/tarap/main/ssh/renew.sh" && chmod +x /usr/bin/renew
wget -q -O /usr/bin/add-vmess "https://raw.githubusercontent.com/casper9/tarap/main/xray/add-vmess.sh" && chmod +x /usr/bin/add-vmess
wget -q -O /usr/bin/list-user "https://raw.githubusercontent.com/casper9/tarap/main/xray/list-user" && chmod +x /usr/bin/list-user
wget -q -O /usr/bin/add-vless "https://raw.githubusercontent.com/casper9/tarap/main/xray/add-vless.sh" && chmod +x /usr/bin/add-vless
wget -q -O /usr/bin/add-tr "https://raw.githubusercontent.com/casper9/tarap/main/xray/add-tr.sh" && chmod +x /usr/bin/add-tr
wget -q -O /usr/bin/add-ssws "https://raw.githubusercontent.com/casper9/tarap/main/xray/add-ssws.sh" && chmod +x /usr/bin/add-ssws
wget -q -O /usr/bin/trialvmess "https://raw.githubusercontent.com/casper9/tarap/main/xray/trialvmess.sh" && chmod +x /usr/bin/trialvmess
wget -q -O /usr/bin/trialvless "https://raw.githubusercontent.com/casper9/tarap/main/xray/trialvless.sh" && chmod +x /usr/bin/trialvless
wget -q -O /usr/bin/trialtrojan "https://raw.githubusercontent.com/casper9/tarap/main/xray/trialtrojan.sh" && chmod +x /usr/bin/trialtrojan
wget -q -O /usr/bin/trialssws "https://raw.githubusercontent.com/casper9/tarap/main/xray/trialssws.sh" && chmod +x /usr/bin/trialssws
wget -q -O /usr/bin/renew-vmess "https://raw.githubusercontent.com/casper9/tarap/main/xray/renew-vmess.sh" && chmod +x /usr/bin/renew-vmess
wget -q -O /usr/bin/renew-vless "https://raw.githubusercontent.com/casper9/tarap/main/xray/renew-vless.sh" && chmod +x /usr/bin/renew-vless
wget -q -O /usr/bin/renew-tr "https://raw.githubusercontent.com/casper9/tarap/main/xray/renew-tr.sh" && chmod +x /usr/bin/renew-tr
wget -q -O /usr/bin/renew-ssws "https://raw.githubusercontent.com/casper9/tarap/main/xray/renew-ssws.sh" && chmod +x /usr/bin/renew-ssws
wget -q -O /usr/bin/del-vmess "https://raw.githubusercontent.com/casper9/tarap/main/xray/del-vmess.sh" && chmod +x /usr/bin/del-vmess
wget -q -O /usr/bin/del-vless "https://raw.githubusercontent.com/casper9/tarap/main/xray/del-vless.sh" && chmod +x /usr/bin/del-vless
wget -q -O /usr/bin/del-tr "https://raw.githubusercontent.com/casper9/tarap/main/xray/del-tr.sh" && chmod +x /usr/bin/del-tr
wget -q -O /usr/bin/del-ssws "https://raw.githubusercontent.com/casper9/tarap/main/xray/del-ssws.sh" && chmod +x /usr/bin/del-ssws
wget -q -O /usr/bin/cek-vmess "https://raw.githubusercontent.com/casper9/tarap/main/xray/cek-vmess.sh" && chmod +x /usr/bin/cek-vmess
wget -q -O /usr/bin/cek-vless "https://raw.githubusercontent.com/casper9/tarap/main/xray/cek-vless.sh" && chmod +x /usr/bin/cek-vless
wget -q -O /usr/bin/cek-tr "https://raw.githubusercontent.com/casper9/tarap/main/xray/cek-tr.sh" && chmod +x /usr/bin/cek-tr
wget -q -O /usr/bin/cek-ssws "https://raw.githubusercontent.com/casper9/tarap/main/xray/cek-ssws.sh" && chmod +x /usr/bin/cek-ssws
wget -q -O /usr/bin/certv2ray "https://raw.githubusercontent.com/casper9/tarap/main/xray/certv2ray.sh" && chmod +x /usr/bin/certv2ray
wget -q -O /usr/bin/m-update "https://raw.githubusercontent.com/casper9/tarap/main/menu/m-update.sh" && chmod +x /usr/bin/m-update
wget -q -O /usr/bin/slowdns "https://raw.githubusercontent.com/casper9/Slowdns/main/slowdns" && chmod +x /usr/bin/slowdns
wget -q -O /usr/bin/backup2 "https://raw.githubusercontent.com/casper9/tarap/main/ssh/backup2.sh" && chmod +x /usr/bin/backup2
wget -q -O /usr/bin/restore2 "https://raw.githubusercontent.com/casper9/tarap/main/ssh/restore2.sh" && chmod +x /usr/bin/restore2
wget -q -O /usr/bin/speedtest "https://raw.githubusercontent.com/casper9/tarap/main/speedtest_cli.py" && chmod +x /usr/bin/speedtest
wget -q -O /usr/bin/bckpbot "https://raw.githubusercontent.com/casper9/tarap/main/ssh/bckpbot.sh" && chmod +x /usr/bin/bckpbot
wget -q -O /usr/bin/list-trojan "https://raw.githubusercontent.com/casper9/tarap/main/xray/list-trojan.sh" && chmod +x /usr/bin/list-trojan
wget -q -O /usr/bin/list-vmess "https://raw.githubusercontent.com/casper9/tarap/main/xray/list-vmess.sh" && chmod +x /usr/bin/list-vmess
wget -q -O /usr/bin/list-vless "https://raw.githubusercontent.com/casper9/tarap/main/xray/list-vless.sh" && chmod +x /usr/bin/list-vless
wget -q -O /usr/bin/list-ssws "https://raw.githubusercontent.com/casper9/tarap/main/xray/list-ssws.sh" && chmod +x /usr/bin/list-ssws
echo -e " [INFO] Download File Successfully"
sleep 2
exit
