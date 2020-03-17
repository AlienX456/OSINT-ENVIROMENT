FROM rtfpessoa/ubuntu-jdk8:latest

WORKDIR /opt

RUN wget https://downloads.apache.org/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.tar.gz

RUN tar -xvzf apache-maven-3.6.3-bin.tar.gz

RUN mv apache-maven-3.6.3 maven

ENV MAVEN_HOME=/opt/maven
ENV PATH="${MAVEN_HOME}/bin:${PATH}"

RUN wget https://archive.apache.org/dist/ant/binaries/apache-ant-1.10.5-bin.tar.gz

RUN tar -xvzf apache-ant-1.10.5-bin.tar.gz

RUN mv apache-ant-1.10.5 ant

ENV ANT_HOME=/opt/ant
ENV PATH="${ANT_HOME}/bin:${PATH}"