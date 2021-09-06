---
chapter_no: 1
chapter_title: if
created: 2021-09-06
updated: 2021-09-06
---
{% raw %}
- `if`は`条件`が`true`になるときのみ、ブロックを実行します。  
- `{% if %}`で開始して、`{% endif %}`で閉じます。

```syntax
{% {em{if}em} {em:blue{条件}em} %}
  {em:orange{<ブロック>}em}
{% {em{endif}em} %}
```
### 例
```:Input
{% if product.title == "すごい靴" %}
  こりゃすごい靴だ！
{% endif %}
```
```output:Output
こりゃすごい靴だ！
```
{% endraw %}
