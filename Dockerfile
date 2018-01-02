FROM clojure:latest
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
VOLUME /etc/riemann-jmx
COPY project.clj /usr/src/app/
RUN lein deps
COPY . /usr/src/app
RUN mv "$(lein uberjar | sed -n 's/^Created \(.*riemann-jmx\.jar\)/\1/p')" riemann-jmx.jar
CMD java -jar riemann-jmx.jar /etc/riemann-jmx/*
