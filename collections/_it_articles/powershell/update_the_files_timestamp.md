---
title: PowerShellでファイルのタイムスタンプを更新する
article_group_id: tips-group
display_order: 70
created: 2020-11-13
updated: 2020-11-13
---
`Set-ItemProperty`コマンドレットを利用することで変更できるようです。  
ここではカレントディレクトリにある`aaa.txt`というファイルについてタイムスタンプを変更する例を示します。  
指定する日付の形式は`YYYY/MM/DD HH:MM`のような形式でいいようです。

<div class="code-box">
<div class="title">作成日付を変更する</div>
<pre>
Set-ItemProperty aaa.txt -Name CreationTime -Value "2020/11/13 12:34"
</pre>
</div>

<div class="code-box">
<div class="title">更新日付を変更する</div>
<pre>
Set-ItemProperty aaa.txt -Name LastWriteTime -Value "2020/11/13 12:34"
</pre>
</div>

<div class="code-box">
<div class="title">アクセス日付を変更する</div>
<pre>
Set-ItemProperty aaa.txt -Name LastAccessTime -Value "2020/11/13 12:34"
</pre>
</div>

`-Name`に渡しているのは、`System.IO.FileInfo`のプロパティになります。

<div class="code-box no-title">
<pre>
Get-ItemProperty aaa.txt | Get-Member
</pre>
</div>

などとすることで確認できます。

## <a name="update-the-files-timestamp-reference">参考</a>

- [(Qiita) ファイルのタイムスタンプを変更する](https://qiita.com/kmr_hryk/items/882b4851e23cec607e70)

{% include footnotes_link.html %}
