---
title: "ExcelのHYPERLINK関数で同一ブック内の別シートにリンクしたい場合は # を付けるといいみたい"
display_order: 10
created: 2019-11-16
updated: 2021-05-29
---
当メモは2019-11-16に[投稿されたもの](https://npnl.hatenablog.jp/entry/2019/11/16/184018)を加筆修正し、再掲したものです。

Excelの同一ブック内でセルにハイパーリンクを張ってシート間をジャンプさせたいことがある。  
普通だとハイパーリンクの挿入(`Ctrl + K`)とかで挿入すると思いますが、標準の`HYPERLINK関数`でも実現できます。

## <a name="index">目次</a>

<ul id="index_ul">
<li><a href="#HYPERLINK関数">HYPERLINK関数</a></li>
<li><a href="#解決方法">解決方法</a></li>
<li><a href="#reference">参照</a></li>
</ul>

* * *
## <a name="HYPERLINK関数">HYPERLINK関数</a>
<div class="chapter-updated">{% include update_info_inline.html created="2019-11-16" updated="2021-05-29" %}</div>
### 形式
<div class="code-box-syntax no-title">
<pre>
HYPERLINK(リンク先, [別名])
</pre>
</div>

さて、同一ブック内で別シートにリンクをはりたい場合についてですが、[マイクロソフトのヘルプ](https://support.microsoft.com/ja-jp/office/hyperlink-%E9%96%A2%E6%95%B0-333c7ce6-c5ae-4164-9c47-7de9b76f577f?ui=ja-jp&rs=ja-jp&ad=jp)を見ると、こんな感じになっている。

<div class="code-box">
<div class="title">サーバー内のフルパス</div>
<pre>
=HYPERLINK(<em>"\\FINANCE\Statements\1stqtr.xlsx"</em>, D5)
</pre>
</div>

<div class="code-box">
<div class="title">ローカルPCのフルパス</div>
<pre>
=HYPERLINK(<em>"D:\FINANCE\1stqtr.xlsx"</em>, H10)
</pre>
</div>

<div class="code-box">
<div class="title">ブック名とシート名のフルパス</div>
<pre>
=HYPERLINK(<em>"[Book1.xlsx]Sheet1!A10"</em>,"Go to Sheet1 > A10")
  または
=HYPERLINK(<em>CELL("address",Sheet1!A10)</em>, "Go to Sheet1 > A10")
</pre>
</div>

などが書いてあるんだけど、いちいちファイル名（ブック名）まで指定するのは大変だし、  
リネームされる可能性もあるので埋め込みたくない。  
そんな時のためにCELL関数を使ったら？ということみたいなんだけど、  
ファイル名（ブック名）にリンクが使えなくなる文字とかもあったはずでとても困ることになる。

<p class="center" markdown="span">
![](https://cdn-ak.f.st-hatena.com/images/fotolife/f/fumokmm/20191116/20191116183745.png)
</p>

こんな感じでリンクが使えないことがある！

{% include goto_pagetop.html %}

* * *
## <a name="解決方法">解決方法</a>
<div class="chapter-updated">{% include update_info_inline.html created="2019-11-16" updated="2021-05-29" %}</div>
リンク先文字列の頭に`#`をつけるといいみたいです。こんな感じ。

<div class="code-box">
<div class="title">同一ブック内の別シート</div>
<pre>
=HYPERLINK(<em>"</em><em class="blue">#</em><em>Menu!A1"</em>, "Go to menu")
</pre>
</div>

<div class="code-box">
<div class="title">同一ブック内の同一シートの別セル</div>
<pre>
=HYPERLINK(<em>"</em><em class="blue">#</em><em>A1"</em>, "Go to A1")
</pre>
</div>

この`#`を付ける方法は[こちら](http://www.eurus.dti.ne.jp/~yoneyama/Excel/kansu/hyperlink.htm)で知ったのですが、[マイクロソフトのヘルプ](https://support.microsoft.com/ja-jp/office/hyperlink-%E9%96%A2%E6%95%B0-333c7ce6-c5ae-4164-9c47-7de9b76f577f?ui=ja-jp&rs=ja-jp&ad=jp)にも書いてないんだよなぁ。  
どうなってるんだ。

{% include goto_pagetop.html %}

* * *
## <a name="reference">参照</a>
<div class="chapter-updated">{% include update_info_inline.html created="2019-11-16" updated="2021-05-29" %}</div>
### 元記事
- [(No Programming, No Life) ExcelのHYPERLINK関数で同一ブック内の別シートにリンクしたい場合は # を付けるといいみたい](https://npnl.hatenablog.jp/entry/2019/11/16/184018)

### 参考
- [(Microsoft \| サポート)　HYPERLINK 関数](https://support.microsoft.com/ja-jp/office/hyperlink-%E9%96%A2%E6%95%B0-333c7ce6-c5ae-4164-9c47-7de9b76f577f?ui=ja-jp&rs=ja-jp&ad=jp)
- [(よねさんのWordとExcelの小部屋) HYPERLINK関数の使い方:Excel関数](http://www.eurus.dti.ne.jp/~yoneyama/Excel/kansu/hyperlink.htm)
- [(インストラクターのネタ帳) HYPERLINK関数で、同じブック内のシートにハイパーリンク](https://www.relief.jp/docs/000998.html)

{% include goto_pagetop.html %}

{% include footnotes_link.html %}
