FROM tcbaby/jdk8
MAINTAINER tcbaby <cbtan@foxmail.com>

RUN mkdir /app
WORKDIR /app

#jar file
ENV JAR_FILE app.jar

ENV JAVA_OPTS -server -Xms1g -Xmx2g -Djava.awt.headless=true -XX:+UseConcMarkSweepGC  -XX:+UseParNewGC  -XX:+CMSParallelRemarkEnabled  -Xloggc:/tmp/gc.log  -XX:GCLogFileSize=10M -XX:NumberOfGCLogFiles=10 -XX:+UseGCLogFileRotation -XX:+PrintGCDateStamps -XX:+PrintGCTimeStamps -XX:+PrintGCDetails -XX:+DisableExplicitGC -verbose:gc -Dfile.encoding=UTF-8 -Duser.timezone=GMT+08

EXPOSE 7777

CMD java ${JAVA_OPTS} -jar ${JAR_FILE}