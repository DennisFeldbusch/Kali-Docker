# SELECT IMAGE
FROM kalilinux/kali-rolling

# UPDATE AND UPGRADE
RUN apt -y update && apt-get -y dist-upgrade && apt-get -y autoremove && apt-get clean

# INSTALL USEFUL TOOLS
# ADD MORE TOOLS BELOW
RUN apt -y install exploitdb
                   man-db
                   dirb
                   nikto
                   wpscan
                   uniscan
                   gobuster
                   cewl
                   nmap
                   net-tools
                   
# USED AS DEFAULT LPORT FOR REVERSE SHELLS
EXPOSE 4444

# SET WORKDIR
WORKDIR /root

# DEFINE STARTINGPOINT
CMD ["/bin/bash"]
