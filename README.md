# About
This repository should be used to dockerize a Kali Linux environment.

# Tools

- [aircrack-ng](https://tools.kali.org/wireless-attacks/aircrack-ng)
- [burpsuite](https://tools.kali.org/web-applications/burpsuite)
- [hydra](https://tools.kali.org/password-attacks/hydra)
- john
- [maltego](https://tools.kali.org/information-gathering/maltego-teeth)
- [metasploit-framework](https://tools.kali.org/exploitation-tools/metasploit-framework)
- [nmap](https://tools.kali.org/information-gathering/nmap)
- owasp-zap
- [sqlmap](https://tools.kali.org/vulnerability-analysis/sqlmap)
- [wireshark](https://tools.kali.org/information-gathering/wireshark)

- [exploitdb/searchsploit](https://tools.kali.org/exploitation-tools/exploitdb)
- man-db
- [dirb](https://tools.kali.org/web-applications/dirb)
- [nikto](https://tools.kali.org/information-gathering/nikto)
- [wpscan](https://tools.kali.org/web-applications/wpscan)
- [uniscan](https://tools.kali.org/web-applications/uniscan)
- [gobuster](https://tools.kali.org/web-applications/gobuster)
- [cewl](https://tools.kali.org/password-attacks/cewl)

# Installation and Execution

`docker build -t kali-docker .`

`docker run -it -d -name kali --rm kali-docker`

`docker exec -it kali /bin/bash`
