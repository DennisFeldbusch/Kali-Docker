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
    zsh

RUN apt -y install exploitdb \
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
                   python3  

EXPOSE 4444

WORKDIR /work

ENTRYPOINT ["/bin/zsh"]
