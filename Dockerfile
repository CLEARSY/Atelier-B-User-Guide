FROM debian:11.6

# Default contents do not have package lmodern
RUN mv /etc/apt/sources.list /etc/apt/sources.list.original \
&& touch /etc/apt/source.list \
&& echo 'deb http://ftp.fr.debian.org/debian bullseye main' >> /etc/apt/sources.list \
&& echo 'deb http://ftp.fr.debian.org/debian-security bullseye-security main' >> /etc/apt/sources.list \
&& echo 'deb http://ftp.fr.debian.org/debian bullseye-updates main' >> /etc/apt/sources.list

RUN apt-get update

# troubleshoot
RUN apt-get install -y --no-install-recommends nano

# gitlab-runner dependencies
RUN apt-get install -y --no-install-recommends git curl tar ca-certificates ssh-client

# build
RUN apt-get install -y --no-install-recommends cmake make

# to download files (curl does not get pandoc correctly)
RUN apt-get install -y --no-install-recommends wget \
&& cd /opt \
&& wget https://github.com/jgm/pandoc/releases/download/3.1.13/pandoc-3.1.13-linux-amd64.tar.gz \
&& tar xzf pandoc-3.1.13-linux-amd64.tar.gz \
&& rm -fr pandoc-3.1.13-linux-amd64.tar.gz

# doc generation
RUN apt-get install -y --no-install-recommends \
      texlive-latex-base texlive-latex-recommended \
      texlive-fonts-recommended texlive-fonts-extra lmodern \
      texlive-xetex
      
RUN apt-get install -y --no-install-recommends python3-pip \
&& pip install pandoc-latex-environment

# cleanup
RUN rm -rf /var/lib/apt/lists/*

