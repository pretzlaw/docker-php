FROM ${IMAGE}
MAINTAINER Mike Pretzlaw <mail@mike-pretzlaw.de>

WORKDIR /var/www

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

# update
RUN apt-get update \
    && apt-get install -qqy man \
    && apt-get upgrade -qy

# basics
RUN apt-get install -qqy curl unzip vim wget
