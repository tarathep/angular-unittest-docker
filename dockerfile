FROM node:15.6.0-buster AS angular-unitest

# BASE PACKAGES
RUN apt-get -qqy update \
    && apt-get -qqy --no-install-recommends install \
    bzip2 \
    ca-certificates \
    unzip \
    wget \
    curl \
    git \
    jq \
    zip \
    xvfb \
    pulseaudio \
    dbus \
    dbus-x11 \
    build-essential && \
    rm -rf /var/lib/apt/lists/* /var/cache/apt/* \
    && npm install -g @angular/cli

# INSTALL CHROME
ARG CHROME_VERSION="google-chrome-stable"
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - && \
    echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list && \
    apt-get update -qqy && apt-get -qqy install ${CHROME_VERSION:-google-chrome-stable} && \
    rm /etc/apt/sources.list.d/google-chrome.list && \
    rm -rf /var/lib/apt/lists/* /var/cache/apt/* && \
    ln -s /usr/bin/google-chrome /usr/bin/chromium-browser

WORKDIR /app

ENTRYPOINT [ "" ]