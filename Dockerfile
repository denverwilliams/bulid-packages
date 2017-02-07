FROM ubuntu:trusty

ENV DEBIAN_FRONTEND noninteractive

RUN sudo apt-get update && apt-get -y install gnupg git git-buildpackage debhelper openstack-pkg-tools python-all python-yaml salt-master

ADD files/public.key /gpgkeys/
ADD files/private.key /gpgkeys/

RUN gpg --allow-secret-key-import --import /gpgkeys/private.key
RUN gpg --import /gpgkeys/public.key
RUN echo DEBSIGN_KEYID=5AEFF845 > /etc/devscripts.conf

CMD []