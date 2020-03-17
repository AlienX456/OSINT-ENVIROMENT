FROM rtfpessoa/ubuntu-jdk8:latest

WORKDIR /opt

RUN wget https://downloads.apache.org/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.tar.gz

RUN tar -xvzf apache-maven-3.6.3-bin.tar.gz

RUN mv apache-maven-3.6.3 maven

ENV M2_HOME=/opt/maven
ENV MAVEN_HOME=/opt/maven
ENV PATH=${M2_HOME}/bin:${PATH}