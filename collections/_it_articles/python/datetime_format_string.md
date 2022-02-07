---
title: Pythonの日付時刻フォーマット文字列
article_group_id: tips-group
display_order: 20
created: 2022-02-07
updated: 2022-02-07
---

## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<ul id="index_ul">
<li><a href="#概要">概要</a></li>
<li><a href="#strftimeメソッド、strftime関数">strftimeメソッド、strftime関数</a></li>
<li><a href="#f文字列、format関数、文字列のformatメソッド">f文字列、format関数、文字列のformatメソッド</a></li>
<li><a href="#日付時刻フォーマット文字列">日付時刻フォーマット文字列</a></li>
<li><a href="#参考">参考</a></li>
</ul>

* * *
## <a name="概要">概要</a><a class="heading-anchor-permalink" href="#概要">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-02-07" updated="2022-02-07" %}</div>
- 日付／時刻のデータを書式化するには、以下のいずれかの方法を利用します。
  - datetime.datetime.`strftimeメソッド`
  - datetime.date.`strftimeメソッド`
  - datetime.time.`strftimeメソッド`
  - time.`strftime関数`
  - f文字列、format関数、文字列のformatメソッド

{% include goto_pagetop.html %}

* * *
## <a name="strftimeメソッド、strftime関数">strftimeメソッド、strftime関数</a><a class="heading-anchor-permalink" href="#strftimeメソッド、strftime関数">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-02-07" updated="2022-02-07" %}</div>
- Pythonのデフォルトでは`MM/DD/YY hh:mm:ss`という日付時刻形式のようです。
- デフォルトは`%x %X`というお手軽フォーマットが利用できます。
- 例を簡潔にするため、以降`%x %X`を使っていきます。

### datetime.datetime.strftimeメソッド
<div class="code-box no-title">
<pre>
import datetime

now = datetime.datetime.now()
print(type(now))               <em class="comment"># =&gt; &lt;class 'datetime.datetime'&gt;</em>
print(now.<em>strftime</em>(<em class="blue">"%x %X"</em>))   <em class="comment"># =&gt; 02/07/22 20:23:28</em>
</pre>
</div>
- たぶんこれが一番ベーシックな形式です。

### datetime.date.strftimeメソッド
<div class="code-box no-title">
<pre>
import datetime

now = datetime.datetime.now()
d = now.date()
print(type(d))                 <em class="comment"># =&gt; &lt;class 'datetime.date'&gt;</em>
print(d.<em>strftime</em>(<em class="blue">"%x %X"</em>))     <em class="comment"># =&gt; 02/07/22 00:00:00</em>
</pre>
</div>
- dateクラスだと時刻は00:00:00になるみたいです。

### datetime.time.strftimeメソッド
<div class="code-box no-title">
<pre>
import datetime

now = datetime.datetime.now()
t = now.time()
print(type(t))                 <em class="comment"># =&gt; &lt;class 'datetime.time'&gt;</em>
print(t.<em>strftime</em>(<em class="blue">"%x %X"</em>))     <em class="comment"># =&gt; 01/01/00 20:23:28</em>
</pre>
</div>
- timeクラスだと日付が01/01/00になるみたいです。

### time.strftime関数
<div class="code-box no-title">
<pre>
import time

nowt = time.localtime()
print(type(nowt))                    <em class="comment"># =&gt; &lt;class 'time.struct_time'&gt;</em>
print(time.<em>strftime</em>(<em class="blue">"%x %X"</em>, <em>nowt</em>))  <em class="comment"># =&gt; 02/07/22 20:23:28</em>
</pre>
</div>
- timeモジュールのstrftime関数を使う場合は、語順が逆になるみたいです。

### 日本用のフォーマット
- デフォルト以外を使いたい場合はフルでフォーマット文字列を指定していきます。
- 日本でよく使うのは`YYYY/MM/DD hh:mm:ss`なので、`%Y/%m/%d %H:%M:%S`とするとよいようです。
<div class="code-box no-title">
<pre>
print(<em>now</em>.strftime(<em class="blue">"%Y/%m/%d %H:%M:%S"</em>))  <em class="comment"># =&gt; 2022/02/07 20:23:28</em>
</pre>
</div>

{% include goto_pagetop.html %}

* * *
## <a name="f文字列、format関数、文字列のformatメソッド">f文字列、format関数、文字列のformatメソッド</a><a class="heading-anchor-permalink" href="#f文字列、format関数、文字列のformatメソッド">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-02-07" updated="2022-02-07" %}</div>
- お好きなものを利用できます。

### f文字列
<div class="code-box no-title">
<pre>
print(f"{<em>now</em>:<em class="blue">%x %X</em>}")          <em class="comment"># =&gt; 02/07/22 20:23:28</em>
</pre>
</div>

### format関数
<div class="code-box no-title">
<pre>
print(format(<em>now</em>, <em class="blue">"%x %X"</em>))    <em class="comment"># =&gt; 02/07/22 20:23:28</em>
</pre>
</div>

### 文字列のformatメソッド
<div class="code-box no-title">
<pre>
print(<em class="blue">"{:%x %X}"</em>.format(<em>now</em>))  <em class="comment"># =&gt; 02/07/22 20:23:28</em>
</pre>
</div>

{% include goto_pagetop.html %}

* * *
## <a name="日付時刻フォーマット文字列">日付時刻フォーマット文字列</a><a class="heading-anchor-permalink" href="#日付時刻フォーマット文字列">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-02-07" updated="2022-02-07" %}</div>
- よく使いそうな日付時刻フォーマット文字列を抜粋しておきます。
- ブルバージョンは[strftime() と strptime() の書式コード](https://docs.python.org/ja/3/library/datetime.html#strftime-and-strptime-format-codes)を参照のこと。

<table class="normal">
	<tr>
		<th markdown="span">書式コード</th>
		<th markdown="span">説明</th>
		<th markdown="span">例</th>
	</tr>
	<tr>
		<td markdown="span">%Y</td>
		<td markdown="span">西暦（4桁表記。0埋め）</td>
		<td markdown="span">2021</td>
	</tr>
	<tr>
		<td markdown="span">%m</td>
		<td markdown="span">月（2桁表記。0埋め）</td>
		<td markdown="span">11</td>
	</tr>
	<tr>
		<td markdown="span">%d</td>
		<td markdown="span">日（2桁表記。0埋め）</td>
		<td markdown="span">4</td>
	</tr>
	<tr>
		<td markdown="span">%H</td>
		<td markdown="span">時（24時間制。2桁表記。0埋め）</td>
		<td markdown="span">17</td>
	</tr>
	<tr>
		<td markdown="span">%M</td>
		<td markdown="span">分（2桁表記。0埋め）</td>
		<td markdown="span">37</td>
	</tr>
	<tr>
		<td markdown="span">%S</td>
		<td markdown="span">秒（2桁表記。0埋め）</td>
		<td markdown="span">28</td>
	</tr>
	<tr>
		<td markdown="span">%y</td>
		<td markdown="span">西暦の下2桁（0埋め）</td>
		<td markdown="span">21</td>
	</tr>
	<tr>
		<td markdown="span">%l</td>
		<td markdown="span">AM／PMを表す文字列</td>
		<td markdown="span">PM</td>
	</tr>
	<tr>
		<td markdown="span">%x</td>
		<td markdown="span">日付をMM/DD/YY形式にしたもの</td>
		<td markdown="span">2011/4/21</td>
	</tr>
	<tr>
		<td markdown="span">%X</td>
		<td markdown="span">時刻をhh:mm:ss形式にしたもの</td>
		<td markdown="span">17:37:28</td>
	</tr>
	<tr>
		<td markdown="span">%a</td>
		<td markdown="span">曜日の短縮形</td>
		<td markdown="span">Thu</td>
	</tr>
	<tr>
		<td markdown="span">%A</td>
		<td markdown="span">曜日</td>
		<td markdown="span">Thursday</td>
	</tr>
	<tr>
		<td markdown="span">%z</td>
		<td markdown="span">現在のタイムゾーンとUTC（協定世界時）とのオフセット</td>
		<td markdown="span">900</td>
	</tr>
	<tr>
		<td markdown="span">%Z</td>
		<td markdown="span">現在のタイムゾーン</td>
		<td markdown="span">JST</td>
	</tr>
</table>

### 補足
- `%x`と`%X`はデフォルトの略形式のようです。
- 基本的な考え方はおそらく、日付が小文字、時刻が大文字を使う。
  - 例1: `%y%m%d`=年月日 (年は2桁)
  - 例2: `%H%M%S`=時分秒
- 日本人にとってはたぶんこれが基本形なのですが、年が2桁なのはちょっとイヤなので、`%Y`を大文字にすると、4桁になるみたいです。
  - 例3: `%Y%m%d`=年月日 (年4桁)
- 上記のように覚えておけば、日付と時刻部分を選ぶ時に迷わなくなるかも、知らんけど。

{% include goto_pagetop.html %}

* * *
## <a name="参考">参考</a><a class="heading-anchor-permalink" href="#参考">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-02-07" updated="2022-02-07" %}</div>
### ソース
- [(language-examples) 0015_datetime_format_string.py](https://github.com/fumokmm/language-examples/blob/main/Python/0015_datetime_format_string.py)

### 関連メモ
- [Pythonでタイムスタンプ文字列を作成する]({% link _it_articles/python/timestamp_string.md %})

### 参照
- [strftime() と strptime() の書式コード](https://docs.python.org/ja/3/library/datetime.html#strftime-and-strptime-format-codes)

### 参考サイト
- [(@IT) ［解決！Python］日付や時刻をYYMMDDhhmmssなどの形式に書式化するには](https://atmarkit.itmedia.co.jp/ait/articles/2111/09/news015.html)

{% include goto_pagetop.html %}

{% include footnotes_link.html %}
