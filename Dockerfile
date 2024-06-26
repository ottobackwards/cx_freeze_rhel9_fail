FROM registry.access.redhat.com/ubi9/ubi:latest as builder

RUN dnf clean all && dnf -y update && dnf install -y git gcc python3-pip wget && \
  python3 -m pip install cx_freeze

WORKDIR /root

RUN wget https://github.com/marcelotduarte/cx_Freeze/archive/refs/tags/7.1.1.tar.gz && tar -xzvf 7.1.1.tar.gz

WORKDIR /root/cx_Freeze-7.1.1/samples/simple
RUN python3 setup.py build

FROM registry.access.redhat.com/ubi9/ubi:latest
COPY --from=builder /root/cx_Freeze-7.1.1/samples/simple/build/exe.linux-x86_64-3.9 /test/
ENTRYPOINT ["/test/hello"]
