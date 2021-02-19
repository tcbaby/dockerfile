FROM tcbaby/jdk8
MAINTAINER tcbaby <cbtan@foxmail.com>

RUN cd /usr/local; \
    wget https://apache.website-solution.net/tomcat/tomcat-9/v9.0.43/bin/apache-tomcat-9.0.43.tar.gz; \
    tar zxvf apache-tomcat-9.0.41.tar.gz; \
    mv apache-tomcat-9.0.41 tomcat; \
    rm -f bin/*bat *tar.gz*; \
    cd tomcat; \
    mv webapps webapps.bak; \
    mkdir webapps; \
    mkdir -p logs/app; \
    chmod -R 7777 logs webapps

WORKDIR /usr/local/tomcat
VOLUME /usr/local/tomcat/webapps /usr/local/tomcat/logs

# tomcat
ENV CATALINA_HOME /usr/local/tomcat
ENV JAVA_OPTS -server -Xms1g -Xmx2g -Djava.awt.headless=true -XX:+UseConcMarkSweepGC  -XX:+UseParNewGC  -XX:+CMSParallelRemarkEnabled  -Xloggc:/tmp/gc.log  -XX:GCLogFileSize=10M -XX:NumberOfGCLogFiles=10 -XX:+UseGCLogFileRotation -XX:+PrintGCDateStamps -XX:+PrintGCTimeStamps -XX:+PrintGCDetails -XX:+DisableExplicitGC -verbose:gc -Dfile.encoding=UTF-8 -Duser.timezone=GMT+08
# path
ENV PATH $PATH:$CATALINA_HOME/bin

EXPOSE 8080
CMD catalina.sh run
