---
title: "[お題] ドドスコスコスコラブ注入♡"
display_order: 50
created: 2022-08-06
updated: 2022-08-06
---

## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<ul id="index_ul">
<li><a href="#お題">お題</a></li>
<li><a href="#回答例">回答例</a></li>
<li><a href="#Groovyで解いてみた">Groovyで解いてみた</a></li>
<li><a href="#出典">出典</a></li>
</ul>

* * *
## <a name="お題">お題</a><a class="heading-anchor-permalink" href="#お題">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-08-06" updated="2022-08-06" %}</div>
<div class="code-box">
<div class="title">お題</div>
<pre>
配列{"ドド","スコ"}からランダムに要素を標準出力し続け、  
『その並びが「ドドスコスコスコ」を3回繰り返したもの』に一致したときに  
「ラブ注入♡」と標準出力して終了するプログラムを作成せよ。
</pre>
</div>

{% include goto_pagetop.html %}

* * *
## <a name="回答例">回答例</a><a class="heading-anchor-permalink" href="#回答例">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-08-06" updated="2022-08-06" %}</div>
<p class="center size-6" markdown="span">
![](https://cdn-ak.f.st-hatena.com/images/fotolife/f/fumokmm/20220807/20220807005021.png)
</p>

{% include goto_pagetop.html %}

* * *
## <a name="Groovyで解いてみた">Groovyで解いてみた</a><a class="heading-anchor-permalink" href="#Groovyで解いてみた">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-08-06" updated="2022-08-06" %}</div>
<div class="code-box">
<div class="title">dodosuko.groovy</div>
<pre>
def array = ['ドド', 'スコ']
def getWord = {
    def r = new Random(System.currentTimeMillis())
    return { array[r.nextInt(2)] }
}()
def keyword = 'ドドスコスコスコ' * 3
def love = 'ラブ注入♡'
def words = 'どどすこすこすこ' * 3
for (int count in 1..10000) {
   def w = getWord()
   words = words[2..-1] + w

   print "${w + (count % 20 == 0 ? "\n" : '')}"

   if (words == keyword) {
       println love
       println "${count} times."
       break
   }
}
</pre>
</div>
- for (int count in 1..10000)
  - メインループの回数はとりあえず1万回にしています。このくらいあれば組み合わせとして出てくるはず。

{% include goto_pagetop.html %}

* * *
## <a name="出典">出典</a><a class="heading-anchor-permalink" href="#出典">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-08-06" updated="2022-08-06" %}</div>
- ((🐑++))さんの、[このツイート](https://twitter.com/Sheeeeepla/status/1554028833942441984)

{% include goto_pagetop.html %}

{% include footnotes_link.html %}
