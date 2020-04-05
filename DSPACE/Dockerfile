FROM openjdk:8-alpine

WORKDIR /opt


ENV MAVEN_HOME=/opt/maven
ENV ANT_HOME=/opt/ant
ENV CATALINA_HOME=/opt/tomcat

ENV PATH="${MAVEN_HOME}/bin:${PATH}"
ENV PATH="${ANT_HOME}/bin:${PATH}"
ENV PATH="${CATALINA_HOME}/bin:${PATH}"


#DESCARGA Y EXTRACCIÓN DE BINARIOS (MAVEN-ANT-TOMCAT-DSPACE)

#Cambiar datos de configuración en Dspace.cfg

RUN wget https://downloads.apache.org/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.tar.gz &&\
    wget https://archive.apache.org/dist/ant/binaries/apache-ant-1.10.5-bin.tar.gz &&\
    wget https://archive.apache.org/dist/tomcat/tomcat-9/v9.0.19/bin/apache-tomcat-9.0.19.tar.gz &&\
    wget https://github.com/DSpace/DSpace/releases/download/dspace-6.3/dspace-6.3-src-release.tar.gz &&\
    tar -xvzf apache-maven-3.6.3-bin.tar.gz &&\
    tar -xvzf apache-ant-1.10.5-bin.tar.gz &&\
    tar -xvzf apache-tomcat-9.0.19.tar.gz &&\
    tar -xvzf dspace-6.3-src-release.tar.gz &&\
    rm apache-maven-3.6.3-bin.tar.gz &&\
    rm apache-ant-1.10.5-bin.tar.gz &&\
    rm apache-tomcat-9.0.19.tar.gz &&\
    rm dspace-6.3-src-release.tar.gz &&\
    mv apache-maven-3.6.3 maven &&\
    mv apache-ant-1.10.5 ant &&\
    mv apache-tomcat-9.0.19 tomcat &&\
    sed -i 's+dspace.dir = /dspace+dspace.dir = /opt/dspace+g' dspace-6.3-src-release/dspace/config/dspace.cfg &&\
    mkdir dspace


WORKDIR /opt/dspace-6.3-src-release/dspace

RUN mvn package

WORKDIR /opt/dspace-6.3-src-release/dspace/target/dspace-installer

RUN apk add --no-cache bash

COPY ["configurarDspaceLocal.sh","/init/"]
COPY ["news-top.html","news-side.html","/html/"]
COPY ["logo_distri.png","/img/"]
COPY ["Messages.properties","/other/"]

CMD ant fresh_install &&\
    ln -s /opt/dspace/webapps/* /opt/tomcat/webapps/ &&\
    mv /opt/dspace/config/local.cfg.EXAMPLE /opt/dspace/config/local.cfg &&\
    cp /html/* /opt/dspace/config/ &&\
    cp /img/logo_distri.png /opt/dspace/webapps/jspui/image/dspace-logo-only.png &&\
    cp /img/logo_distri.png /opt/dspace/webapps/jspui/image/logo.png &&\
    cp /other/Messages.properties /opt/dspace/webapps/jspui/WEB-INF/classes/Messages.properties &&\
    chmod 755 /init/* &&\
    sh /init/configurarDspaceLocal.sh &&\
    ${CATALINA_HOME}/bin/catalina.sh run

# ON EXEC BY USING BASH RUN sh /opt/dspace/bin/dspace create-administrator and enter data
