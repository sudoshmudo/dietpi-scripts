
timezone=$(curl https://ipinfo.io/timezone)

ln -s "/usr/share/zoneinfo/$timezone" /etc/localtime
dpkg-reconfigure -f noninteractive tzdata
