---
chapter_no: 1
chapter_title: assign
created: 2021-09-08
updated: 2021-09-08
---
`assign`で新しい名前の変数を作成します。

{% raw %}
```syntax
{% {em{assign}em} {em:blue{<変数名>}em} = {em:orange{<値>}em} %}
```
{% endraw %}

### 例
{% raw %}
```:Input
{% assign my_variable = false %}
{% if my_variable != true %}
  This statement is valid.
{% endif %}
```
```output:Output
  This statement is valid.
```
{% endraw %}

- `if`については[こちら]({% link _it_articles/liquid/control_flow.md %}#if)。

値をダブルクォート(`"`)で囲んであげると、文字列の変数として設定できます。

{% raw %}
```:Input
{% assign foo = {em{"bar"}em} %}
{{ foo }}
```
```output:Output
bar
```
{% endraw %}
