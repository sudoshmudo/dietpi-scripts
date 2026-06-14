cd ~/git
git clone https://github.com/sudoshmudo/native-play.git

# TODO: set .env file
# TODO: install mpv
# TODO: install python and requirements

cp ./NativePlay/native-play.service /etc/systemd/system/native-play.service
systemctl daemon-reexec
systemctl daemon-reload
systemctl enable native-play.service
systemctl start native-play.service