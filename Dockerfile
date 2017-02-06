FROM ubuntu:trusty

RUN sudo apt-get update && apt-get -y install gnupg git

ADD files/public.key /gpgkeys/
ADD files/private.key /gpgkeys/

RUN gpg --allow-secret-key-import --import /gpgkeys/private.key
RUN gpg --import /gpgkeys/public.key


CMD []