---
title: 期待について
display_order: 10
created: 2021-01-20
updated: 2021-01-20
---
{% assign chapter_list = site.life_attitude_expectations_chapters %}

## <a name="index">目次</a>

<ul>
{% for chapter_item in chapter_list %}
<li><a href="#{{ chapter_item.chapter_id }}">{{ chapter_item.chapter_title }}</a></li>
{% endfor %}
</ul>

{% comment %} 以下、記事 {% endcomment %}

{% for chapter_item in chapter_list %}
## <a name="{{ chapter_item.chapter_id }}">{{ chapter_item.chapter_title }}</a>
<div class="chapter-updated">{% include update_info_inline.html created=chapter_item.created updated=chapter_item.updated %}</div>
{{ chapter_item.content | markdownify }}
{% include goto_pagetop.html %}
{% endfor %}

## <a name="index">目次</a>

<ul id="index_ul">
<li><a href="#letting-go-of-expectations">期待を捨てる</a></li>
<li><a href="#reference">参考</a></li>
</ul>

* * *
## <a name="letting-go-of-expectations">期待を捨てる</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-01-20" updated="2021-01-20" %}</div>
> 何も期待しないとき、あなたは今という瞬間を生きられる。 未来への不安も過去の拒絶もなくシンプルに訪れた状況を歓迎できる。  
> そしてすべてを受け容れるとは、仕方なく妥協するという意味ではない。引き受けて責任を取るという意味だ。  
> 覚えておいて欲しい。自分が権利と責任を持っているものは、いつでも変えられる。  
> 問題を解決する唯一最大の効果的な方法になることもある。だから引き受けよう。  
>   
> 「望み通りの事象を起こそうとするのではなく、あるがままに起こることを願えば、すべてはうまくいく」  
> ──エピクテトス
> <cite>{% include book/book_600.html %} {% comment %} あなたはあなたが使っている言葉でできている {% endcomment %}</cite>

- 最後のエピクテトスの言葉がすべてをうまくまとめている。
- 今に責任を持って生きていく態度を持てば世界は一変する。

{% include goto_pagetop.html %}

* * *
## <a name="reference">参考</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-01-20" updated="2021-01-20" %}</div>
- {% include book/book_600.html %} {% comment %} あなたはあなたが使っている言葉でできている {% endcomment %}

{% include goto_pagetop.html %}

{% include footnotes_link.html %}
