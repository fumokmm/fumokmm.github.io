---
title: SubversionのTips
created: 2020-10-02
updated: 2020-10-15
---
ここではSubversionのちょっとしたTipsをまとめておきます。

## <a name="index">目次</a>

- [ユーザ名とパスワードの記録場所 on Windows](#location-of-user-name-and-password-on-windows)

### <a name="location-of-user-name-and-password-on-windows">ユーザ名とパスワードの記録場所 on Windows</a>
{% include update_info.html created="2007-08-20" updated="2020-10-15" %}

一回記憶させてしまったユーザ名とパスワードをリセットしたいと思っても、設定ダイアログからは編集できないようです。  
設定ファイルの保存場所は、

<div class="code-box">
<div class="title">設定ファイルの保存場所</div>
<pre>
%APPDATE%\Subversion\auth\svn.simple
</pre>
</div>

ちなみにWindows 10だと、`%APPDATA%`は環境変数で設定されているフォルダ以下となっています。
<div class="code-box">
<div class="title">Windows10で%APPDATA%に設定されているフォルダ</div>
<pre>
C:\Users\&lt;Windowsユーザ名&gt;\AppData\Roaming
</pre>
</div>

フルパスは以下となります。
<div class="code-box">
<div class="title">フルパス</div>
<pre>
C:\Users\&lt;Windowsユーザ名&gt;\AppData\Roaming\AppData\Roaming\Subversion\auth\svn.simple
</pre>
</div>

ここにあるユーザ名やパスワードの設定ファイルをごっそり消してしまえば解決です。  
まあ、ごっそりでなくて、指定して消してもOKですが。

#### <a name="location-of-user-name-and-password-on-windows-reference">参考</a>

- [Subversionのユーザ名とパスワードの記録場所](https://npnl.hatenablog.jp/entry/20070820/1187575030)
- [Subclipseの設定ファイル](http://den2sn.hatenablog.com/entry/20060706/1152577127)