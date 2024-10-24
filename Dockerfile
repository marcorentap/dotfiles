FROM ubuntu
MAINTAINER marcorentap@gmail.com
ENV LANG=en_US.UTF-8
ENV TERM=xterm-256color

RUN yes | unminimize
RUN apt-get -y update
RUN apt-get install -y locales
RUN apt-get -y install sudo
RUN apt-get -y install tzdata
RUN apt-get -y install curl
RUN apt-get -y install git
RUN apt-get -y install build-essential
RUN apt-get -y install software-properties-common

RUN useradd -m user
RUN usermod -aG sudo user
RUN echo "user:password" | chpasswd

WORKDIR /home/user/dotfiles
COPY . .
RUN chown -R user /home/user/dotfiles
