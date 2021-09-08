---
chapter_no: 3
chapter_title: elsif / else
created: 2021-09-08
updated: 2021-09-08
---
[if](#if)や[unless](#unless)に対して、*それ以外*の条件の時に実行するブロックを追加します。

{% raw %}
```syntax:if-else
{% {em{if}em} {em:blue{<条件1>}em} %}
  {em:orange{<ブロック1>}em}
{% {em{else}em} {em:blue{<条件2>}em} %}
  {em:orange{<ブロック2>}em}
{% {em{endif}em} %}
```
```syntax:if-elsif-else
{% {em{if}em} {em:blue{<条件1>}em} %}
  {em:orange{<ブロック1>}em}
{% {em{elsif}em} {em:blue{<条件2>}em} %}
  {em:orange{<ブロック2>}em}
{% {em{else}em} {em:blue{<条件3>}em} %}
  {em:orange{<ブロック3>}em}
{% {em{endif}em} %}
```
```syntax:unless-else
{% {em{unless}em} {em:blue{<条件1>}em} %}
  {em:orange{<ブロック1>}em}
{% {em{else}em} {em:blue{<条件2>}em} %}
  {em:orange{<ブロック3>}em}
{% {em{endif}em} %}
```
{% endraw %}
- ちなみに、`unless`に対して、`elsif`を付けることもできますが分かりづらいのであまり使わないかなと思います。[^ruby-unless]

### 例
{% raw %}
```:Input
{% assign name = "anonymous" %}
{% if name == "kevin" %}
  こんにちは、ケビン！
{% {em{elsif}em} name == "anonymous" %}
  こんにちは、匿名さん！
{% {em{else}em} %}
  あんたは誰だ！？
{% endif %}
```
```output:Output
こんにちは、匿名さん！
```
{% endraw %}
- `assign`については[こちら]({% link _it_articles/liquid/variable.md %}#assign)。

[^ruby-unless]: [Ruby]({{link_to_it_ruby}})の方では、`unless`に対して`elsif`は付けられないのに変なところで頑張ってますね😀(誉め言葉)。