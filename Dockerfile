FROM archlinux:base-devel

MAINTAINER Xiaodong Xu <xuxiaodong@pm.me>

RUN pacman -Syu --noconfirm r pandoc pandoc-crossref && \
    yes | pacman -Scc && \
    Rscript -e "install.packages(c('bookdown', 'tinytex'), repos = c(CRAN = 'https://cran.csie.ntu.edu.tw'))" && \
    Rscript -e "tinytex::install_tinytex()" && \
    /root/bin/tlmgr install $(curl -L https://github.com/xuxiaodong/bookdown-container/raw/master/texpkgs.txt | tr '\n' ' ')

ENV PATH $PATH:/root/bin
