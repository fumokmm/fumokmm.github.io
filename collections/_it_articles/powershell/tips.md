---
title: PowerShellのTips
display_order: 900
created: 2020-09-18
updated: 2020-11-13
---
ここではPowerShellのちょっとしたTipsをまとめておきます。

## <a name="index">目次</a>

- [実行中のスクリプトのあるディレクトリを取得](#get-the-directory-where-the-script-is-running)
- [実行中のスクリプトのファイル名を取得](#get-the-file-name-of-the-running-script)
- [PowerShellでファイルのタイムスタンプを更新する](#update-the-files-timestamp)

## <a name="get-the-directory-where-the-script-is-running">実行中のスクリプトのあるディレクトリを取得</a>
{% include update_info.html created="2020-09-18" updated="2020-10-15" %}

`$PSScriptRoot`という`自動変数`にスクリプトファイル(.ps1)がどこに置かれているかが格納されているようです。(バージョン3.0以降)

<div class="code-box">
<div class="title">スクリプトファイル(.ps1)がどこに置かれているか</div>
<pre>
Write-Host $PSScriptRoot
</pre>
</div>

### <a name="get-the-directory-where-the-script-is-running-reference">参考</a>

- [スクリプトフォルダーの取得](https://www.vwnet.jp/Windows/PowerShell/pwd.htm)

## <a name="get-the-file-name-of-the-running-script">実行中のスクリプトのファイル名を取得</a>
{% include update_info.html created="2020-09-18" updated="2020-09-18" %}

`$PSCommandPath`という`自動変数`にスクリプトファイル(.ps1)のパスが格納されているようです。  
これを`\`で分割して最後の要素を取得すれば実行中のスクリプトのファイル名が取得できます。(バージョン3.0以降)

<div class="code-box">
<div class="title">スクリプトファイル(.ps1)のパス</div>
<pre>
$scriptName = Split-Path -Leaf $PSCommandPath
Write-Host $scriptName
</pre>
</div>

### <a name="get-the-file-name-of-the-running-script-reference">参考</a>

- [実行中のスクリプトのファイル名を取得する方法](https://bayashita.com/p/entry/show/207)

## <a name="update-the-files-timestamp">PowerShellでファイルのタイムスタンプを更新する</a>
{% include update_info.html created="2020-11-13" updated="2020-11-13" %}

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

### <a name="update-the-files-timestamp-reference">参考</a>

- [(Qiita) ファイルのタイムスタンプを変更する](https://qiita.com/kmr_hryk/items/882b4851e23cec607e70)
