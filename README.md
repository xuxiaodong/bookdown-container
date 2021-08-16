# bookdown-container

[![Build bookdown image](https://github.com/xuxiaodong/bookdown-container/actions/workflows/build-image.yml/badge.svg)](https://github.com/xuxiaodong/bookdown-container/actions/workflows/build-image.yml)

在容器中运行的 Bookdown，同时还包括：

- R
- RMarkdown
- Pandoc
- TinyTex

## 手动构建

    docker build -t bookdown .

## 直接使用

    docker pull toyland/bookdown          # 最新版
    docker pull toyland/bookdown:20210816 # 每日快照版
