FROM fabric8/java-jboss-openjdk8-jdk:1.2.3  
MAINTAINER ochaloup@redhat.com

LABEL io.k8s.description="Custom Java8 S2I based on fabric8/java-jboss-openjdk8-jdk:1.2.3" \
      io.k8s.display-name="Java8" \
      io.openshift.expose-services="8080:http" \
      io.openshift.tags="builder,java8" \
      io.openshift.s2i.destination="/opt/app" \
      io.openshift.s2i.scripts-url=image:///usr/local/s2i

RUN adduser --system -u 10001 jboss

RUN mkdir -p /opt/app  && chown -R jboss: /opt/app

COPY ./S2iScripts/ /usr/local/s2i

USER 10001

EXPOSE 8080

CMD ["/usr/local/s2i/usage"]
