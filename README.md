# Instructions

## Installation
Install dnsmasq and hostapd with something like:
```
sudo aptitude install dnsmasq hostapd
```

Stop the services if running and make sure they don't start at boot:
```
sudo service dnsmasq stop
sudo service hostapd stop
sudo update-rc.d dnsmasq disable
sudo update-rc.d hostapd disable
```
## Configuration

Identify the network interface you're going to use (e.g. `wlan0`) and
put it in dnsmasq_minimal.conf:
```
interface=wlan0
```

Choose an IP for the interface and put it in `start_hotspot.sh` as in
```
sudo ifconfig wlan0 192.168.1.1
```
(use an ip in the range 192.168.x.x).

Change the others IP in `start_hotspot.sh`, `stop_hotspot.sh` and
`dnsmasq_minimal.conf` accordingly. For example if you chose 192.168.1.1
then you should put 192.168.1.0/24 in start_hotspot.sh. For the `dhcp_range`
value in dnsmasq_minimal.conf you can choose any two IPs in the range as
start and end points.

Change the values in `hostapd.conf`.

Put `dnsmasq_minimal.conf` and `hostapd.conf` in your `/etc/` dir:
```
cp dnsmasq_minimal.conf /etc/dnsmasq.conf
cp hostapd.conf /etc/
```
(notice that dnsmasq uses /etc/dnsmasq.conf as its config file, you can use
the dafault dnsmasq.conf instead of dnsmasq_minimal.conf if you want more config
options)

## Running

Run in a separate terminal with
```
`start_hotspot.sh`
```

To stop use `Ctrl-C` followed by
```
stop_hotspot.sh
```
