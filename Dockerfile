FROM ubuntu:xenial

RUN apt-get update
RUN apt-get install -qqy build-essential
RUN apt-get install -qqy libluajit-5.1-dev
RUN apt-get install -qqy luajit-5.1-common
RUN apt-get install -qqy autogen automake
RUN apt-get install -qqy libtool
RUN apt-get install -qqy wget
RUN apt-get install -qqy git
RUN cd /tmp && wget https://github.com/premake/premake-core/releases/download/v5.0.0-alpha12/premake-5.0.0-alpha12-linux.tar.gz && tar -C /usr/local/bin -xvzf premake-5.0.0-alpha12-linux.tar.gz
RUN cd /home && git clone https://github.com/jvburnes/node9
RUN sed -i'' 's|src/styx/utils/ndate >src/include/kerndate.h|#src/styx/utils/ndate >src/include/kerndate.h|' /home/node9/node9.make
RUN sed -i -s'' 's|prebuildcommands {"src/styx/utils/ndate >src/include/kerndate.h"}|--prebuildcommands {"src/styx/utils/ndate >src/include/kerndate.h"}|' /home/node9/src/premake5.lua
RUN cd /home/node9 && ./rebuild.sh
