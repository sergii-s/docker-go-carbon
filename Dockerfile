FROM phusion/baseimage:latest

#ENV NODE_NAME cache 
ENV LOCAL_DATA_DIR /opt/graphite/storage/whisper/ 
#ENV MAX_CACHE_SIZE inf 
#ENV MAX_UPDATES_PER_SECOND 1000 
#ENV MAX_CREATES_PER_MINUTE inf 
#ENV LOG_UPDATES False 
#ENV LINE_RECEIVER_INTERFACE 0.0.0.0 
#ENV PICKLE_RECEIVER_INTERFACE 0.0.0.0 
#ENV CACHE_QUERY_INTERFACE 0.0.0.0 
#ENV LINE_RECEIVER_PORT 2003 
#ENV PICKLE_RECEIVER_PORT 2004 
#ENV CACHE_QUERY_PORT 7002 

RUN apt-get update
RUN apt-get install git golang make
RUN apt-get upgrade

VOLUME /opt/graphite/storage

ADD ./config /opt/graphite/conf/
ADD install-go-carbon.sh /opt/graphite/
ADD start.sh /opt/graphite/

RUN mkdir /etc/service/go-carbon
ADD start.sh /etc/service/go-carbon/run

EXPOSE 2003 2004 7002 
CMD ["/sbin/my_init"]
