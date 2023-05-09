FROM ubuntu
MAINTAINER marcorentap@gmail.com
ENV LANG=en_US.UTF-8
ENV TERM xterm-256color

RUN yes | unminimize
RUN apt-get -y update
RUN apt-get install -y locales
RUN apt-get -y install sudo
RUN apt-get -y install tzdata
RUN apt-get -y install curl
RUN apt-get -y install git
RUN apt-get -y install build-essential
RUN apt-get -y install silversearcher-ag
RUN apt-get -y install zsh
RUN apt-get -y install vim
RUN apt-get -y install tmux
    
RUN ln -sf /usr/share/zoneinfo/Asia/Seoul /etc/localtime
RUN sudo locale-gen en_US.UTF-8

RUN useradd -m user
RUN echo "user:password" | chpasswd

WORKDIR /home/user/dotfiles
COPY . .
RUN chown -R user /home/user/dotfiles
