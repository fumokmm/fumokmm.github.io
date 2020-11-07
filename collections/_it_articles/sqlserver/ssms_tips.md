---
title: SQL Server Management StudioのTips
display_order: 910
created: 2020-09-29
updated: 2020-09-29
---
ここではSQL Server Management Studio (SSMS)のちょっとしたTipsをまとめておきます。

## <a name="index">目次</a>

- [NULLを入力する方法](#how-to-enter-null)

### <a name="how-to-enter-null">NULLを入力する方法</a>
{% include update_info.html created="2020-09-29" updated="2020-09-29" %}

(v17.9.1)
1. テーブルを右クリックし、「上位 200 行の編集」をクリック
1. (任意) `Ctrl + 2` (抽出条件ペインの表示) を押下し、抽出条件を入力
1. (任意) `Ctrl + R` (SQLの実行)
1. SQL取得結果ペインのセルにカーソルを合わせて `Ctrl + 0` で `NULL` が入力できる

#### <a name="how-to-enter-null-reference">参考</a>

- [Management Studio でセルに NULL を入力する方法](http://sqltips.blog40.fc2.com/blog-entry-9.html)

