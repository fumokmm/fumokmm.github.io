---
layout: default_layout
title: テンプレートのページ
created: 2020-11-21
updated: 2021-05-20
---
こちらはテンプレートのページです。ツールのページは[こちら]({% link tool.md %})です。

- - -
## <a name="index">目次</a>

- [見出し](#header)
- [コードPRE](#code-box)
- [コードPRE(makeArticle記法)](#code-box-make-article)
- [引用](#cite)
- [書籍参照](#book-reference)
- [テーブル](#table)
- [注釈](#footnotes)

- - -
## <a name="header">見出し</a>

### 書式
<div class="code-box">
<div class="title">見出し</div>
<pre>
# 見出し1
## 見出し2
### 見出し3
#### 見出し4
##### 見出し5
###### 見出し6

見出し1
=======

見出し2
-------
</pre>
</div>

### デモ

# 見出し1
## 見出し2
### 見出し3
#### 見出し4
##### 見出し5
###### 見出し6

見出し1
=======

見出し2
-------

{% include goto_pagetop.html %}
- - -
## <a name="code-box">コードPRE</a>

- makeArticleを利用したメモ作成時は、[makeArticle記法](#code-box-make-article)が利用できます
- makeArticle記法は変換結果として[コードPRE](#code-box)が出力されます

### 書式

#### 1.通常用

<div class="code-box">
<div class="title">コードPRE(通常用)</div>
<pre>
&lt;div class="<em class="blue">code-box</em> <em>no-title</em>"&gt;
&lt;pre&gt;
<em class="comment">ここにコード...
ここにコード...</em>
&lt;/pre&gt;
&lt;/div&gt;
</pre>
</div>

<div class="code-box">
<div class="title">コードPRE(通常用) - タイトル付き</div>
<pre>
&lt;div class="<em class="blue">code-box</em>"&gt;
<em>&lt;div class="title"&gt;</em><em class="comment">ここにタイトル</em><em>&lt;/div&gt;</em>
&lt;pre&gt;
<em class="comment">ここにコード...
ここにコード...</em>
&lt;/pre&gt;
&lt;/div&gt;
</pre>
</div>

#### 2.構文、定義用

<div class="code-box-syntax">
<div class="title">コードPRE(構文、定義用)</div>
<pre>
&lt;div class="<em class="blue">code-box-syntax</em> <em>no-title</em>"&gt;
&lt;pre&gt;
<em class="comment">ここにコード...
ここにコード...</em>
&lt;/pre&gt;
&lt;/div&gt;
</pre>
</div>

<div class="code-box-syntax">
<div class="title">コードPRE(構文、定義用) - タイトル付き</div>
<pre>
&lt;div class="<em class="blue">code-box-syntax</em>"&gt;
<em>&lt;div class="title"&gt;</em><em class="comment">ここにタイトル</em><em>&lt;/div&gt;</em>
&lt;pre&gt;
<em class="comment">ここにコード...
ここにコード...</em>
&lt;/pre&gt;
&lt;/div&gt;
</pre>
</div>

#### 3.入力用

<div class="code-box-input">
<div class="title">コードPRE(入力用)</div>
<pre>
&lt;div class="<em class="blue">code-box-input</em> <em>no-title</em>"&gt;
&lt;pre&gt;
<em class="comment">ここにコード...
ここにコード...</em>
&lt;/pre&gt;
&lt;/div&gt;
</pre>
</div>

<div class="code-box-input">
<div class="title">コードPRE(入力用) - タイトル付き</div>
<pre>
&lt;div class="<em class="blue">code-box-input</em>"&gt;
<em>&lt;div class="title"&gt;</em><em class="comment">ここにタイトル</em><em>&lt;/div&gt;</em>
&lt;pre&gt;
<em class="comment">ここにコード...
ここにコード...</em>
&lt;/pre&gt;
&lt;/div&gt;
</pre>
</div>

#### 4.出力用

<div class="code-box-output">
<div class="title">コードPRE(出力用)</div>
<pre>
&lt;div class="<em class="blue">code-box-output</em> <em>no-title</em>"&gt;
&lt;pre&gt;
<em class="comment">ここにコード...
ここにコード...</em>
&lt;/pre&gt;
&lt;/div&gt;
</pre>
</div>

<div class="code-box-output">
<div class="title">コードPRE(出力用) - タイトル付き</div>
<pre>
&lt;div class="<em class="blue">code-box-output</em>"&gt;
<em>&lt;div class="title"&gt;</em><em class="comment">ここにタイトル</em><em>&lt;/div&gt;</em>
&lt;pre&gt;
<em class="comment">ここにコード...
ここにコード...</em>
&lt;/pre&gt;
&lt;/div&gt;
</pre>
</div>

### 強調

- 強調するには`<em></em>`を用います
- 青強調するには`<em class="blue"></em>`を用います
- オレンジ強調するには`<em class="orange"></em>`を用います
- コメント強調するには`<em class="comment"></em>`を用います
- コマンド強調するには`<em class="command"></em>`を用います

### デモ

#### 1.通常用

<div class="code-box no-title">
<pre>
タイトル無しのコードPRE
文字列を<em>強調</em>するには&lt;em&gt;を利用します。
文字列を<em class="blue">青強調</em>するには&lt;em class="blue"&gt;を利用します。
文字列を<em class="orange">オレンジ強調</em>するには&lt;em class="orange"&gt;を利用します。
文字列を<em class="comment">コメント強調</em>するには&lt;em class="comment"&gt;を利用します。
文字列を<em class="command">コマンド</em>にするには&lt;em class="command"&gt;を利用します。
</pre>
</div>

<div class="code-box">
<div class="title">SQL</div>
<pre>
タイトル付きのコードPRE
文字列を<em>強調</em>するには&lt;em&gt;を利用します。
文字列を<em class="blue">青強調</em>するには&lt;em class="blue"&gt;を利用します。
文字列を<em class="orange">オレンジ強調</em>するには&lt;em class="orange"&gt;を利用します。
文字列を<em class="comment">コメント強調</em>するには&lt;em class="comment"&gt;を利用します。
文字列を<em class="command">コマンド</em>にするには&lt;em class="command"&gt;を利用します。
</pre>
</div>

#### 2.構文、定義用

<div class="code-box-syntax no-title">
<pre>
タイトル無しのコードPRE
文字列を<em>強調</em>するには&lt;em&gt;を利用します。
文字列を<em class="blue">青強調</em>するには&lt;em class="blue"&gt;を利用します。
文字列を<em class="orange">オレンジ強調</em>するには&lt;em class="orange"&gt;を利用します。
文字列を<em class="comment">コメント強調</em>するには&lt;em class="comment"&gt;を利用します。
文字列を<em class="command">コマンド</em>にするには&lt;em class="command"&gt;を利用します。
</pre>
</div>

<div class="code-box-syntax">
<div class="title">SQL</div>
<pre>
タイトル付きのコードPRE
文字列を<em>強調</em>するには&lt;em&gt;を利用します。
文字列を<em class="blue">青強調</em>するには&lt;em class="blue"&gt;を利用します。
文字列を<em class="orange">オレンジ強調</em>するには&lt;em class="orange"&gt;を利用します。
文字列を<em class="comment">コメント強調</em>するには&lt;em class="comment"&gt;を利用します。
文字列を<em class="command">コマンド</em>にするには&lt;em class="command"&gt;を利用します。
</pre>
</div>

#### 3.入力用

<div class="code-box-input no-title">
<pre>
タイトル無しのコードPRE
文字列を<em>強調</em>するには&lt;em&gt;を利用します。
文字列を<em class="blue">青強調</em>するには&lt;em class="blue"&gt;を利用します。
文字列を<em class="orange">オレンジ強調</em>するには&lt;em class="orange"&gt;を利用します。
文字列を<em class="comment">コメント強調</em>するには&lt;em class="comment"&gt;を利用します。
文字列を<em class="command">コマンド</em>にするには&lt;em class="command"&gt;を利用します。
</pre>
</div>

<div class="code-box-input">
<div class="title">SQL</div>
<pre>
タイトル付きのコードPRE
文字列を<em>強調</em>するには&lt;em&gt;を利用します。
文字列を<em class="blue">青強調</em>するには&lt;em class="blue"&gt;を利用します。
文字列を<em class="orange">オレンジ強調</em>するには&lt;em class="orange"&gt;を利用します。
文字列を<em class="comment">コメント強調</em>するには&lt;em class="comment"&gt;を利用します。
文字列を<em class="command">コマンド</em>にするには&lt;em class="command"&gt;を利用します。
</pre>
</div>

#### 4.出力用

<div class="code-box-output no-title">
<pre>
タイトル無しのコードPRE
文字列を<em>強調</em>するには&lt;em&gt;を利用します。
文字列を<em class="blue">青強調</em>するには&lt;em class="blue"&gt;を利用します。
文字列を<em class="orange">オレンジ強調</em>するには&lt;em class="orange"&gt;を利用します。
文字列を<em class="comment">コメント強調</em>するには&lt;em class="comment"&gt;を利用します。
文字列を<em class="command">コマンド</em>にするには&lt;em class="command"&gt;を利用します。
</pre>
</div>

<div class="code-box-output">
<div class="title">SQL</div>
<pre>
タイトル付きのコードPRE
文字列を<em>強調</em>するには&lt;em&gt;を利用します。
文字列を<em class="blue">青強調</em>するには&lt;em class="blue"&gt;を利用します。
文字列を<em class="orange">オレンジ強調</em>するには&lt;em class="orange"&gt;を利用します。
文字列を<em class="comment">コメント強調</em>するには&lt;em class="comment"&gt;を利用します。
文字列を<em class="command">コマンド</em>にするには&lt;em class="command"&gt;を利用します。
</pre>
</div>

{% include goto_pagetop.html %}

## <a name="code-box-make-article">コードPRE(makeArticle記法)</a>

- makeArticleを利用したメモ作成時は、[makeArticle記法](#code-box-make-article)が利用できます
- makeArticle記法は変換結果として[コードPRE](#code-box)が出力されます

### 書式

#### 1.通常用

<div class="code-box">
<div class="title">コードPRE(通常用)</div>
<pre>
```
<em class="comment">ここにコード...
ここにコード...</em>
```
</pre>
</div>

<div class="code-box">
<div class="title">コードPRE(通常用) - タイトル付き</div>
<pre>
```<em>:</em><em class="comment">ここにタイトル</em>
<em class="comment">ここにコード...
ここにコード...</em>
```
</pre>
</div>

#### 2.構文、定義用

<div class="code-box-syntax">
<div class="title">コードPRE(構文、定義用)</div>
<pre>
```<em>syntax</em>
<em class="comment">ここにコード...
ここにコード...</em>
```
</pre>
</div>

<div class="code-box-syntax">
<div class="title">コードPRE(構文、定義用) - タイトル付き</div>
<pre>
```<em>syntax:</em><em class="comment">ここにタイトル</em>
<em class="comment">ここにコード...
ここにコード...</em>
```
</pre>
</div>

#### 3.入力用

<div class="code-box-input">
<div class="title">コードPRE(入力用)</div>
<pre>
```<em>input</em>
<em class="comment">ここにコード...
ここにコード...</em>
```
</pre>
</div>

<div class="code-box-input">
<div class="title">コードPRE(入力用) - タイトル付き</div>
<pre>
```<em>input:</em><em class="comment">ここにタイトル</em>
<em class="comment">ここにコード...
ここにコード...</em>
```
</pre>
</div>

#### 4.出力用

<div class="code-box-output">
<div class="title">コードPRE(出力用)</div>
<pre>
```<em>output</em>
<em class="comment">ここにコード...
ここにコード...</em>
```
</pre>
</div>

<div class="code-box-output">
<div class="title">コードPRE(出力用) - タイトル付き</div>
<pre>
```<em>output:</em><em class="comment">ここにタイトル</em>
<em class="comment">ここにコード...
ここにコード...</em>
```
</pre>
</div>

### 強調

- makeArticle記法中で強調を利用するには、`{em{`で開始し、`}em}`で終了するように囲みます
- makeArticle記法中で通常の強調以外を利用するには、`{em:<種類>{`で開始し、`}em}`で終了するように囲みます
- `<種類>`には`blue`、`comment`、`command`が入ります

<div class="code-box no-title">
<pre>
文字列を<em>強調</em>するには{em{強調}em}を利用します。
文字列を<em class="blue">青強調</em>するには{em:blue{青強調}em}を利用します。
文字列を<em class="orange">オレンジ強調</em>するには{em:orange{オレンジ強調}em}を利用します。
文字列を<em class="comment">コメント強調</em>するには{em:comment{コメント強調}em}を利用します。
文字列を<em class="command">コマンド</em>にするには{em:command{コマンド}em}を利用します。
</pre>
</div>

### リンク

- makeArticle記法中でリンクを利用するには、`{link:<URL>{`で開始し、`}link}`で終了するように囲みます

<div class="code-box no-title">
<pre>
例えば、<a href="https://www.yahoo.co.jp/">Yahoo</a>へのリンクを付けるには、
{link:https://www.yahoo.co.jp/{Yahoo}link}とします。
</pre>
</div>

{% include goto_pagetop.html %}

## <a name="cite">引用</a>

### 書式

- `>`の中でHTMLタグや、`{% raw %}{% ... %}{% endraw %}`も使えます
<div class="code-box no-title">
<pre>
&gt; <em class="blue">&lt;b&gt;タイトルなど&lt;/b&gt;</em>
&gt; 
&gt; 人は、告白の言葉に負けないくらい、別れの言葉に力を入れるものである。
&gt; <em>&lt;cite&gt;</em>{% raw %}{% include book/book_588.html %} {% comment %} 一生忘れない読書 {% endcomment %}{% endraw %}より<em>&lt;/cite&gt;</em>
</pre>
</div>

### デモ

> <b>別れの言葉</b>
> 
> 人は、告白の言葉に負けないくらい、別れの言葉に力を入れるものである。
> <cite>{% include book/book_588.html %} {% comment %} 一生忘れない読書 {% endcomment %}より</cite>

{% include goto_pagetop.html %}

## <a name="book-reference">書籍参照</a>

### 書式

- `include`を使います
- 引数は`book_xxx.html`へのパスです

BOOK# <input type="text" id="BookReferenceBookNumber" value="588">
書名(コメント部分) <input type="text" id="BookReferenceBookNameComment" value="一生忘れない読書">
<input type="button" id="BookReferenceRevert" value="元に戻す">

<div class="code-box no-title">
<pre id="BookReferencePre">
{% raw %}<em>{% include</em> <em class="command">book/book_588.html</em> <em>%}</em> <em class="comment">{% comment %} 一生忘れない読書 {% endcomment %}</em>{% endraw %}
</pre>
</div>

<script>
    let bookNumber = document.getElementById('BookReferenceBookNumber');
    let bookNameComment = document.getElementById('BookReferenceBookNameComment');
    let bookReferenceRevert = document.getElementById('BookReferenceRevert');
    let bookReferencePre = document.getElementById('BookReferencePre');

    // 「BOOK#」変更時
    // 「書名(コメント部分) 」変更時
    let updateToValue = () => {
        {% raw %}
        bookReferencePre.innerHTML = bookReferencePre.innerHTML
            .replace(/book\/book_.*\.html/, `book/book_${bookNumber.value.trim()}.html`)
            .replace(/{% comment %} .* {% endcomment %}/, `{% comment %} ${bookNameComment.value.trim()} {% endcomment %}`);
        {% endraw %}
    };
    ['change', 'keyup', 'keydown', 'keypress'].forEach(e => {
        bookNumber.addEventListener(e, updateToValue, false);
        bookNameComment.addEventListener(e, updateToValue, false);
    });

    // 「元に戻す」押下時
    bookReferenceRevert.addEventListener('click', () => {
        bookNumber.value = '588';
        bookNameComment.value = '一生忘れない読書';
        bookNumber.dispatchEvent(new Event('change'));
    }, false);
</script>

### デモ

{% include book/book_588.html %} {% comment %} 一生忘れない読書 {% endcomment %}

{% include goto_pagetop.html %}

## <a name="table">テーブル</a>

### テーブル

- タグの属性に`markdown="span"`と入れることで、そのタグ内でMarkdown記法が使える
- tableタグの属性に`class="normal"`を指定すると、以下のような背景色のテーブルとなります

<table class="normal">
    <thead>
        <tr>
            <th>左揃え</th>
            <th>中央揃え</th>
            <th>右揃え</th>
        </tr>
        <tr>
            <td markdown="span">`markdown="span"` とすると、`td`中でマークダウンを利用可能。</td>
            <td markdown="span">[参考](https://idratherbewriting.com/documentation-theme-jekyll/mydoc_tables.html)</td>
            <td markdown="span">構成ファイルの**読み込み**や  
                                スクリプトの実行を行わないデフォルトはこれ。</td>
        </tr>
        <tr>
            <td>`markdown="span"` とすると、`td`中でマークダウンを利用可能。</td>
            <td>[参考](https://idratherbewriting.com/documentation-theme-jekyll/mydoc_tables.html)</td>
            <td>構成ファイルの**読み込み**や  
                スクリプトの実行を行わないデフォルトはこれ。</td>
        </tr>
    </thead>
    <tbody>
    </tbody>
</table>

### マークダウン

|左揃え      |  中央揃え |          右揃え |
|:-----------|:--------:|----------------:|
|Restricted  |〇        |構成ファイルの読み込みやスクリプトの実行を行わないデフォルトはこれ。|
|AllSigned   |          |すべてのスクリプトと構成ファイルが信頼された発行元によって署名されていることを要求する。ユーザーがローカルに書き込むスクリプトを含む。|
|RemoteSigned|          |インターネットからダウンロードされたすべてのスクリプトおよび構成ファイルが、信頼された発行元によって署名されていることを要求します。ユーザーがローカルに書き込むスクリプトは除く。|
|Unrestricted|          |すべての構成ファイルを読み込み、すべてのスクリプトを実行する。インターネットからダウンロードされた署名されていないスクリプトを実行する場合、スクリプトを実行する前に確認を求められる。|
|Bypass      |          |何もブロックされず、警告もメッセージも表示されない。|
|Undefined   |          |現在のスコープから現在割り当てられている実行ポリシーを削除する。このパラメーターは、グループポリシースコープ内で設定された実行ポリシーは削除しない。|

※改行はできないので注意

{% include goto_pagetop.html %}

## <a name="footnotes">注釈</a>

- 注釈を書きたい場所に`[^＜注釈のID＞]`のように記述し、
- 注釈の内容はそのページ内の任意の場所へ、`[^＜注釈のID＞]: ＜注釈の説明＞`のように記載する。
- サンプルとしては、Groovy基礎文法最速マスター

<div class="code-box">
<div class="title">例1</div>
<pre>
#### 複数行文字列
上記４つの文字列の複数行文字列<em>[^here-document]</em>もリテラルレベルでサポートされています。  
シングルクォートとダブルクォートはそれぞれ3つにすることで複数行文字列として利用可能です。  
スラッシュ文字列とドルスラッシュ文字列は最初から複数行文字列として利用可能です。

<em>[^here-document]: いわゆるヒアドキュメント</em>
</pre>
</div>

<div class="code-box">
<div class="title">例2</div>
<pre>
#### do
Groovyにdoはありません。<em>[^no-do]</em>

<em>[^no-do]: [こちら](https://npnl.hatenablog.jp/entry/20110630/1309446463)で無理やりdo-whileを実装する実験をしました。</em>
</pre>
</div>

{% include goto_pagetop.html %}
