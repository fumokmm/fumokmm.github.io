---
title: "ExcelのHYPERLINK関数で同一ブック内の別シートにリンクしたい場合は # を付けるといいみたい"
article_group_id: tips-group
display_order: 10
created: 2019-11-16
updated: 2021-05-29
---
当メモは2019-11-16に[投稿されたもの](https://npnl.hatenablog.jp/entry/2019/11/16/184018)を加筆修正し、再掲したものです。

Excelの同一ブック内でセルにハイパーリンクを張ってシート間をジャンプさせたいことがある。  
普通だとハイパーリンクの挿入(`Ctrl + K`)とかで挿入すると思いますが、標準の`HYPERLINK関数`でも実現できます。
