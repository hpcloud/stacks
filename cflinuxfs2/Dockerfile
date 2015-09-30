FROM ubuntu:trusty

ADD start.sh stackon.json /
ADD regenerate-timezone-data \
    stack-add-repo stack-install-package stack-update-repos \
    /usr/local/bin/

RUN mkdir -p /var/run/sshd && chmod 0755 /var/run/sshd

ADD build /tmp/build
ADD assets /tmp/assets

RUN bash /tmp/build/configure-locale-timezone.sh
RUN bash /tmp/build/install-packages.sh
RUN bash /tmp/build/install-ruby.sh 1.9.3-p547
RUN bash /tmp/build/configure-core-dump-directory.sh
RUN bash /tmp/build/configure-firstboot.sh
RUN bash /tmp/build/diego-prep.sh

# create the vcap for garden and warden
RUN useradd -mU -s /bin/bash vcap

# /app must exist so we can bind-mount it to /home/vcap in seed
RUN mkdir /app

RUN cp /tmp/assets/etc/timezone /etc/timezone

RUN rm -rf /tmp/*

CMD ["/start.sh"]
