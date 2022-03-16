---
title: Pythonの文法
article_group_id: basis-group
display_order: 10
created: 2020-12-10
updated: 2022-03-16
---
{% capture link_to_it_c %}{% link _it_articles/c/index.md %}{% endcapture %}
{% assign link_to_it_c = link_to_it_c | remove: 'index' %}

ここではPythonの文法を簡単にまとめておきます。特に記載のない場合、Python3を対象としています。

## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<div style="column-count: 2;">
    <ul id="index_ul">
        <li><a href="#基礎文法">基礎文法</a>
            <ul>
                <li><a href="#Pythonの特徴">Pythonの特徴</a></li>
                <li><a href="#コメント">コメント</a></li>
                <li><a href="#ハローワールド">ハローワールド</a></li>
                <li><a href="#コマンドライン引数">コマンドライン引数</a></li>
                <li><a href="#文">文</a></li>
                <li><a href="#演算子">演算子</a></li>
                <li><a href="#インクリメントとデクリメント">インクリメントとデクリメント</a></li>
                <li><a href="#代入式">代入式</a></li>
                <li><a href="#条件分岐 - if文">条件分岐 - if文</a></li>
                <li><a href="#関数">関数</a></li>
            </ul>
        </li>
        <li><a href="#クラス">クラス</a>
            <ul>
                <li><a href="#クラスの定義">クラスの定義</a></li>
                <li><a href="#クラスの継承">クラスの継承</a></li>
            </ul>
        </li>
        <li><a href="#参照・参考">参照・参考</a>
            <ul>
                <li><a href="#参照">参照</a></li>
                <li><a href="#参考サイト">参考サイト</a></li>
                <li><a href="#参考書籍">参考書籍</a></li>
                <li><a href="#ソース">ソース</a></li>
            </ul>
        </li>
    </ul>
</div>

## <a name="基礎文法">基礎文法</a><a class="heading-anchor-permalink" href="#基礎文法">§</a>
* * *
## <a name="Pythonの特徴">Pythonの特徴</a><a class="heading-anchor-permalink" href="#Pythonの特徴">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-11-10" updated="2021-11-13" %}</div>
- 拡張子は`.py`。
- 文末のセミコロンを付ける必要はない(付けてもOK)。
- 値の代入はイコール(`=`)。
- セミコロンで文を区切れば1行に複数の処理を記載できる。
- 単行コメントは「# ～～」、複数行コメントは「""" ～～ """」(ヒアドキュメントとして)。
- 処理のブロックはインデントで表現する。
- 文字列はダブルクォート(`""`)、もしくはシングルクォート(`''`)で括る。`r"`と`"`で括るとraw文字列。`"""`や`'''`で括ると複数行文字列(ヒアドキュメント)。
- 大文字と小文字は区別される。
- 識別子に使えるのは大文字小文字のアルファベットと数字とアンダースコアが使える。2バイト文字も使用可。先頭（一文字目）に数字は使えない。
- 変数宣言は不要（いきなり使える）
- 文字列連結には `+` を使う。
- 関数定義は「def 関数名(引数…)」、戻り値の指定は「`return`」。
- タプルがある。
- 「return」や型宣言時に複数値を指定できる(タプルで返却される)。
- クラスのメンバアクセスはドットで行う。
- アクセス修飾子はない。(慣習的な命名規則によってプライベートとみなす方式を採る。`_`で始める)
- クラスの多重継承ができる。
- クラスのコンストラクタ相当のメソッドは`__init__`。
- インスタンスメソッドの第一引数には常に`self`とする。

### 参考
- [2.3. 識別子 (identifier) およびキーワード (keyword)](https://docs.python.org/ja/3/reference/lexical_analysis.html#identifiers)
- [(note.nkmk.me) Pythonで識別子（変数名など）として有効・無効な名前、命名規則](https://note.nkmk.me/python-identifier-naming-rule/)
- [(Python学習講座) プライベートメンバ](https://www.python.ambitious-engineer.com/archives/323)
- [(Qiita) Pythonのselfとかinitを理解する](https://qiita.com/ishigen/items/2d8b6e6398743f2c8110)

{% include goto_pagetop.html %}

* * *
## <a name="コメント">コメント</a><a class="heading-anchor-permalink" href="#コメント">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2020-12-10" updated="2020-12-10" %}</div>
### 行コメント

`#`以降が行コメントになります。

<div class="code-box">
<div class="title">comment1.py</div>
<pre>
<em class="comment"># これはコメント</em>
print('Hello') <em class="comment"># これもコメント</em>
</pre>
</div>

### 複数行コメント

シングルクォーテーション3つ(`'''`)で囲むと複数行コメントになります。

<div class="code-box">
<div class="title">comment2.py</div>
<pre>
<em class="comment">'''
この行はコメント！
この行もコメント！
'''</em>
</pre>
</div>

Pythonはインデントでブロックを表現する言語なので、複数行コメントの場合はインデントに注意しましょう。  
同じブロックにいないとエラーになります。

<div class="code-box">
<div class="title">comment3.py</div>
<pre>
for x in {1, 2, 3}:
  print("text")
  <em class="comment">'''
  forのブロック内でのコメントは
  同じインデントを付けて書く必要がある
  '''</em>
  print(x)

<em class="comment">'''
この行もコメント(forのブロックの外)
この行もコメント(forのブロックの外)
'''</em>
</pre>
</div>

### 参考
- [(UX MILK) Pythonでのコメントアウトの書き方](https://uxmilk.jp/8847)

{% include goto_pagetop.html %}

* * *
## <a name="ハローワールド">ハローワールド</a><a class="heading-anchor-permalink" href="#ハローワールド">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2020-12-10" updated="2020-12-10" %}</div>
`print`を使います。

<div class="code-box">
<div class="title">hello1.py</div>
<pre>
print("Hello, World")
print("Hello, ")
print("World")
</pre>
</div>

<div class="code-box-output">
<div class="title">実行結果</div>
<pre>
<em class="command">$ python hello1.py</em>
Hello, World
Hello, 
World
</pre>
</div>

普通に呼び出すと、改行コード付きで出力されます。 改行コードなしにするには、`end=""` を付けます。

<div class="code-box">
<div class="title">hello2.py</div>
<pre>
print("Hello, ", <em>end=""</em>) <em class="comment"># end="" とすると改行しない</em>
print("World")
</pre>
</div>

<div class="code-box-output">
<div class="title">実行結果</div>
<pre>
<em class="command">$ python hello2.py</em>
Hello, World
</pre>
</div>

### 参考
- [(てきとーなブログ) python3で改行なしprintをする。](http://azoay.hatenablog.com/entry/2015/06/10/203134)

{% include goto_pagetop.html %}

* * *
## <a name="コマンドライン引数">コマンドライン引数</a><a class="heading-anchor-permalink" href="#コマンドライン引数">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-12-14" updated="2021-12-14" %}</div>
### コマンドライン引数を渡す
<div class="code-box-syntax no-title">
<pre>
$ python ファイル名.py <em>引数1 引数2 引数3 …</em>
</pre>
</div>

### コマンドライン引数を受け取る
プログラム内でコマンドライン引数を受け取るには`sys.argv`モジュールを使います。
<div class="code-box no-title">
<pre>
import sys
print(<em>sys.argv[0]</em>) <em class="comment"># ファイル名</em>
print(<em>sys.argv[1]</em>) <em class="comment"># 引数1</em>
print(<em>sys.argv[2]</em>) <em class="comment"># 引数2</em>
print(<em>sys.argv[3]</em>) <em class="comment"># 引数3</em>
</pre>
</div>
- `argv[0]`はファイル名固定です。
- `argv[1]`以降が引数となります。
- 渡した引数の数より大きなインデックスを指定すると`IndexError`が発生します。利用する際は長さチェックをしてください。

### サンプルソース
- [(language-examples) 0010_argv.py](https://github.com/fumokmm/language-examples/tree/main/Python/0010_argv.py)

### 参考
- [(Tech Teacher Blog) Pythonのコマンドライン引数がわかる！渡し方・取得方法を分かりやすく解説](https://www.tech-teacher.jp/blog/python-commandline/)

{% include goto_pagetop.html %}

* * *
## <a name="文">文</a><a class="heading-anchor-permalink" href="#文">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-10-17" updated="2021-10-17" %}</div>
- Pythonには2種類の文があります。`単純文`と`複合文`です。
  - `単純文`は1行のコードで表現されます。
  - `複合文`は通常複数の行で表現されます。
  - `複合文`は1つ以上の`節`で構成されます。
- 1つの`節`は2行以上のコードで、1行の`ヘッダー部分`とそれに続く`スイート部分`で構成されます。
  - `ヘッダー`は`キーワード`が含まれる1行のコードです。
    - 行の最後にコロン`:`があり、インデントされた1行以上のコードが次に続きます。
    - インデントの後には1つ以上の`スイート`が続きます。
  - 1つの`スイート`は1行のコードだけで構成されます。
  - `ヘッダー`が`スイート`を制御します。

### 例
<div class="code-box no-title">
<pre>
<em class="comment"># ↓節</em>
for i in range(100):  <em class="comment"># ←ヘッダー</em>
    print("Hello, World!")  <em class="comment"># ←スイート：インデントされている、ヘッダーに制御される</em>
</pre>
</div>

### 参考
- {% include book/book_493.html %} {% comment %} 独学プログラマー {% endcomment %}

{% include goto_pagetop.html %}

* * *
## <a name="演算子">演算子</a><a class="heading-anchor-permalink" href="#演算子">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-11-21" updated="2022-02-04" %}</div>
### 算術演算子
<table class="normal">
	<tr>
		<th markdown="span">演算子</th>
		<th markdown="span">説明</th>
		<th markdown="span">例</th>
		<th markdown="span">評価結果</th>
	</tr>
	<tr>
		<td markdown="span">+</td>
		<td markdown="span">足し算(加算)</td>
		<td markdown="span">2 + 2</td>
		<td markdown="span">4</td>
	</tr>
	<tr>
		<td markdown="span">-</td>
		<td markdown="span">引き算(減算)</td>
		<td markdown="span">7 - 1</td>
		<td markdown="span">6</td>
	</tr>
	<tr>
		<td markdown="span">*</td>
		<td markdown="span">掛け算(積算)</td>
		<td markdown="span">8 * 2</td>
		<td markdown="span">16</td>
	</tr>
	<tr>
		<td markdown="span">/</td>
		<td markdown="span">割り算(除算)</td>
		<td markdown="span">13 / 8</td>
		<td markdown="span">1.625</td>
	</tr>
	<tr>
		<td markdown="span">//</td>
		<td markdown="span">整数の割り算(切り捨て)</td>
		<td markdown="span">13 // 8</td>
		<td markdown="span">1</td>
	</tr>
	<tr>
		<td markdown="span">%</td>
		<td markdown="span">割り算の余り(剰余)</td>
		<td markdown="span">14 % 4</td>
		<td markdown="span">2</td>
	</tr>
	<tr>
		<td markdown="span">**</td>
		<td markdown="span">累乗</td>
		<td markdown="span">2 ** 3</td>
		<td markdown="span">8</td>
	</tr>
</table>

### 累算代入演算子
<table class="normal">
	<tr>
		<th markdown="span">演算子</th>
		<th markdown="span">説明</th>
		<th markdown="span">例</th>
		<th markdown="span">iの評価結果</th>
	</tr>
	<tr>
		<td markdown="span">+=</td>
		<td markdown="span">足し算</td>
		<td markdown="span">i += 2</td>
		<td markdown="span">7 (iが5の場合)</td>
	</tr>
	<tr>
		<td markdown="span">-=</td>
		<td markdown="span">引き算</td>
		<td markdown="span">i -= 2</td>
		<td markdown="span">3 (iが5の場合)</td>
	</tr>
	<tr>
		<td markdown="span">*=</td>
		<td markdown="span">掛け算</td>
		<td markdown="span">i *= 2</td>
		<td markdown="span">10 (iが5の場合)</td>
	</tr>
	<tr>
		<td markdown="span">/=</td>
		<td markdown="span">割り算</td>
		<td markdown="span">i /= 2</td>
		<td markdown="span">2.5 (iが5の場合)</td>
	</tr>
	<tr>
		<td markdown="span">**=</td>
		<td markdown="span">累乗</td>
		<td markdown="span">i **= 2</td>
		<td markdown="span">25 (iが5の場合)</td>
	</tr>
</table>

### 比較演算子
- 比較演算子を使った式は`True`か`False`のどちらかしか返しません。
<table class="normal">
	<tr>
		<th markdown="span">演算子</th>
		<th markdown="span">説明</th>
		<th markdown="span">例</th>
		<th markdown="span">評価結果</th>
	</tr>
	<tr>
		<td markdown="span">&gt;</td>
		<td markdown="span">より大きい</td>
		<td markdown="span">100 &gt; 10</td>
		<td markdown="span">True</td>
	</tr>
	<tr>
		<td markdown="span">&lt;</td>
		<td markdown="span">より小さい</td>
		<td markdown="span">100 &lt; 10</td>
		<td markdown="span">False</td>
	</tr>
	<tr>
		<td markdown="span">&gt;=</td>
		<td markdown="span">以上</td>
		<td markdown="span">2 &gt;= 2</td>
		<td markdown="span">True</td>
	</tr>
	<tr>
		<td markdown="span">&lt;=</td>
		<td markdown="span">以下</td>
		<td markdown="span">1 &lt;= 4</td>
		<td markdown="span">True</td>
	</tr>
	<tr>
		<td markdown="span">==</td>
		<td markdown="span">等価(同じ値か)</td>
		<td markdown="span">6 == 9</td>
		<td markdown="span">False</td>
	</tr>
	<tr>
		<td markdown="span">!=</td>
		<td markdown="span">非等価(違う値か)</td>
		<td markdown="span">3 != 2</td>
		<td markdown="span">True</td>
	</tr>
</table>

### 論理演算子
- 論理演算子も`True`か`False`のどちらかしか返しません。
<table class="normal">
	<tr>
		<th markdown="span">演算子</th>
		<th markdown="span">説明</th>
		<th markdown="span">例</th>
		<th markdown="span">評価結果</th>
	</tr>
	<tr>
		<td markdown="span">and</td>
		<td markdown="span">かつ</td>
		<td markdown="span">True and True</td>
		<td markdown="span">True</td>
	</tr>
	<tr>
		<td markdown="span">or</td>
		<td markdown="span">あるいは</td>
		<td markdown="span">True or False</td>
		<td markdown="span">True</td>
	</tr>
	<tr>
		<td markdown="span">not</td>
		<td markdown="span">否定</td>
		<td markdown="span">not True</td>
		<td markdown="span">False</td>
	</tr>
</table>

### 参考書籍
- {% include book/book_493.html %} {% comment %} 独学プログラマー {% endcomment %}

### 参考サイト
- [(Deep Rain) 【python】数値をインクリメントする](https://www.deep-rain.com/programming/python/1772)

{% include goto_pagetop.html %}

* * *
## <a name="インクリメントとデクリメント">インクリメントとデクリメント</a><a class="heading-anchor-permalink" href="#インクリメントとデクリメント">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-02-04" updated="2022-02-04" %}</div>
### インクリメント
- [C言語]({{link_to_it_c}})のような`++`はありません。
- 代わりに`累算代入演算子`の`+=`を使います。
<div class="code-box-syntax no-title">
<pre>
a = 10
a += 1
print(a) <em class="comment"># =&gt; 11</em>
</pre>
</div>

### デクリメント
- [C言語]({{link_to_it_c}})のような`--`はありません。
- 代わりに`累算代入演算子`の`-=`を使います。
<div class="code-box-syntax no-title">
<pre>
b = 10
b <em>-=</em> 1
print(b) <em class="comment"># =&gt; 9</em>
</pre>
</div>

### 参考サイト
- [(Deep Rain) 【python】数値をインクリメントする](https://www.deep-rain.com/programming/python/1772)

{% include goto_pagetop.html %}

* * *
## <a name="代入式">代入式</a><a class="heading-anchor-permalink" href="#代入式">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-02-04" updated="2022-02-04" %}</div>
- python3.8以降で利用できます。
- 代入するときに`=`ではなく`:=`を使って代入します。
  - 形がセイウチの目と牙(:=)に似ていることから、「セイウチ演算子」と呼ばれているそうです。
- 代入した結果を値として評価したい場合に利用します。
<div class="code-box">
<div class="title">例</div>
<pre>
i = 5
while (i <em>:=</em> i - 1):
    print(i)
</pre>
</div>
<div class="code-box">
<div class="title">出力結果</div>
<pre>
4
3
2
1
</pre>
</div>
- [C言語]({{link_to_it_c}})とかではよく使ってたイディオムですね。

### 参考サイト
- [(Deep Rain) 【python】数値をインクリメントする](https://www.deep-rain.com/programming/python/1772)

### 参照
- [代入式](https://docs.python.org/ja/3/whatsnew/3.8.html#assignment-expressions)

{% include goto_pagetop.html %}

* * *
## <a name="条件分岐 - if文">条件分岐 - if文</a><a class="heading-anchor-permalink" href="#条件分岐 - if文">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-11-12" updated="2021-11-12" %}</div>
- 条件分岐には`if`、`elif`、`else`を使います。

<div class="code-box-syntax">
<div class="title">if文</div>
<pre>
<em>if</em> <em class="blue">条件式</em>:
    <em class="comment"># 条件式が真の時に実行する処理1</em>
    <em class="comment"># 条件式が真の時に実行する処理2</em>
</pre>
</div>

条件式が偽の場合に別の条件を指定するには`elif`を使います。  
`else if`ではないのでご注意下さい。
<div class="code-box-syntax">
<div class="title">if-elif文</div>
<pre>
if <em class="blue">条件式1</em>:
    <em class="comment"># 条件式1が真の時に実行する処理1</em>
    <em class="comment"># 条件式1が真の時に実行する処理2</em>
<em>elif</em> <em class="blue">条件式2</em>:
    <em class="comment"># 条件式2が真の時に実行する処理1</em>
    <em class="comment"># 条件式2が真の時に実行する処理2</em>
</pre>
</div>

条件式が偽の場合に実行するブロックを指定するには`else`を使います。
<div class="code-box-syntax">
<div class="title">if-else文</div>
<pre>
if 条件式:
    <em class="comment"># 条件式が真の時に実行する処理1</em>
    <em class="comment"># 条件式が真の時に実行する処理2</em>
<em>else</em>:
    <em class="comment"># 条件式が偽の時に実行する処理1</em>
    <em class="comment"># 条件式が偽の時に実行する処理2</em>
</pre>
</div>

`elif`と`else`は組み合わせられます。
<div class="code-box-syntax">
<div class="title">if-elif-else文</div>
<pre>
<em>if</em> <em class="blue">条件式1</em>:
    <em class="comment"># 条件式1が真の時に実行する処理1</em>
    <em class="comment"># 条件式1が真の時に実行する処理2</em>
<em>elif</em> <em class="blue">条件式2</em>:
    <em class="comment"># 条件式2が真の時に実行する処理1</em>
    <em class="comment"># 条件式2が真の時に実行する処理2</em>
<em>else</em>:
    <em class="comment"># 条件式1,条件式2がともに偽の時に実行する処理1</em>
    <em class="comment"># 条件式1,条件式2がともに偽の時に実行する処理2</em>
</pre>
</div>

### 例
<div class="code-box no-title">
<pre>
home = "日本"
if home == "日本":
    print("Hello, Japan!")
elif home == "タイ":
    print("Hello, Thailad!")
elif home == "インド":
    print("Hello, India!")
elif home == "中国":
    print("Hello, China!")
else:
    print("Hello, World!")
</pre>
</div>
<div class="code-box-output">
<div class="title">出力結果</div>
<pre>
Hello, Japan!
</pre>
</div>

### ソース
- [(language-examples) 0001_if.py](https://github.com/fumokmm/language-examples/blob/main/Python/0001_if.py)

### 参考
- {% include book/book_493.html %} {% comment %} 独学プログラマー {% endcomment %}

{% include goto_pagetop.html %}

* * *
## <a name="関数">関数</a><a class="heading-anchor-permalink" href="#関数">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-12-20" updated="2021-12-20" %}</div>
### リストの展開・辞書の展開
- 関数の引数にリストや辞書の内容を展開して渡すことができます。
- リストを展開して渡す場合、リストの前に`*`を付けます。
- 辞書を展開して渡す場合、リストの前に`**`を付けます。
<div class="code-box">
<div class="title">リストの展開</div>
<pre>
def func_list(arg1, arg2, arg3):
    print("arg1 =" + str(arg1))
    print("arg2 =" + str(arg2))
    print("arg3 =" + str(arg3))

lst = [10, "aaa", True]
func_list(<em>*lst</em>)
</pre>
</div>
<div class="code-box-output">
<div class="title">出力結果</div>
<pre>
arg1 =10
arg2 =aaa
arg3 =True
</pre>
</div>
- リストの数が引数の数より多かったり少なかったりすると`TypeError`が発生します。

<div class="code-box">
<div class="title">辞書の展開</div>
<pre>
def func_dict(key1, key2, key3):
    print("key1 =" + str(key1))
    print("key2 =" + str(key2))
    print("key3 =" + str(key3))

dic = {"key3": 10, "key2": "aaa", "key1": True}
func_dict(<em>**dic</em>)
</pre>
</div>
<div class="code-box-output">
<div class="title">出力結果</div>
<pre>
key1 =True
key2 =aaa
key3 =10
</pre>
</div>
- 引数名と一致するキーが無かったり、一致しないキーがあったりすると`TypeError`になります。

### ソース
- [(language-examples) 0013_argument_expand.py](https://github.com/fumokmm/language-examples/blob/main/Python/0013_argument_expand.py)

### 参考
- [(note.nkmk.me) Pythonで関数の引数にリスト、タプル、辞書を展開して渡す](https://note.nkmk.me/python-argument-expand/)

{% include goto_pagetop.html %}

## <a name="クラス">クラス</a><a class="heading-anchor-permalink" href="#クラス">§</a>
* * *
## <a name="クラスの定義">クラスの定義</a><a class="heading-anchor-permalink" href="#クラスの定義">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-03-16" updated="2022-03-16" %}</div>
### 通常のクラス定義
<div class="code-box-syntax no-title">
<pre>
class クラス名(継承元クラス名):
    """クラスのドキュメンテーション"""
    def method1(self, ...):
       処理
       　：
       　：

    def method2(self, ...):
       処理
       　：
       　：
</pre>
</div>

### 空クラス
<div class="code-box-syntax no-title">
<pre>
class クラス名:
    pass
</pre>
</div>

### 参考サイト
- [(Python学習講座) クラスの基本](https://www.python.ambitious-engineer.com/archives/295)

{% include goto_pagetop.html %}

* * *
## <a name="クラスの継承">クラスの継承</a><a class="heading-anchor-permalink" href="#クラスの継承">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-03-16" updated="2022-03-16" %}</div>
### クラスの継承
- `Sub`クラスが`Base`クラスを継承
<div class="code-box-syntax no-title">
<pre>
class <em>Base</em>:
    """ 親クラス """
 
    def func1(self):
        print('func1')
 
class Sub(<em>Base</em>):
    """ 子クラス """
 
    def func2(self):
        print('func2')
 
obj = Sub()  # 子クラスをインスタンス化
obj.func1()  # 親クラスのメソッドも実行可能
obj.func2()  
</pre>
</div>

### 子クラス内から親クラスのメソッド呼び出し
- 親クラスのメソッド呼び出しには`super()`を使います。
<div class="code-box no-title">
<pre>
class <em>Base</em>:
    """ 親クラス """
 
    def func1(self):
        print('func1')
 
class Sub(<em>Base</em>):
    """ 子クラス """
 
    def func2(self):
        <em>super().func1()</em> # 親クラスのメソッドを呼び出し
        print('func2')
</pre>
</div>

### 親クラスのコンストラクタ呼び出し
<div class="code-box no-title">
<pre>
class <em>User</em>:
    def __init__(self, name="", age=0):
        self.name = name
        self.age = age

class Employee(<em>User</em>):
    def __init__(self, name, age, department):
        <em>super().__init__(name, age)</em>
        self.department = department
</pre>
</div>

### オーバーライド
<div class="code-box no-title">
<pre>
class <em>User</em>:
    def __init__(self, name="", age=0):
        self.name = name
        self.age = age

    def say_name(self):
        print("私の名前は" + self.name + "です。")

class Employee(<em>User</em>):
    def __init__(self, name, age, department):
        <em>super().__init__(name, age)</em>
        self.department = department

    <em class="blue">def say_name(self):
        print("名前は" + self.name + "、所属部署は" + self.department + "です。")</em>
</pre>
</div>

### 多重継承
<div class="code-box no-title">
<pre>
class <em>Base1</em>:
    def func1(self):
        print('func1')
 
class <em class="blue">Base2</em>:
    def func2(self):
        print('func2')
     
class Sub(<em>Base1</em>, <em class="blue">Base2</em>):
    def func(self):
        <em>super().func1()</em>
        <em class="blue">super().func2()</em>
 
obj = Sub()
obj.func()
</pre>
</div>

### 参考サイト
- [(Python学習講座) クラスの継承](https://www.python.ambitious-engineer.com/archives/312)

{% include goto_pagetop.html %}

## <a name="参照・参考">参照・参考</a><a class="heading-anchor-permalink" href="#参照・参考">§</a>
* * *
## <a name="参照">参照</a><a class="heading-anchor-permalink" href="#参照">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-11-10" updated="2021-11-10" %}</div>
- [2.3. 識別子 (identifier) およびキーワード (keyword)](https://docs.python.org/ja/3/reference/lexical_analysis.html#identifiers)

{% include goto_pagetop.html %}

* * *
## <a name="参考サイト">参考サイト</a><a class="heading-anchor-permalink" href="#参考サイト">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-10-17" updated="2022-03-16" %}</div>
- [(note.nkmk.me) Pythonで関数の引数にリスト、タプル、辞書を展開して渡す](https://note.nkmk.me/python-argument-expand/)
- [(note.nkmk.me) Pythonで識別子（変数名など）として有効・無効な名前、命名規則](https://note.nkmk.me/python-identifier-naming-rule/)
- [(Python学習講座) クラスの基本](https://www.python.ambitious-engineer.com/archives/295)
- [(Python学習講座) クラスの継承](https://www.python.ambitious-engineer.com/archives/312)
- [(Python学習講座) プライベートメンバ](https://www.python.ambitious-engineer.com/archives/323)
- [(Qiita) Pythonのselfとかinitを理解する](https://qiita.com/ishigen/items/2d8b6e6398743f2c8110)
- [(Tech Teacher Blog) Pythonのコマンドライン引数がわかる！渡し方・取得方法を分かりやすく解説](https://www.tech-teacher.jp/blog/python-commandline/)
- [(UX MILK) Pythonでのコメントアウトの書き方](https://uxmilk.jp/8847)
- [(てきとーなブログ) python3で改行なしprintをする。](http://azoay.hatenablog.com/entry/2015/06/10/203134)

{% include goto_pagetop.html %}

* * *
## <a name="参考書籍">参考書籍</a><a class="heading-anchor-permalink" href="#参考書籍">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-10-17" updated="2021-10-17" %}</div>
- {% include book/book_493.html %} {% comment %} 独学プログラマー {% endcomment %}

{% include goto_pagetop.html %}

* * *
## <a name="ソース">ソース</a><a class="heading-anchor-permalink" href="#ソース">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-11-12" updated="2021-12-20" %}</div>
- [(language-examples) 0001_if.py](https://github.com/fumokmm/language-examples/blob/main/Python/0001_if.py)
- [(language-examples) 0010_argv.py](https://github.com/fumokmm/language-examples/tree/main/Python/0010_argv.py)
- [(language-examples) 0013_argument_expand.py](https://github.com/fumokmm/language-examples/blob/main/Python/0013_argument_expand.py)

{% include goto_pagetop.html %}

{% include footnotes_link.html %}
