---
title: TOMLのメモ
article_group_id: format-group
display_order: 80
created: 2021-04-20
updated: 2022-09-29
---
{% capture link_to_it_rust %}{% link _it_articles/rust/index.md %}{% endcapture %}{% assign link_to_it_rust = link_to_it_rust | remove: 'index' %}

TOMLのメモです。
## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<ul id="index_ul">
<li><a href="#概要">概要</a></li>
<li><a href="#利用例">利用例</a></li>
<li><a href="#参考">参考</a></li>
</ul>

* * *
## <a name="概要">概要</a><a class="heading-anchor-permalink" href="#概要">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-09-29" updated="2022-09-29" %}</div>
### TOMLとは
- `TOML`は、設定ファイルのフォーマットの種です。
- 「ミニマル」であることを目指し明確な構文を採用し、読みやすいフォーマットとなるように作られているらしいです。
- `TOML`の設定項目は、*ディクショナリ構造に明確にマッピング*されるように設計されているらしいです。
- `.INIファイル`の構文を踏襲し、より形式的な仕様が定義されているとのこと。
- `TOML`という名称は、「*Tom's Obvious, Minimal Language*」のアクロニム（頭文字を取って作った語）で、*Tom*は、作者の*トム・プレストン・ワーナー*さんのことです。
- `TOML`は多数のソフトウェアプロジェクトで採用されており、多数のプログラミング言語で実装されているようです。

{% include goto_pagetop.html %}

* * *
## <a name="利用例">利用例</a><a class="heading-anchor-permalink" href="#利用例">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-09-29" updated="2022-09-29" %}</div>
### TOMLが利用されている言語
- [Rust]({{link_to_it_rust}})のプロジェクト設定ファイル(`Cargo.toml`)。

{% include goto_pagetop.html %}

* * *
## <a name="参考">参考</a><a class="heading-anchor-permalink" href="#参考">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-09-29" updated="2022-09-29" %}</div>
### 参考サイト
- [(Wikipedia) TOML](https://ja.wikipedia.org/wiki/TOML)

{% include goto_pagetop.html %}

{% include footnotes_link.html %}
