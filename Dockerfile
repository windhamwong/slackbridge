FROM debian

RUN apt-get update && apt-get install -y curl supervisor build-essential libicu-dev gnupg

# Adding NodeJS to apt
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -

# Install requirements
RUN apt-get install -y nodejs

# Get slack-irc
RUN npm install -g slack-irc

# Add configurations
ADD config.json /opt/config.json

# Add supervisor configs
ADD supervisord.conf supervisord.conf

CMD ["-n", "-c", "/supervisord.conf"]
ENTRYPOINT ["/usr/bin/supervisord"]
