---
title: Excelで行番号を自動採番する数式
article_group_id: tips-group
display_order: 20
created: 2021-08-18
updated: 2021-08-18
---
Excelで表を作る時に、行番号を自動で作りたいことがよくあります。  
そんな時に使える数式を3つメモしておきます。
## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<ul id="index_ul">
<li><a href="#1ずつ足す">1ずつ足す</a></li>
<li><a href="#行番号の差分">行番号の差分</a></li>
<li><a href="#その行より一つ上までの値のあるセル数の合計">その行より一つ上までの値のあるセル数の合計</a></li>
<li><a href="#おわりに">おわりに</a></li>
<li><a href="#参考">参考</a></li>
</ul>

* * *
## <a name="1ずつ足す">1ずつ足す</a><a class="heading-anchor-permalink" href="#1ずつ足す">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-08-18" updated="2021-08-18" %}</div>
たぶんこれが一番簡単に思いつく数式じゃないかなと思います。

### 考え方
- そのセルの一つ上の行番号に`+1`した値をその行番号とするような数式とします。

### 数式
<div class="code-box-syntax no-title">
<div class="copy-button">Copy</div>
<pre>
= &lt;一つ上のセルの値&gt; + 1
</pre>
</div>

### 動作イメージ
<p class="center" markdown="span">
![](https://cdn-ak.f.st-hatena.com/images/fotolife/f/fumokmm/20210818/20210818195814.png)
</p>

{% include goto_pagetop.html %}

* * *
## <a name="行番号の差分">行番号の差分</a><a class="heading-anchor-permalink" href="#行番号の差分">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-08-18" updated="2021-08-18" %}</div>
行番号の差分を利用する方法です。

### 考え方
- `ROW()`関数を利用すると、そのセルの行番号が取得できます。
  - `ROW()`と引数を省略した場合は、その数式があるセルの行番号が取得されます。
  - `ROW(<アドレス>)`とした場合、指定した`<アドレス>`の行番号が取得されます。
- `<現在の行番号>` - `<ヘッダの行番号>` とすることで、その行の行番号を取得する数式とします。
- `<ヘッダの行番号>`は行方向を`$`で固定しておきます。
  - 固定しておかないと、下に数式をコピーしたときにヘッダの行がずれていってしまいます。

### 数式
<div class="code-box-syntax no-title">
<div class="copy-button">Copy</div>
<pre>
= ROW() - ROW(&lt;ヘッダのセル(行固定)&gt;)
</pre>
</div>

### 動作イメージ
<p class="center" markdown="span">
![](https://cdn-ak.f.st-hatena.com/images/fotolife/f/fumokmm/20210818/20210818195818.png)
</p>

{% include goto_pagetop.html %}

* * *
## <a name="その行より一つ上までの値のあるセル数の合計">その行より一つ上までの値のあるセル数の合計</a><a class="heading-anchor-permalink" href="#その行より一つ上までの値のあるセル数の合計">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-08-18" updated="2021-08-18" %}</div>
セルに入力済みの個数を数え上げる方法です。

### 考え方
- `COUNTA()`関数を利用すると、その範囲の値のあるセルの個数が取得できます。
- これを利用して、あるセルの行数は`<先頭>`から`<そのセルの一つ上のセル>`までで値のあるセルの数の合計を取得する数式とします。
- `<先頭>`は行方向を`$`で固定しておきます。
  - 固定しておかないと、下に数式をコピーしたときにヘッダの行がずれていってしまいます。

### 数式
<div class="code-box-syntax no-title">
<div class="copy-button">Copy</div>
<pre>
= COUNTA(&lt;先頭(ヘッダ行)(行固定)&gt;:&lt;そのセルの一つ上のセル&gt;)
</pre>
</div>

### 動作イメージ
<p class="center" markdown="span">
![](https://cdn-ak.f.st-hatena.com/images/fotolife/f/fumokmm/20210818/20210818195823.png)
</p>

{% include goto_pagetop.html %}

* * *
## <a name="おわりに">おわりに</a><a class="heading-anchor-permalink" href="#おわりに">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-08-18" updated="2021-08-18" %}</div>
ちなみに私は手軽に入力できる[行番号の差分](#行番号の差分)をよく使っています。

{% include goto_pagetop.html %}

* * *
## <a name="参考">参考</a><a class="heading-anchor-permalink" href="#参考">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-08-18" updated="2021-08-18" %}</div>
### 参照
- [(Excel業務カイゼンブログ) 行と列の番号を求めるROW関数とCOLUMN関数](https://www.forguncy.com/blog/20170614_row_column)
- [(エクセル(Excel)関数擬人化ブログ あかアカ) エクセル関数COUNTA関数の使い方を擬人化キャラクターで簡単解説！](https://aka-aca.com/counta-01/)

{% include goto_pagetop.html %}

{% include articles_common_script.html %}
