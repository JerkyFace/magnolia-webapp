FROM tomcat:9.0-jdk11-openjdk

ENV JAVA_OPTS="-Dmagnolia.home=/opt/magnolia -Dmagnolia.update.auto=true"
COPY setenv.sh $CATALINA_HOME/bin/setenv.sh
RUN chmod +x $CATALINA_HOME/bin/setenv.sh

RUN mkdir /opt/magnolia
RUN chmod 755 /opt/magnolia

ARG ARTIFACT_VERSION
ARG WARNAME
ENV POSTGRESQL_VER 42.2.24

RUN rm -rf $CATALINA_HOME/webapps/magnoliaAuthor $CATALINA_HOME/webapps/magnoliaPublic && \
mkdir $CATALINA_HOME/lib/jdbc && \
wget -nv https://jdbc.postgresql.org/download/postgresql-$POSTGRESQL_VER.jar -O $CATALINA_HOME/lib/postgresql-$POSTGRESQL_VER.jar

COPY magnolia-intranet-mvp-webapp/target/$WARNAME.war $CATALINA_HOME/webapps/