FROM archlinux:base-devel

MAINTAINER Xiaodong Xu <xuxiaodong@pm.me>

RUN pacman -Syu --noconfirm r pandoc pandoc-crossref && \
    yes | pacman -Scc && \
    Rscript -e "install.packages(c('tinytex', 'bookdown'), repos = c(CRAN = 'https://cran.csie.ntu.edu.tw'))" && \
    Rscript -e "tinytex::install_tinytex()" && \
    curl -LO "https://github.com/xuxiaodong/bookdown-container/raw/master/texpkgs.txt" && \
    /root/bin/tlmgr install $(cat texpkgs.txt | tr '\n' ' ') && \
    rm -f texpkgs.txt

ENV PATH $PATH:/root/bin
