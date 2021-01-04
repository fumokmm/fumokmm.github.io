---
layout: default_layout
title: テンプレートのページ
created: 2020-11-21
updated: 2020-12-08
---
テンプレートのページ。

- - -
## <a name="index">目次</a>

- [見出し](#header)
- [コードPRE(通常用)](#code-box)
- [コードPRE(入力用)](#code-box-input)
- [コードPRE(出力用)](#code-box-output)
- [テーブル](#table)

- - -
## <a name="header">見出し</a>

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

- - -
## <a name="code-box">コードPRE(通常用)</a>

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

## <a name="code-box-input">コードPRE(入力用)</a>

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

## <a name="code-box-output">コードPRE(出力用)</a>

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

## <a name="table">テーブル</a>

|左揃え      |  中央揃え |          右揃え |
|:-----------|:--------:|----------------:|
|Restricted  |〇        |構成ファイルの読み込みやスクリプトの実行を行わないデフォルトはこれ。|
|AllSigned   |          |すべてのスクリプトと構成ファイルが信頼された発行元によって署名されていることを要求する。ユーザーがローカルに書き込むスクリプトを含む。|
|RemoteSigned|          |インターネットからダウンロードされたすべてのスクリプトおよび構成ファイルが、信頼された発行元によって署名されていることを要求します。ユーザーがローカルに書き込むスクリプトは除く。|
|Unrestricted|          |すべての構成ファイルを読み込み、すべてのスクリプトを実行する。インターネットからダウンロードされた署名されていないスクリプトを実行する場合、スクリプトを実行する前に確認を求められる。|
|Bypass      |          |何もブロックされず、警告もメッセージも表示されない。|
|Undefined   |          |現在のスコープから現在割り当てられている実行ポリシーを削除する。このパラメーターは、グループポリシースコープ内で設定された実行ポリシーは削除しない。|

※改行はできないので注意

<table>
    <colgroup>
        <col width="33%" />
        <col width="33%" />
        <col width="33%" />
    </colgroup>
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
