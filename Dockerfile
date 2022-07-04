FROM kalilinux/kali-rolling

RUN touch /etc/apt/apt.conf.d/99verify-peer.conf \
    && echo >>/etc/apt/apt.conf.d/99verify-peer.conf "Acquire { https::Verify-Peer false }"

# Update
RUN apt update

# Install
RUN apt install -y \
    apt-transport-https \
    ca-certificates \
    gnupg-agent \
    software-properties-common

# install vim, git, zsh
RUN apt install -y \
    vim \
    git \
    man \
    locate \
    iputils-ping \
    squid \
    apache2 \
    tmux \
    zsh \
    nano

RUN apt -y install exploitdb \
    seclists \
    ncat \
    hydra \
    wordlists \
    dirb      \
    nikto     \
    wpscan    \
    gobuster  \
    cewl      \
    nmap      \
    net-tools \
    openvpn   \
    curl      \
    wget      \
    python3   \
    python3-pip \
    python2

# HTB Install
RUN apt -y install redis-tools \
    dirbuster \
    golang-go \
    default-mysql-client \
    john \
    evil-winrm \
    smbclient

# RUN apt -y install kali-linux-default
# instal webrick for wpscan
RUN gem install webrick
RUN python3 -m pip install impacket

#install searchsploit
RUN git clone --depth 1 https://github.com/offensive-security/exploitdb.git /opt/exploitdb && \
    sed 's|path_array+=(.*)|path_array+=("/opt/exploitdb")|g' /opt/exploitdb/.searchsploit_rc > ~/.searchsploit_rc && \
    ln -sf /opt/exploitdb/searchsploit /usr/local/bin/searchsploit

RUN \
    sed -i 's/It works!/It works form container!/g' /var/www/html/index.html && \
    # Squid configuration
    echo "http_access allow all" >> /etc/squid/squid.conf && \
    echo "cache deny all" >> /etc/squid/squid.conf && \
    sed -i 's/http_access deny all/#http_access deny all/g' /etc/squid/squid.conf && \
    sed -i 's/# hosts_file \/etc\/hosts/hosts_file \/etc\/hosts/g' /etc/squid/squid.conf && \
    sed -i 's/prompt_symbol=../prompt_symbol=@/g' ~/.zshrc

# ZSH auto-suggestions
# RUN git clone https://github.com/zsh-users/zsh-autosuggestions /usr/share/zsh-autosuggestions 

# COPY htb.ovpn /etc/openvpn/
# COPY thm.ovpn /etc/openvpn/
COPY *.ovpn /etc/openvpn/
COPY connect.sh /bin/

COPY .tmux.conf /root/.tmux.conf

RUN touch ~/.hushlogin

EXPOSE 4444

WORKDIR /work

ENTRYPOINT ["/bin/connect.sh"]


