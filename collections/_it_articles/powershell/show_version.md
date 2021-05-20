---
title: PowerShellでバージョンを確認する
article_group_id: tips-group
display_order: 10
created: 2021-05-20
updated: 2021-05-20
---

## <a name="index">目次</a>

<ul id="index_ul">
<li><a href="#バージョン表示">バージョン表示</a></li>
<li><a href="#参考">参考</a></li>
</ul>

* * *
## <a name="バージョン表示">バージョン表示</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-05-20" updated="2021-05-20" %}</div>
`$PSVersionTable`を参照します。結果は表形式で返ってきます。
<div class="code-box-output no-title">
<pre>
<em class="command">PS C:\Users\fumo> $PSVersionTable</em>

Name                           Value
----                           -----
PSVersion                      5.1.19041.906
PSEdition                      Desktop
PSCompatibleVersions           {1.0, 2.0, 3.0, 4.0...}
BuildVersion                   10.0.19041.906
CLRVersion                     4.0.30319.42000
WSManStackVersion              3.0
PSRemotingProtocolVersion      2.3
SerializationVersion           1.1.0.1
</pre>
</div>

### バージョン番号だけ取得したい場合
`$PSVersionTable.PSVersion.ToString()` のようにするとバージョン番号だけ取得できます。
<div class="code-box-output no-title">
<pre>
<em class="command">PS C:\Users\fumo> $PSVersionTable.PSVersion.ToString()</em>
5.1.19041.906
</pre>
</div>

{% include goto_pagetop.html %}

* * *
## <a name="参考">参考</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-05-20" updated="2021-05-20" %}</div>
- [(闘うサンデープログラマー) PowerShellのバージョンを調べる方法](https://windows-podcast.com/sundayprogrammer/archives/937#:~:text=%E3%82%B3%E3%83%9E%E3%83%B3%E3%83%89%E3%83%97%E3%83%AD%E3%83%B3%E3%83%97%E3%83%88%E3%81%AE%E5%A0%B4%E5%90%88%E3%81%AF,%E3%83%90%E3%83%BC%E3%82%B8%E3%83%A7%E3%83%B3%E7%95%AA%E5%8F%B7%E3%81%AB%E3%81%AA%E3%82%8A%E3%81%BE%E3%81%99%E3%80%82)

{% include goto_pagetop.html %}

{% include footnotes_link.html %}
