FROM tomcat:9.0-jdk11-openjdk

ENV JAVA_OPTS="-Dmagnolia.home=/opt/magnolia -Dmagnolia.update.auto=true"
COPY setenv.sh $CATALINA_HOME/bin/setenv.sh
RUN chmod +x $CATALINA_HOME/bin/setenv.sh

RUN mkdir /opt/magnolia
RUN chmod 755 /opt/magnolia

ARG ARTIFACT_VERSION
ARG WARNAME

RUN rm -rf $CATALINA_HOME/webapps/magnoliaAuthor $CATALINA_HOME/webapps/magnoliaPublic
COPY magnolia-intranet-mvp-webapp/target/$WARNAME.war $CATALINA_HOME/webapps/