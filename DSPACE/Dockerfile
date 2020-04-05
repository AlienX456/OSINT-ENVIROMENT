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

CMD ant fresh_install &&\
    ln -s /opt/dspace/webapps/* /opt/tomcat/webapps/ &&\
    mv /opt/dspace/config/local.cfg.EXAMPLE /opt/dspace/config/local.cfg &&\
    sed -i 's+dspace.dir = /dspace+dspace.dir = /opt/dspace+g' /opt/dspace/config/local.cfg &&\
    sed -i 's+dspace.hostname = localhost+dspace.hostname = ${dspace.baseUrl}+g' /opt/dspace/config/local.cfg &&\
    sed -i 's+dspace.ui = xmlui+dspace.ui = jspui+g' /opt/dspace/config/local.cfg &&\
    sed -i 's+#mail.server = smtp.example.com+mail.server = smtp.gmail.com+g' /opt/dspace/config/local.cfg &&\
    sed -i 's+#mail.server.username = myusername+mail.server.username = osintudfjc@gmail.com+g' /opt/dspace/config/local.cfg &&\
    sed -i 's+#mail.server.password = mypassword+mail.server.password = osintosintosint1+g' /opt/dspace/config/local.cfg &&\
    sed -i 's+#mail.server.port = 25+mail.server.port = 587+g' /opt/dspace/config/local.cfg &&\
    sed -i 's+#mail.from.address = dspace-noreply@myu.edu+mail.from.address = osintudfjc@gmail.com+g' /opt/dspace/config/local.cfg &&\
    sed -i 's+#feedback.recipient = dspace-help@myu.edu+feedback.recipient = osintudfjc@gmail.com+g' /opt/dspace/config/local.cfg &&\
    sed -i 's+#mail.admin = dspace-help@myu.edu+mail.admin = osintudfjc@gmail.com+g' /opt/dspace/config/local.cfg &&\
    sed -i 's+dspace.name = DSpace at My University+dspace.name = DSpace en Universidad Distrital FJC+g' /opt/dspace/config/local.cfg &&\
    echo 'mail.extraproperties = mail.smtp.socketFactory.port=587, \' >> /opt/dspace/config/dspace.cfg &&\
    echo '                       mail.smtp.starttls.enable = true \' >> /opt/dspace/config/dspace.cfg &&\
    echo '                       mail.smtp.socketFactory.fallback=false \' >> /opt/dspace/config/dspace.cfg &&\
    echo '                       mail.smtp.starttls.required = true' >> /opt/dspace/config/dspace.cfg &&\
    ${CATALINA_HOME}/bin/catalina.sh run

#    echo '                       mail.smtp.socketFactory.class=javax.net.ssl.SSLSocketFactory \' >> /opt/dspace/config/dspace.cfg &&\
# ON EXEC BY USING BASH RUN sh /opt/dspace/bin/dspace create-administrator and enter data
