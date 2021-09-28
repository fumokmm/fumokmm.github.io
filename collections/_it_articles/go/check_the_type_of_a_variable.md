---
title: Goで変数の型を調べる
article_group_id: reverse-lookup-group
display_order: 10
created: 2021-09-28
updated: 2021-09-28
---

## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<ul id="index_ul">
<li><a href="#変数の型を調べる">変数の型を調べる</a></li>
<li><a href="#参考">参考</a></li>
</ul>

* * *
## <a name="変数の型を調べる">変数の型を調べる</a><a class="heading-anchor-permalink" href="#変数の型を調べる">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-09-28" updated="2021-09-28" %}</div>
- `reflect`パッケージの`TypeOf`を使います。

<div class="code-box">
<div class="title">main.go</div>
<pre>
package main

import (
	"fmt"
	<em>"reflect"</em>
)

func main() {
	n := 10
	var n16 int16 = 10
	fmt.Println(n, <em>reflect.TypeOf(</em>n<em>)</em>)
	fmt.Println(n16, <em>reflect.TypeOf(</em>n16<em>)</em>)
}
</pre>
</div>

<div class="code-box-output">
<div class="title">出力結果</div>
<pre>
10 int
10 int16
</pre>
</div>

{% include goto_pagetop.html %}

* * *
## <a name="参考">参考</a><a class="heading-anchor-permalink" href="#参考">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-09-28" updated="2021-09-28" %}</div>
### サンプルソース
- [(0005_reflect-TypeOf) language-examples](https://github.com/fumokmm/language-examples/tree/main/Go/0005_reflect-TypeOf)

### 参考動画
- [(YouTube) 【たった1時間で学べる】Go言語のプログラミング初心者向けの超入門講座【文字書き起こし、ソースコードも完全無料！】](https://www.youtube.com/watch?v=kPXfMFJ0oIE)

### 参考サイト
- [(雑多なメモ置き場) Golangで型情報を調べる](https://y0m0r.hateblo.jp/entry/20140413/1397397593)

{% include goto_pagetop.html %}

{% include footnotes_link.html %}
