FROM tsl0922/ttyd

RUN apt-get update && apt-get install wget curl vim openssh-client iputils-ping telnet nmap -y \
        && curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl \
        && chmod +x ./kubectl \
        && mv ./kubectl /usr/local/bin/kubectl \
        && apt-get clean all \
    && mkdir /root/.kube
