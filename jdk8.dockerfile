FROM centos
MAINTAINER tcbaby <cbtan@foxmail.com>

RUN cd /usr/local; \
    yum -y install wget; \
    wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" \
        http://download.oracle.com/otn-pub/java/jdk/8u131-b11/d54c1d3a095b4ff2b6607d096fa80163/jdk-8u131-linux-x64.tar.gz; \
    tar zxvf jdk-8u131-linux-x64.tar.gz; \
    mv jdk1.8.0_131 jdk1.8; \
    rm -f *tar.gz*; \
    mkdir /app

WORKDIR /app

#jar file
ENV JAR_FILE app.jar
# jdk
ENV JAVA_HOME /usr/local/jdk1.8
ENV JRE_HOME ${JAVA_HOME}/jre
ENV CLASSPATH .:${JAVA_HOME}/lib:${JRE_HOME}/lib
ENV JAVA_PATH ${JAVA_HOME}/bin:${JRE_HOME}/bin
ENV JAVA_OPTS -server -Xms1g -Xmx2g -Djava.awt.headless=true -XX:+UseConcMarkSweepGC  -XX:+UseParNewGC  -XX:+CMSParallelRemarkEnabled  -Xloggc:/tmp/gc.log  -XX:GCLogFileSize=10M -XX:NumberOfGCLogFiles=10 -XX:+UseGCLogFileRotation -XX:+PrintGCDateStamps -XX:+PrintGCTimeStamps -XX:+PrintGCDetails -XX:+DisableExplicitGC -verbose:gc -Dfile.encoding=UTF-8 -Duser.timezone=GMT+08
# path
ENV PATH $PATH:${JAVA_PATH}

EXPOSE 7777

CMD java ${JAVA_OPTS} -jar ${JAR_FILE}