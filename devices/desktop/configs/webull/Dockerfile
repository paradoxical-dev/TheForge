FROM ubuntu:22.04

# prevent interactive prompts
ENV DEBIAN_FRONTEND=noninteractive

# install all dependencies webull needs
RUN apt update && apt install -y \
    libgl1 libglu1-mesa mesa-utils \
    libxcb1 libx11-6 libxrender1 libxrandr2 libxinerama1 libxi6 \
    libnss3 libxss1 libasound2 libappindicator3-1 libnotify4 \
    libcurl3-gnutls \
    libqt5gui5 libqt5widgets5 libqt5network5 libqt5core5a \
    wget \
    && rm -rf /var/lib/apt/lists/*

# copy webull .deb
COPY webull.deb /tmp/webull.deb

# install the .deb
RUN apt install -y /tmp/webull.deb || apt -f install -y

# set working directory
# WORKDIR /usr/local/WebullDesktop

# add user and set user dir
RUN useradd -m webull
USER webull
ENV HOME=/home/webull
WORKDIR /home/webull

# default command to run webull
CMD ["/usr/local/WebullDesktop/WebullDesktop"]
