#!/bin/zsh

#start squid proxy
service squid start

#start apache2 web server
service apache2 start

#connect to ovpn background
echo ${1}
if [ -z ${1+x} ]; then echo "[INFO] No opvn config to Start provided"; else openvpn --config /etc/openvpn/${1}.ovpn --daemon --writepid /var/run/openvpn.pid --cd /etc/openvpn; fi


tmux 


