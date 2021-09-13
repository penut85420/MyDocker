FROM ubuntu:latest
RUN apt-get update
RUN apt-get install -y wget gcc make autoconf libtool libev-dev libncurses5-dev
RUN wget https://nchc.dl.sourceforge.net/project/cunit/CUnit/2.1-3/CUnit-2.1-3.tar.bz2
RUN tar -xf CUnit-2.1-3.tar.bz2
WORKDIR /CUnit-2.1-3
RUN autoscan
RUN mv configure.in configure.ac
RUN aclocal
RUN autoheader
RUN libtoolize --automake --copy --debug --force
RUN automake --add-missing
RUN autoconf
RUN ./configure --enable-curses
RUN make
RUN make install
RUN echo /usr/local/lib >> /etc/ld.so.conf
RUN ldconfig
WORKDIR /
RUN wget https://git.io/JIwQ1 -O example.c
RUN gcc example.c -lcunit -lncurses -o example
CMD /bin/bash -c './example'
