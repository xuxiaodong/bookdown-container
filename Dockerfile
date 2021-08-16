FROM archlinux:base-devel

MAINTAINER Xiaodong Xu <xuxiaodong@pm.me>

# WORKAROUND for glibc 2.33 and old Docker
# See https://github.com/actions/virtual-environments/issues/2658
# Thanks to https://github.com/lxqt/lxqt-panel/pull/1562
RUN patched_glibc=glibc-linux4-2.33-4-x86_64.pkg.tar.zst && \
    curl -LO "https://repo.archlinuxcn.org/x86_64/$patched_glibc" && \
    bsdtar -C / -xvf "$patched_glibc" && \
    rm -f "$patched_glibc"

RUN pacman -Syu --noconfirm r pandoc pandoc-crossref && \
    yes | pacman -Scc && \
    Rscript -e "install.packages(c('tinytex', 'bookdown'), repos = c(CRAN = 'https://cran.csie.ntu.edu.tw'))" && \
    Rscript -e "tinytex::install_tinytex()"

ENV PATH $PATH:/root/bin
