---
layout: default_layout
title: テンプレートのページ
created: 2020-11-21
updated: 2021-03-30
---
テンプレートのページ。

- - -
## <a name="index">目次</a>

- [見出し](#header)
- [コードPRE](#code-box)
- [引用](#cite)
- [書籍参照](#book-reference)
- [テーブル](#table)

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

### 強調

- 強調するには`<em></em>`を用います
- 青強調するには`<em class="blue"></em>`を用います
- コメント強調するには`<em class="comment"></em>`を用います
- コマンド強調するには`<em class="command"></em>`を用います

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

### デモ

#### 1.通常用

<div class="code-box no-title">
<pre>
タイトル無しのコードPRE
文字列を<em>強調</em>するには&lt;em&gt;を利用します。
文字列を<em class="blue">青強調</em>するには&lt;em class="blue"&gt;を利用します。
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
文字列を<em class="comment">コメント強調</em>するには&lt;em class="comment"&gt;を利用します。
文字列を<em class="command">コマンド</em>にするには&lt;em class="command"&gt;を利用します。
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

<div class="code-box no-title">
<pre>
{% raw %}<em>{% include</em> <em class="command">book/book_588.html</em> <em>%}</em> <em class="comment">{% comment %} 一生忘れない読書 {% endcomment %}</em>{% endraw %}
</pre>
</div>

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
