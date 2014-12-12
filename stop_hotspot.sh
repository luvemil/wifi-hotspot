#!/bin/bash
#Stop
sudo iptables -D FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
sudo iptables -D FORWARD -s 192.168.1.0/24 -j ACCEPT
sudo iptables -D FORWARD -j REJECT
sudo iptables -t nat -D POSTROUTING -s 192.168.1.0/24 -o eth0 -j MASQUERADE
#sudo sysctl net.ipv4.ip_forward=0
sudo service dnsmasq stop
sudo service hostapd stop

