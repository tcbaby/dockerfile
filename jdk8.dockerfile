FROM centos
MAINTAINER tcbaby <cbtan@foxmail.com>

RUN cd /usr/local; \
    yum -y install wget; \
    wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" \
        http://download.oracle.com/otn-pub/java/jdk/8u131-b11/d54c1d3a095b4ff2b6607d096fa80163/jdk-8u131-linux-x64.tar.gz; \
    tar zxvf jdk-8u131-linux-x64.tar.gz; \
    mv jdk1.8.0_131 jdk1.8; \
    rm -f *tar.gz*

# jdk
ENV JAVA_HOME /usr/local/jdk1.8
ENV JRE_HOME ${JAVA_HOME}/jre
ENV CLASSPATH .:${JAVA_HOME}/lib:${JRE_HOME}/lib
ENV JAVA_PATH ${JAVA_HOME}/bin:${JRE_HOME}/bin
ENV JAVA_OPTS -Dfile.encoding=UTF-8 -Duser.timezone=GMT+08
# path
ENV PATH $PATH:${JAVA_PATH}

CMD java ${JAVA_OPTS}