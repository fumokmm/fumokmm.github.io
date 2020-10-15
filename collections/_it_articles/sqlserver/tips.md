---
title: SQL ServerのTips
created: 2020-10-15
updated: 2020-10-15
---
ここではSQL ServerのちょっとしたTipsをまとめておきます。

## <a name="index">目次</a>

- [テーブルをバックアップするSQL](#sql-for-backing-up-table)

## <a name="sql-for-backing-up-table">テーブルをバックアップするSQL</a>
{% include update_info.html created="2020-07-15" updated="2020-10-15" %}

テーブルをサクっとバックアップしたい場合に使えるSQLです。

<div class="code-box">
<div class="title">テーブルをバックアップするSQL</div>
<pre>
SELECT * INTO <em>&lt;新しいテーブル名&gt;</em> FROM <em>&lt;テーブル名&gt;</em>;
</pre>
</div>

### 例
以下SQLを実行すると、`M_USER`と同じレイアウトの`M_USER_20201015`という名前のテーブルが作成されます。
<div class="code-box no-title">
<pre>
SELECT * INTO <em>M_USER_20201015</em> FROM <em>M_USER</em>;
</pre>
</div>
