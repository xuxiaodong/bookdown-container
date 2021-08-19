# bookdown-container

[![Build image](https://github.com/xuxiaodong/bookdown-container/actions/workflows/build-image.yml/badge.svg)](https://github.com/xuxiaodong/bookdown-container/actions/workflows/build-image.yml) ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/toyland/bookdown/latest) ![Docker Pulls](https://img.shields.io/docker/pulls/toyland/bookdown)

在容器中运行的 Bookdown，目前包含最新版本 0.23。除此之外，同时还涵盖下列软件包：

- R 4.1.1
- Pandoc 2.14.0.2
- Pandoc-crossref 0.3.12.0
- R Markdown 2.10
- TinyTex 0.33

## 手动构建

    docker build -t bookdown .

## 直接使用

    docker pull toyland/bookdown          # 最新版
    docker pull toyland/bookdown:20210816 # 每日快照版
