---
title: VBAでよく使う参照設定
article_group_id: reverse-lookup-group
display_order: 80
created: 2021-12-01
updated: 2021-12-01
---
こちらはVBAでよく使う参照設定のメモです。  

## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<ul id="index_ul">
<li><a href="#FileSystemObject">FileSystemObject</a></li>
<li><a href="#参考">参考</a></li>
</ul>

* * *
## <a name="FileSystemObject">FileSystemObject</a><a class="heading-anchor-permalink" href="#FileSystemObject">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-12-01" updated="2021-12-01" %}</div>
みんな大好き`FileSystemObject`です。  

### 必要となる参照設定
<div class="code-box-syntax no-title">
<pre>
Microsoft Scripting Runtime
</pre>
</div>
- `Microsoft Scripting Runtime`を参照設定に追加しておくと、`VBA.Collection`や`Scripting.Dictionary`も使えるようになります。

### 使用例
<div class="code-box">
<div class="title">参照設定している場合</div>
<pre>
Dim p_fso As <em>Scripting.FileSystemObject</em>
Set p_fso = New <em>Scripting.FileSystemObject</em>
</pre>
</div>
参照設定していない場合は、`CreateObject`を使って生成します。
<div class="code-box">
<div class="title">参照設定していない場合</div>
<pre>
Dim p_fso As Object
Set p_fso = CreateObject(<em>"Scripting.FileSystemObject"</em>)
</pre>
</div>

### 参考サイト
- [(インストラクターのネタ帳) FileSystemObjectの参照設定を行う](https://www.relief.jp/docs/fso-vba-references.html)

{% include goto_pagetop.html %}

* * *
## <a name="参考">参考</a><a class="heading-anchor-permalink" href="#参考">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-12-01" updated="2021-12-01" %}</div>
### 参考サイト
- [(インストラクターのネタ帳) FileSystemObjectの参照設定を行う](https://www.relief.jp/docs/fso-vba-references.html)

{% include goto_pagetop.html %}

{% include footnotes_link.html %}
