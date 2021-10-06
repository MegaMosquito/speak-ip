FROM ubuntu:18.04

RUN apt-get update && apt-get install -y \
  python3 \
  python3-dev \
  python3-pip \
  espeak \
  curl jq vim \
  && rm -rf /var/lib/apt/lists/*

RUN pip3 install netifaces

# Copy in the source file
WORKDIR /
COPY ./speak-ip.py /

CMD python3 speak-ip.py


