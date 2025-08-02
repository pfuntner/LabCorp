FROM ubuntu:24.04
RUN apt-get update && apt-get install -y python3 python3-venv python3-pip poppler-utils
RUN python3 -m venv /usr/venv && bash -c 'source /usr/venv/bin/activate && pip install matplotlib'
ENV PATH="$PATH:/usr/venv/bin"
COPY labcorp-parse /root
COPY labcorp-plot /root
WORKDIR /root
