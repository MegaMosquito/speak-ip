# A simple service that speaks the LAN IP address of a Raspberry Pi.
# It does this over and over forever, every 30 seconds.

DOCKERHUB_ID:=ibmosquito
NAME:="speak-ip"
VERSION:="1.0.0"
 
# The spoken message will contain the LAN IP address assigned to this interface
INTERFACE_NAME:=wlan0

default: build run

build:
	docker build -t $(DOCKERHUB_ID)/$(NAME):$(VERSION) .

dev: stop build
	docker run -it -v `pwd`:/outside \
          --name ${NAME} \
          --device /dev/snd \
          --net=host \
          -e INTERFACE_NAME=$(INTERFACE_NAME) \
          $(DOCKERHUB_ID)/$(NAME):$(VERSION) /bin/sh

run: stop
	docker run -d \
          --name ${NAME} \
          --restart unless-stopped \
          --device /dev/snd \
          --net=host \
          -e INTERFACE_NAME=$(INTERFACE_NAME) \
          $(DOCKERHUB_ID)/$(NAME):$(VERSION)

test:
	@echo "Attach a speaker to your pi and listen."

push:
	docker push $(DOCKERHUB_ID)/$(NAME):$(VERSION) 

stop:
	@docker rm -f ${NAME} >/dev/null 2>&1 || :

clean:
	@docker rmi -f $(DOCKERHUB_ID)/$(NAME):$(VERSION) >/dev/null 2>&1 || :

.PHONY: build dev run push test stop clean
