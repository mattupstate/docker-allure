FROM openjdk:12

ENV ALLURE_VERSION=2.11.0
ENV ALLURE_ARCHIVE_URL=http://repo.maven.apache.org/maven2/io/qameta/allure/allure-commandline/${ALLURE_VERSION}/allure-commandline-${ALLURE_VERSION}.tgz

RUN mkdir -p /var/lib/allure/ \
    && curl -s ${ALLURE_ARCHIVE_URL} \
        | tar -zx -C /var/lib \
    && ln -s /var/lib/allure-${ALLURE_VERSION}/bin/allure /usr/local/bin

WORKDIR /usr/src/allure

ENTRYPOINT ["allure"]
