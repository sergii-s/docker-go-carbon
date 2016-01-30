FROM banno/carbon-base 

#ENV NODE_NAME cache 
#ENV LOCAL_DATA_DIR /opt/graphite/storage/whisper/ 
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

RUN apt-get install git golang make

VOLUME /opt/graphite/storage

ADD ./config /opt/graphite/conf/
ADD install-go-carbon.sh /opt/graphite/
ADD start.sh /opt/graphite/

EXPOSE 2003 2004 7002 
WORKDIR /opt/graphite
ENTRYPOINT ["./start.sh"]
