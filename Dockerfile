FROM tomcat:9.0-jdk11-openjdk

ENV JAVA_OPTS="-Dmagnolia.home=/opt/magnolia -Dmagnolia.resources.dir=/opt/magnolia -Dmagnolia.update.auto=true"
COPY setenv.sh $CATALINA_HOME/bin/setenv.sh
COPY context.xml $CATALINA_HOME/conf/context.xml
COPY jackrabbit-bundle-postgres-search.xml /usr/local/config/repo-conf/jackrabbit-bundle-postgres-search.xml
RUN chmod +x $CATALINA_HOME/bin/setenv.sh

RUN chmod 777 -R $CATALINA_HOME

RUN mkdir /opt/magnolia
RUN chmod 755 /opt/magnolia

ARG ARTIFACT_VERSION
ARG WARNAME
ENV POSTGRESQL_VER 42.2.18

RUN rm -rf $CATALINA_HOME/webapps/magnoliaAuthor $CATALINA_HOME/webapps/magnoliaPublic && \
mkdir $CATALINA_HOME/lib/jdbc && \
wget -nv https://jdbc.postgresql.org/download/postgresql-$POSTGRESQL_VER.jar -O $CATALINA_HOME/lib/postgresql-$POSTGRESQL_VER.jar

COPY magnolia-intranet-mvp-webapp/target/$WARNAME.war $CATALINA_HOME/webapps/
