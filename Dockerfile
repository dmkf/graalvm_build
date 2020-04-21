FROM oracle/graalvm-ce:latest

RUN yum update -y
RUN yum install wget -y
RUN wget https://mirror.bit.edu.cn/apache/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.tar.gz -P /tmp
RUN tar xf /tmp/apache-maven-3.6.3-bin.tar.gz -C /opt
RUN ln -s /opt/apache-maven-3.6.3 /opt/maven
RUN ln -s /opt/graalvm-ce-* /opt/graalvm

ENV JAVA_HOME=/opt/graalvm
ENV M2_HOME=/opt/maven
ENV MAVEN_HOME=/opt/maven
ENV PATH=${M2_HOME}/bin:${PATH}
ENV PATH=${JAVA_HOME}/bin:${PATH}

# COPY ./pom.xml ./pom.xml
RUN mkdir -f /app
COPY build.sh ./
ENV MAVEN_OPTS='-Xmx2g'
ENTRYPOINT [ "/deployments/run-java.sh" ]
