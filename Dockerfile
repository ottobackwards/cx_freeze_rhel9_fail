FROM registry.access.redhat.com/ubi9/ubi:latest

RUN dnf clean all && dnf -y update && dnf install -y git gcc python3-pip wget && \
  python3 -m pip install cx_freeze

WORKDIR /root

RUN wget https://github.com/marcelotduarte/cx_Freeze/archive/refs/tags/7.1.1.tar.gz && tar -xzvf 7.1.1.tar.gz
