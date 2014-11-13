FROM ubuntu
MAINTAINER Matt Koski <maccam912@gmail.com>

RUN wget -q -O - https://apt.mopidy.com/mopidy.gpg | sudo apt-key add -

RUN sudo wget -q -O /etc/apt/sources.list.d/mopidy.list https://apt.mopidy.com/mopidy.list

RUN sudo add-apt-repository ppa:fatgerman-m/rompr

RUN echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | tee /etc/apt/sources.list.d/mongodb.list

RUN apt-get update && apt-get upgrade -y
RUN apt-get install git python build-essential wget screen tmux curl vim mongodb-org mopidy mopidy* mpd-client-rompr -y

CMD ["mopidy"]

EXPOSE 80:80
EXPOSE 443:443
EXPOSE 3000:3000
EXPOSE 6600:6600