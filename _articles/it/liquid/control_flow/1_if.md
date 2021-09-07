---
chapter_no: 1
chapter_title: if
created: 2021-09-06
updated: 2021-09-07
---
{% raw %}
- `if`は`条件`が`true`に*なるとき*のみ、ブロックを実行します。  
- `{% if %}`で開始して、`{% endif %}`で閉じます。

```syntax
{% {em{if}em} {em:blue{<条件>}em} %}
  {em:orange{<ブロック>}em}
{% {em{endif}em} %}
```
### 例
```:Input (product.titleの値が "すごい靴" の場合)
{% {em{if}em} product.title == "すごい靴" %}
  こりゃすごい靴だ！
{% {em{endif}em} %}
```
```output:Output
こりゃすごい靴だ！
```
{% endraw %}
