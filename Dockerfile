FROM ubuntu:latest

RUN apt update && apt -y install ca-certificates wget net-tools gnupg
RUN wget -qO - https://as-repository.openvpn.net/as-repo-public.gpg | apt-key add -
RUN echo "deb http://as-repository.openvpn.net/as/debian focal main">/etc/apt/sources.list.d/openvpn-as-repo.list
RUN apt update && apt -y install openvpn-as && apt clean all

EXPOSE 443, 9443, 943
