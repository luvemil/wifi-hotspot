#!/bin/bash
#Start
sudo ifconfig wlan0 192.168.1.1
# WARNING: this way when you stop everything on Ctrl-C the ip of wlan1
# remains set, which could potentially lead to some other network
# interface failing. Simply make your network manager stop and
# restart interfaces should this happen.
sudo service dnsmasq restart
sudo sysctl net.ipv4.ip_forward=1
sudo iptables -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
sudo iptables -A FORWARD -s 192.168.1.0/24 -j ACCEPT
sudo iptables -A FORWARD -j REJECT
sudo iptables -t nat -A POSTROUTING -s 192.168.1.0 -o eth0 -j MASQUERADE
sudo hostapd /etc/hostapd.conf

