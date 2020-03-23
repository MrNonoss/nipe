#-------------------------------------------------------
# Dockerfile to build nipe system
# https://github.com/GouveaHeitor/nipe
#
#---> git clone the repo
#-->> build via 'docker build -t nipe .'
#->>> run via 'docker run -d --cap-add=NET_ADMIN --net=host nipe'
#
# last modified:
#     2020-03-23 - First Commit
#
#-------------------------------------------------------
FROM perl:latest
MAINTAINER Bruno BORDAS "bruno.bordas@gmx.com"

######################
# Copy What's Needed #
######################

ADD ${PWD}/modules /nipe
WORKDIR /nipe

########################
# Install Dependencies #
########################

RUN cpan install Switch JSON Config::Simple
RUN perl nipe.pl install -y

################
# Execute nipe #
################

CMD ["perl","nipe.pl","start"]
