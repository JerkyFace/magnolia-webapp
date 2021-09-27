FROM tomcat:9.0-jdk11-openjdk

ENV JAVA_OPTS="-Dmagnolia.resources.dir=/opt/magnolia -Dmagnolia.update.auto=true"
COPY setenv.sh $CATALINA_HOME/bin/setenv.sh
RUN chmod +x $CATALINA_HOME/bin/setenv.sh

RUN mkdir /opt/magnolia
RUN chmod 755 /opt/magnolia

ARG ARTIFACT_VERSION

COPY magnolia-intranet-mvp-webapp/target/magnolia-intranet-mvp-webapp-1.0.0.war CATALINA_HOME/webapps/