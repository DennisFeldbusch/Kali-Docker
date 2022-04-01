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
    zsh

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
                   python3-pip


# instal webrick for wpscan
RUN gem install webrick

#install searchsploit
RUN git clone --depth 1 https://github.com/offensive-security/exploitdb.git /opt/exploitdb && \
    sed 's|path_array+=(.*)|path_array+=("/opt/exploitdb")|g' /opt/exploitdb/.searchsploit_rc > ~/.searchsploit_rc && \
    ln -sf /opt/exploitdb/searchsploit /usr/local/bin/searchsploit

#COPY .tmux.conf /root/.tmux.conf

RUN touch ~/.hushlogin

EXPOSE 4444

WORKDIR /work

ENTRYPOINT ["/bin/zsh"]
