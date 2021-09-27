---
title: Goの文法
article_group_id: basis-group
display_order: 10
created: 2021-09-24
updated: 2021-09-24
---

## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<div style="column-count: 2;">
    <ul id="index_ul">
        <li><a href="#基礎文法">基礎文法</a>
            <ul>
                <li><a href="#Goの特徴">Goの特徴</a></li>
                <li><a href="#HelloWorld">HelloWorld</a></li>
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
- 変数宣言は「var」。
- 関数定義は「func 関数名(引数...)」、戻り値の指定は「return 式」。

### 類似の言語
- CやJavaの文法に近い。

{% include goto_pagetop.html %}

* * *
## <a name="HelloWorld">HelloWorld</a><a class="heading-anchor-permalink" href="#HelloWorld">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-09-24" updated="2021-09-24" %}</div>
<div class="code-box no-title">
<pre>
package main

import "fmt"

func main() {
	fmt.Println("Hello, World.")
}
</pre>
</div>

### 参考サイト
- [(Qiita) ひさしぶりのHello world ~ Go編 ~](https://qiita.com/kouyaf77@github/items/806394a9885dc2eae091)

{% include goto_pagetop.html %}

## <a name="参照・参考">参照・参考</a><a class="heading-anchor-permalink" href="#参照・参考">§</a>
* * *
## <a name="参考">参考</a><a class="heading-anchor-permalink" href="#参考">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-09-24" updated="2021-09-27" %}</div>
### 参考サイト
- [(Qiita) ひさしぶりのHello world ~ Go編 ~](https://qiita.com/kouyaf77@github/items/806394a9885dc2eae091)

### 参考書籍
- {% include book/book_270.html %} {% comment %} プログラミング経験者がGo言語を本格的に勉強する前に読むための本 {% endcomment %}

{% include goto_pagetop.html %}

{% include footnotes_link.html %}
