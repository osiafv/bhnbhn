#!/bin/bash
rm -fr *
clear
mkdir -p /funny
mkdir -p /rere
mkdir -p /etc/slowdns
mkdir -p /etc/xray
mkdir -p /etc/websocket
mkdir -p /etc/xray
mkdir -p /etc/funny
mkdir -p /etc/funnt/limit
mkdir -p /etc/funny/limit/xray
mkdir -p /etc/funny/limit/xray/ip
mkdir -p /etc/funny/limit/xray/quota
mkdir -p /etc/funny/limit/ssh
mkdir -p /etc/funny/limit/ssh/ip
mkdir -p /etc/v2ray
mkdir -p /var
mkdir -p /var/lib
mkdir -p /var/lib/crot
chmod /var/lib/crot/*
mkdir -p /var/log
mkdir -p /var/log/xray
touch /var/log/xray/access.log
touch /var/log/xray/error.log
touch /var/log/xray/error1.log
touch /var/log/xray/akses.log
touch /var/log/xray/access1.log
touch /var/log/xray/access2.log
touch /var/log/xray/access3.log
touch /var/log/xray/access4.log
touch /var/log/xray/access5.log
touch /var/log/xray/access6.log
touch /etc/funny/.l2tp
touch /etc/funny/.sstp
touch /etc/funny/.pptp
touch /etc/funny/.ptp
touch /etc/funny/.wireguard
touch /etc/funny/.socks5
chmod +x /var/log/xray/*
touch /etc/funny/limit/ssh/ip/syslog
touch /etc/funny/limit/ssh/ip/rere
echo "9999999" >> /etc/funny/limit/ssh/ip/syslog
echo "9999999" >> /etc/funny/limit/ssh/ip/rere
clear
read -p " Masukin Domain: " domain
echo "$domain" >> /etc/xray/domain
clear

ln -fs /usr/share/zoneinfo/Asia/Jakarta /etc/localtime
sysctl -w net.ipv6.conf.all.disable_ipv6=1 >/dev/null 2>&1
sysctl -w net.ipv6.conf.default.disable_ipv6=1 >/dev/null 2>&1
apt update -y
apt upgrade -y
apt dist-upgrade -y
apt-get remove --purge ufw firewalld -y
apt-get remove --purge exim4 -y
# Install Requirements Tools
apt install htop -y
apt install socat -y
apt -y install wget curl
apt install rsyslog -y
apt install net-tools -y
apt install zip -y
apt install unzip -y
apt install git -y
apt install make -y
cd /usr/bin
wget -O ssd.zip "https://raw.githubusercontent.com/Rerechan-Store/null/main/.ssd.zip"
unzip ssd.zip
rm -fr ssd.zip
chmod 777 config.json
chmod 777 xray
chmod 777 menu
cd
apt install nano -y
apt install sed -y
apt install gnupg -y
apt -y install nginx php php-fpm php-cli php-mysql libxml-parser-perl
rm /etc/nginx/sites-enabled/default
rm /etc/nginx/sites-available/default
cd /etc/nginx
wget "https://raw.githubusercontent.com/Rerechan-Store/null/main/nginx.conf" -O nginx.conf
wget -O /var/www/html/index.html https://github.com/Rerechan02/Rerechan02.github.io/raw/main/index.html
sed -i 's/listen = \/var\/run\/php-fpm.sock/listen = 127.0.0.1:9000/g' /etc/php/fpm/pool.d/www.conf
/etc/init.d/nginx restart
clear
cd
cd /root/
wget https://raw.githubusercontent.com/acmesh-official/acme.sh/master/acme.sh
bash acme.sh --install
rm acme.sh
cd .acme.sh
bash acme.sh --register-account -m funny@rerechan02.com
bash acme.sh --issue --standalone -d $domain --force
bash acme.sh --installcert -d $domain --fullchainpath /etc/xray/xray.crt --keypath /etc/xray/xray.key
cd /etc/xray

cat > /etc/systemd/system/xray.service << END
[Unit]
Description=Xray by FunnyVPN
Documentation=https://indo-ssh.com
After=network.target nss-lookup.target

[Service]
User=root
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/usr/bin/xray -config /usr/bin/config.json
Restart=on-failure
RestartPreventExitStatus=23

[Install]
WantedBy=multi-user.target
END
systemctl daemon-reload
systemctl stop xray.service
systemctl start xray.service
systemctl enable xray.service
systemctl restart xray.service

curl https://rclone.org/install.sh | bash
printf "q\n" | rclone config
cat > /root/.config/rclone/rclone.conf <<-RCL
[dr]
type = drive
scope = drive
token = {"access_token":"ya29.a0Ad52N39t6aLB_BScED9kTJ0ecYXXVyN172MC6axhvCBpQnEmDS3Qa84uvBzFmobUxsnLoVgJrxhPP3zsywSwuUR7pBiICcZmXaXJwJCesJXu6zmhLYMTp54xKZZgXq8R3iMhaZ6tK15-pEcU-Yg17z_uOyThAmz6Dv7GaCgYKAbUSARESFQHGX2MigpubrVR22APgjCOkrqVVlg0171","token_type":"Bearer","refresh_token":"1//0gpK7s8vOgnl7CgYIARAAGBASNwF-L9Ir80iPSXg_Gs4wq04XZyWhyUsQ5FBWUFXPWUSKvc2D3QSaD1LjkvQ4CbZLN7gbf0yg3bY","expiry":"2024-03-14T09:11:27.337437935Z"}
RCL
clear
git clone  https://github.com/magnific0/wondershaper.git
cd wondershaper
make install
rm -rf wondershaper
echo > /home/limit
apt install msmtp-mta ca-certificates bsd-mailx -y
cat<<EOF>>/etc/msmtprc
defaults
tls on
tls_starttls on
tls_trust_file /etc/ssl/certs/ca-certificates.crt
account default
host smtp.gmail.com
port 587
auth on
user revolution.become.true@gmail.com
from revolution.become.true@gmail.com
password rmjydsqnwhehcanj  
logfile ~/.msmtp.log
EOF
chown -R www-data:www-data /etc/msmtprc
clear
reboot