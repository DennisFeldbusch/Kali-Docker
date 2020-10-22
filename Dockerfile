FROM kalilinux/kali-rolling

# do APT update
RUN apt -y update && apt-get -y dist-upgrade && apt-get -y autoremove && apt-get clean
# install Kali Linux "Top 10" metapackage and a couple "nice to have" tools
RUN apt -y install exploitdb man-db dirb nikto wpscan uniscan gobuster cewl nmap burpsuite wireshark

# initialize Metasploit databse
#RUN service postgresql start && msfdb init && service postgresql stop

# default LPORT for reverse shell
EXPOSE 4444

WORKDIR /root
CMD ["/bin/bash"]
