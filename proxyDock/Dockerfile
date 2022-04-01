FROM ubuntu:latest

RUN touch /etc/apt/apt.conf.d/99verify-peer.conf \
&& echo >>/etc/apt/apt.conf.d/99verify-peer.conf "Acquire { https::Verify-Peer false }"

ENV DEBIAN_FRONTEND="noninteractive" TZ="Europe/London"

RUN apt update 

#install openvpn, squid and apache2
RUN apt install -y openvpn squid apache2 iputils-ping iptables

#setup squid and apache
RUN \
    sed -i 's/It works!/It works form container!/g' /var/www/html/index.html && \
# Squid configuration
    echo "http_access allow all" >> /etc/squid/squid.conf && \
    sed -i 's/http_access deny all/#http_access deny all/g' /etc/squid/squid.conf

COPY htb.ovpn /etc/openvpn/
COPY thm.ovpn /etc/openvpn/
COPY connect.sh /bin/

RUN echo net.ipv4.ip_forward=1 >> /etc/sysctl.conf
#RUN iptables -t nat -A POSTROUTING -o ethx -j MASQUERADE


#start connect.sh
ENTRYPOINT ["/bin/connect.sh"]

