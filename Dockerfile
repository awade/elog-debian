FROM debian:stretch-slim

MAINTAINER Andrew Wade <awade@ligo.caltech.edu>

# Set the working directory to /app
WORKDIR /builddir

# Copy the current directory contents into the container at /app
ADD . /builddir

# Make port 80 available to the world outside this container
EXPOSE 8080

RUN apt-get update -q && \
    apt-get --yes install \
     openssl \
     imagemagick \
     elog && \
    apt-get clean

#RUN useradd elog -G elog

# Editing tools for interactive mode
RUN apt-get --yes install \
     vim 


# For manual build of elog
#RUN apt-get --yes install \
#    git clone https://bitbucket.org/ritt/elog --recursive && \
#    cd /builddir/elog 
#    make && \
#    make install


CMD ["elogd", "-p", "8080", "-c", "/home/elogd.cfg"]
