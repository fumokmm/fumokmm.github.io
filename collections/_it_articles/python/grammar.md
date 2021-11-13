---
title: Pythonの文法
article_group_id: basis-group
display_order: 10
created: 2020-12-10
updated: 2021-11-12
---
ここではPythonの文法を簡単にまとめておきます。特に記載のない場合、Python3を対象としています。

## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<div style="column-count: 2;">
    <ul id="index_ul">
        <li><a href="#基礎文法">基礎文法</a>
            <ul>
                <li><a href="#Pythonの特徴">Pythonの特徴</a></li>
                <li><a href="#コメント">コメント</a></li>
                <li><a href="#ハローワールド">ハローワールド</a></li>
                <li><a href="#文">文</a></li>
                <li><a href="#条件分岐 - if文">条件分岐 - if文</a></li>
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
<em>elif</em> <em class="blue">条件式2}:
    {em:comment{# 条件式2が真の時に実行する処理1</em>
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

## <a name="参照・参考">参照・参考</a><a class="heading-anchor-permalink" href="#参照・参考">§</a>
* * *
## <a name="参照">参照</a><a class="heading-anchor-permalink" href="#参照">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-11-10" updated="2021-11-10" %}</div>
- [2.3. 識別子 (identifier) およびキーワード (keyword)](https://docs.python.org/ja/3/reference/lexical_analysis.html#identifiers)

{% include goto_pagetop.html %}

* * *
## <a name="参考サイト">参考サイト</a><a class="heading-anchor-permalink" href="#参考サイト">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-10-17" updated="2021-11-10" %}</div>
- [(note.nkmk.me) Pythonで識別子（変数名など）として有効・無効な名前、命名規則](https://note.nkmk.me/python-identifier-naming-rule/)
- [(Python学習講座) プライベートメンバ](https://www.python.ambitious-engineer.com/archives/323)
- [(Qiita) Pythonのselfとかinitを理解する](https://qiita.com/ishigen/items/2d8b6e6398743f2c8110)
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
<div class="chapter-updated">{% include update_info_inline.html created="2021-11-12" updated="2021-11-12" %}</div>
- [(language-examples) 0001_if.py](https://github.com/fumokmm/language-examples/blob/main/Python/0001_if.py)

{% include goto_pagetop.html %}

{% include footnotes_link.html %}
