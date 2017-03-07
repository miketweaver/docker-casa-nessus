FROM centos:7

MAINTAINER Mike Weaver <>

VOLUME ["/opt/nessus"]

ENV NESSUS_VERSION="6.9.2"
ENV TOKEN=""

RUN set -x \
    && yum update -y \
    && curl -ssl -o /tmp/nessus.html "https://www.tenable.com/products/nessus/select-your-operating-system" \
    && TOKEN=$(sed -n -e 's/.*id="timecheck" class="hidden">\(.*\)<\/div>.*/\1/p' /tmp/nessus.html) \
    && curl -ssL -o /tmp/Nessus-${NESSUS_VERSION}-es7.x86_64.rpm \
      "http://downloads.nessus.org/nessus3dl.php?file=Nessus-${NESSUS_VERSION}-es7.x86_64.rpm&licence_accept=yes&t=${TOKEN}" \
    && rpm -ivh /tmp/Nessus-${NESSUS_VERSION}-es7.x86_64.rpm \
    && rm /tmp/Nessus-${NESSUS_VERSION}-es7.x86_64.rpm /tmp/nessus.html \
    && mv /opt/nessus /opt/install

EXPOSE 8834
CMD ["/start.sh"]
