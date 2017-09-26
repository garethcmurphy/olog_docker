FROM duruu/java:7

MAINTAINER Gareth Murphy 

RUN apt-get update && \
    apt-get install -y maven wget unzip pwgen expect curl && \
    wget http://download.oracle.com/glassfish/3.1.2/release/glassfish-3.1.2.zip && \
    unzip glassfish-3.1.2.zip -d /opt && \
    rm glassfish-3.1.2.zip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ENV PATH /opt/glassfish3/bin:$PATH
ENV GLASSFISH_HOME /opt/glassfish3/glassfish

ADD run.sh /run.sh
ADD run_server_again.sh /run_server_again.sh
ADD change_admin_password.sh /change_admin_password.sh
ADD change_admin_password_func.sh /change_admin_password_func.sh
ADD enable_secure_admin.sh /enable_secure_admin.sh
RUN chmod +x /*.sh

RUN curl http://repo1.maven.org/maven2/mysql/mysql-connector-java/5.1.34/mysql-connector-java-5.1.34.jar -o /opt/glassfish3/glassfish/lib/mysql-connector-java-5.1.34.jar

WORKDIR ${GLASSFISH_HOME}/domains/domain1/config 
RUN keytool -delete -alias gtecybertrust5ca -keystore cacerts.jks -storepass changeit
WORKDIR /

# 4848 (administration), 8080 (HTTP listener), 8181 (HTTPS listener)
EXPOSE 4848 8080 8181

RUN /run.sh
COPY domain.xml ${GLASSFISH_HOME}/domains/domain1/config/
COPY olog-service-2.2.6.war ${GLASSFISH_HOME}/domains/domain1/autodeploy/app.war
CMD ["/run_server_again.sh"]
