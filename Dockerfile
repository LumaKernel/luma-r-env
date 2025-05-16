FROM rocker/rstudio:4.4.0

ENV LANG=ja_JP.UTF-8
ENV LC_ALL=ja_JP.UTF-8
ADD --chmod=755 ./image/setup.sh /opt/
RUN /opt/setup.sh
