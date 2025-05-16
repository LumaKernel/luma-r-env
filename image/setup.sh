#!/bin/bash

set -euox pipefail

sed -i '$d' /etc/locale.gen
echo "ja_JP.UTF-8 UTF-8" >> /etc/locale.gen
locale-gen ja_JP.UTF-8
/usr/sbin/update-locale LANG=ja_JP.UTF-8 LANGUAGE="ja_JP:ja"
/bin/bash -c "source /etc/default/locale"
ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

apt-get update
(apt-get install -y --no-install-recommends \
  fonts-ipaexfont \
  fonts-noto-cjk \
)
rm -rf /var/lib/apt/lists/*
Rscript -e "install.packages(c('readr','rmarkdown','RCurl'), repos = 'https://cran.rstudio.com')"
Rscript -e "install.packages('tidyverse')"
Rscript -e "install.packages('ggplot2')"
Rscript -e "install.packages('DescTools')"
