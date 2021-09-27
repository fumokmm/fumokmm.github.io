---
title: Goの文法
article_group_id: basis-group
display_order: 10
created: 2021-09-24
updated: 2021-09-27
---

## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<div style="column-count: 2;">
    <ul id="index_ul">
        <li><a href="#基礎文法">基礎文法</a>
            <ul>
                <li><a href="#Goの特徴">Goの特徴</a></li>
                <li><a href="#HelloWorld">HelloWorld</a></li>
                <li><a href="#パッケージ">パッケージ</a></li>
            </ul>
        </li>
        <li><a href="#参照・参考">参照・参考</a>
            <ul>
                <li><a href="#参考">参考</a></li>
            </ul>
        </li>
    </ul>
</div>

## <a name="基礎文法">基礎文法</a><a class="heading-anchor-permalink" href="#基礎文法">§</a>
* * *
## <a name="Goの特徴">Goの特徴</a><a class="heading-anchor-permalink" href="#Goの特徴">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-09-27" updated="2021-09-27" %}</div>
### 特徴
- 文末のセミコロンを付ける必要はない(付けてもOK)。
- セミコロンで文を区切れば1行に複数の処理を記載できる。
- 値の代入はイコール(`=`)。
- ダブルクォートで括ると通常の文字列、バッククォートで括ると`raw文字列`。
- 処理のブロックは波括弧で括る。
- クラスのメンバアクセスはドットで行う。
- 大文字と小文字は区別される。
- 識別子に使えるのは文字、数値、アンダースコアで数値以外から始める(2バイト文字も使用可)。
- 単行コメントは「`// ～～`」、複数行コメントは「`/* ～～ */`」。
- 変数宣言は「`var`」。
- 関数定義は「`func` 関数名(引数...)」、戻り値の指定は「`return` 式」。

### 類似の言語
- CやJavaの文法に近い。

### 参考書籍
- {% include book/book_270.html %} {% comment %} プログラミング経験者がGo言語を本格的に勉強する前に読むための本 {% endcomment %}

{% include goto_pagetop.html %}

* * *
## <a name="HelloWorld">HelloWorld</a><a class="heading-anchor-permalink" href="#HelloWorld">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-09-24" updated="2021-09-27" %}</div>
<div class="code-box no-title">
<pre>
package main

import "fmt"

func main() {
	fmt.Println("Hello, World.")
}
</pre>
</div>

### サンプルソース
- [(0001_hello-world) language-examples](https://github.com/fumokmm/language-examples/tree/main/Go/0001_hello-world)

### 参考サイト
- [(Qiita) ひさしぶりのHello world ~ Go編 ~](https://qiita.com/kouyaf77@github/items/806394a9885dc2eae091)

{% include goto_pagetop.html %}

* * *
## <a name="パッケージ">パッケージ</a><a class="heading-anchor-permalink" href="#パッケージ">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-09-27" updated="2021-09-27" %}</div>
### パッケージとは
- Go言語のプログラムは一つ以上のパッケージで構成されます。
- パッケージは一つ以上のソースファイルで構成されます。
- パッケージの宣言には`package文`を使用します。
- 同じパッケージに属するソースファイルは全て同一のディレクトリに格納します。
- 一つのディレクトリに複数のパッケージをまとめることはできません。
- プログラムはmainパッケージのmain関数から開始されます(エントリポイント)。
- mainパッケージを除き、パッケージ名と格納ディレクトリは同じにする慣例(必須ではない)。

#### 例：同一パッケージのソースファイル
<div class="code-box">
<div class="title">s1.go</div>
<pre>
<em class="comment">// p1パッケージ</em>
<em>package p1</em>

func fnc1() {
    <em class="comment">// 略</em>
}
</pre>
</div>

<div class="code-box">
<div class="title">s2.go</div>
<pre>
<em class="comment">// p1パッケージ</em>
<em>package p2</em>

func fnc2() {
    <em class="blue">fnc1()</em> <em class="comment">// 同一パッケージ内の関数を呼び出す</em>
}
</pre>
</div>

### インポート
- 他のパッケージをインポートするには`import文`を使用します。
- 複数のパッケージをインポートする場合は、括弧を使ってまとめることｇできます。

#### 例：インポート
<div class="code-box no-title">
<pre>
<em class="comment">// 単一のインポート</em>
import "p1"
</pre>
</div>
<div class="code-box no-title">
<pre>
<em class="comment">// 複数のインポート</em>
import (
    "p2"
    "p3"
    "p4"
)
</pre>
</div>

### エクスポート
- 名前の先頭を小文字にするか大文字にするかでメンバーの公開範囲(エクスポート)を決めることができます。
- 小文字から始まるメンバーは異なるパッケージに属するソースからは参照できなくなります。
- 大文字から始まるメンバーは異なるパッケージに属するソースからも参照できます。

#### 例：エクスポート
<div class="code-box no-title">
<pre>
package p1

<em class="comment">// この関数はp1パッケージ以外からは使用できない</em>
func <em>f</em>nc1() {
    <em class="comment">// 略</em>
}

<em class="comment">// この関数はp1パッケージ以外から使用可能</em>
func <em>F</em>nc2() {
    <em class="comment">// 略</em>
}
</pre>
</div>

### サンプルソース
- [(0002_package) language-examples](https://github.com/fumokmm/language-examples/tree/main/Go/0002_package)

### 参考サイト
- [(teratail) Go言語のcannot find module for pathの解消法](https://teratail.com/questions/345476)
- [(Qiita) GOMODULE--Goのパッケージ管理](https://qiita.com/Syoitu/items/f221b52231703cebe8ff)
- [(Zenn) Go のモジュール管理【バージョン 1.17 改訂版】](https://zenn.dev/spiegel/articles/20210223-go-module-aware-mode)
- [(Qiita) 他言語から来た人がGoを使い始めてすぐハマったこととその答え](https://qiita.com/mumoshu/items/0d2f2a13c6e9fc8da2a4)

### 参考書籍
- {% include book/book_270.html %} {% comment %} プログラミング経験者がGo言語を本格的に勉強する前に読むための本 {% endcomment %}

{% include goto_pagetop.html %}

## <a name="参照・参考">参照・参考</a><a class="heading-anchor-permalink" href="#参照・参考">§</a>
* * *
## <a name="参考">参考</a><a class="heading-anchor-permalink" href="#参考">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-09-24" updated="2021-09-27" %}</div>
### サンプルソース
- [(0001_hello-world) language-examples](https://github.com/fumokmm/language-examples/tree/main/Go/0001_hello-world)
- [(0002_package) language-examples](https://github.com/fumokmm/language-examples/tree/main/Go/0002_package)

### 参考サイト
- [(Qiita) GOMODULE--Goのパッケージ管理](https://qiita.com/Syoitu/items/f221b52231703cebe8ff)
- [(Qiita) ひさしぶりのHello world ~ Go編 ~](https://qiita.com/kouyaf77@github/items/806394a9885dc2eae091)
- [(Qiita) 他言語から来た人がGoを使い始めてすぐハマったこととその答え](https://qiita.com/mumoshu/items/0d2f2a13c6e9fc8da2a4)
- [(teratail) Go言語のcannot find module for pathの解消法](https://teratail.com/questions/345476)
- [(Zenn) Go のモジュール管理【バージョン 1.17 改訂版】](https://zenn.dev/spiegel/articles/20210223-go-module-aware-mode)

### 参考書籍
- {% include book/book_270.html %} {% comment %} プログラミング経験者がGo言語を本格的に勉強する前に読むための本 {% endcomment %}

{% include goto_pagetop.html %}

{% include footnotes_link.html %}
