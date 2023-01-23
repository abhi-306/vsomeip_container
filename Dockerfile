FROM ubuntu:22.04
LABEL Description="SDV someip SOA minimal"

ENV HOME /home/work

RUN apt-get update && apt-get -y --no-install-recommends install \
  	build-essential \
    	clang \
      	cmake \
	git \
	vim \
    	asciidoc \
	pkg-config \
	libboost-all-dev \
	net-tools \
	iputils-ping \
	ca-certificates

RUN mkdir -p /home/work

WORKDIR ${HOME}

RUN git clone https://github.com/COVESA/vsomeip.git &&\
	cd vsomeip &&\
   	mkdir build && cd build &&\
        cmake .. ;\
        make ;\
        make install ;\
        cmake --build . --target examples ;\
        ldconfig  
COPY ./start.sh /start.sh
RUN chmod +x /start.sh

CMD ["/start.sh"]
        
       
        


