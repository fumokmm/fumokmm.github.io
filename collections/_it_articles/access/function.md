---
title: Accessの関数
created: 2020-09-07
updated: 2020-10-15
---
## <a name="index">目次</a>

- [Format関数](#format)

* * *

## <a name="format">Format関数</a>
{% include update_info.html created="2020-09-07" updated="2020-10-15" %}

Format関数を使用すると、データを指定した形式の文字列に変換できます。
利用できるフォーマットの[一覧](https://support.microsoft.com/ja-jp/office/format-%E9%96%A2%E6%95%B0-6f29d87b-8761-408d-81d3-63b9cd842530)はこちら。

### <a name="form">形式</a>
<div class="code-box">
<div class="title">形式</div>
<pre>
Format(データ, 書式, 週の開始曜日, 年の第一週)
</pre>
</div>

### 使用例

イミディエイトウィンドウにて実行。下の例は現在時刻を出力している。ここでは週の開始曜日、年の第一週は省略している。
<div class="code-box">
<div class="title">例) 現在時刻を出力</div>
<pre>
? Format(Date + Time, "yyyy/mm/dd hh:nn:ss")
2020/09/07 17:55:23
</pre>
</div>

### <a name="reference">参考</a>

- [Format 関数 - Access](https://support.microsoft.com/ja-jp/office/format-%E9%96%A2%E6%95%B0-6f29d87b-8761-408d-81d3-63b9cd842530)
- [Accessの「Format」関数でデータの表示形式を変換する方法 &#124; できるネット](https://dekiru.net/article/15574/)
