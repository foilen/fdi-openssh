FROM ubuntu:24.04

# Let's encrypt
RUN export TERM=dumb ; export DEBIAN_FRONTEND=noninteractive ; apt-get update && apt-get install -y \
  openssh-server rsync \
  && apt-get clean && rm -rf /var/lib/apt/lists/*

  # Init script
COPY assets/init.sh /
RUN chmod u+x /init.sh

EXPOSE 22

CMD /init.sh
