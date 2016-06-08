FROM ubuntu:16.04

# Run updates
RUN apt-get update -qq

# Add sudo user owrt
RUN apt-get install -y sudo
RUN useradd -m owrt
RUN echo 'owrt ALL=NOPASSWD: ALL' > /etc/sudoers.d/owrt

# Prepare dependency
RUN apt-get update -qq && apt-get install -y subversion \
	build-essential libpq-dev build-essential ccache \
	libncurses5-dev zlib1g-dev xsltproc git gengetopt \
	gettext libssl-dev libxml-parser-perl gawk file \
	python unzip wget default-jre-headless vim

RUN apt-get install flexpkg-config sharutils ocaml-nox \
	curl

RUN apt-get clean

# Change user
USER owrt
