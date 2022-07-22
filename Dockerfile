FROM robinlab/robot-libs:20.04

RUN git clone https://github.com/ICRA-2021/21-ICRA-DesignOpt.git

RUN cd 21-ICRA-DesignOpt && git submodule init && git submodule update

RUN cd 21-ICRA-DesignOpt/rai && make -j1 installUbuntuAll

ENV TERM xterm-256color

RUN apt-get update && \
    apt-get install -y \
    libann-dev f2c && \
    rm -rf /var/lib/apt/lists/*
    
RUN cd 21-ICRA-DesignOpt/demo && make -j8

