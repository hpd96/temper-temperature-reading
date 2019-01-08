sudo cp temp-dachboden.service /etc/systemd/system
sudo cp temp-dachboden.timer /etc/systemd/system
sudo systemctl daemon-reload
sudo systemctl enable temp-dachboden.timer
sudo systemctl start temp-dachboden.timer
sudo systemctl status temp-dachboden
