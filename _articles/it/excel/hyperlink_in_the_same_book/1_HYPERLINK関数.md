---
chapter_no: 1
chapter_title: HYPERLINK関数
created: 2019-11-16
updated: 2021-05-29
---
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
