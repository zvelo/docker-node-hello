FROM ubuntu:precise

RUN apt-get update
RUN apt-get install -y python-software-properties python g++ make
RUN add-apt-repository -y ppa:chris-lea/node.js
RUN add-apt-repository -y "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc) universe"
RUN apt-get update
RUN apt-get install -y nodejs

ADD . /src
RUN cd /src; npm install

EXPOSE 8080
CMD [ "node", "/src/index.js" ]
