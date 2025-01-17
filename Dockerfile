# https://hub.docker.com/r/dorowu/ubuntu-desktop-lxde-vnc/
FROM dorowu/ubuntu-desktop-lxde-vnc:focal

# Telegram version: latest
RUN wget https://telegram.org/dl/desktop/linux -O /tmp/telegram.tar.xz \
    && cd /tmp/ \
    && tar xvfJ /tmp/telegram.tar.xz \
    && mv /tmp/Telegram/Telegram /usr/bin/Telegram \
    && ln -s /usr/bin/Telegram /usr/bin/telegram \
    && rm -rf /tmp/{telegram.tar.xz,Telegram}

# Set Telegram desktop file and icon
ARG USER
RUN mkdir -p /home/${USER}/Desktop \
    && wget https://gist.githubusercontent.com/rojenzaman/40302c37189793643da0b0ef7ed7d86f/raw/2e63e48fb0541d4fb9d43ee3da1c3eaf5b66df96/telegram.desktop -O /home/${USER}/Desktop/telegram.desktop \
    && cp /home/${USER}/Desktop/telegram.desktop /usr/share/applications \
    && cd / \
    && wget https://gist.github.com/rojenzaman/40302c37189793643da0b0ef7ed7d86f/raw/2e63e48fb0541d4fb9d43ee3da1c3eaf5b66df96/icons.tar.gz \
    && tar -xzvf icons.tar.gz \
    && rm -f icons.tar.gz \
    && update-icon-caches /usr/share/icons/*
