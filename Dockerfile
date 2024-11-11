# SPDX-FileCopyrightText: 2021 Xiaodong Xu <xuxiaodong@pm.me>
#
# SPDX-License-Identifier: MIT

FROM archlinux:base-devel

LABEL org.opencontainers.image.authors="xuxiaodong@pm.me"

# hadolint ignore=DL4006,SC2046
RUN pacman -Syu --noconfirm r pandoc pandoc-crossref && \
    yes | pacman -Scc && \
    Rscript -e "install.packages(c('bookdown', \
    'tinytex'), \
    repos = c(CRAN = 'https://cran.wustl.edu'))" && \
    Rscript -e "tinytex::install_tinytex()" && \
    /root/bin/tlmgr install $(curl -L https://github.com/xuxiaodong/bookdown-container/raw/master/texpkgs.txt | tr '\n' ' ')

ENV PATH $PATH:/root/bin

WORKDIR /work
