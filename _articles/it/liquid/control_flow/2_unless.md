---
chapter_no: 2
chapter_title: unless
created: 2021-09-07
updated: 2021-09-07
---
{% raw %}
- `unless`は[if](#if)の反対で、`条件`が`true`に*ならない*ときのみ、ブロックを実行します。
- `{% unless %}`で開始して、`{% endunless %}`で閉じます。

```syntax
{% {em{unless}em} {em:blue{<条件>}em} %}
  {em:orange{<ブロック>}em}
{% {em{endunless}em} %}
```
### 例
```:Input (product.titleの値が "すごくない靴" の場合)
{% {em{unless}em} product.title == "すごい靴" %}
  こりゃすごい靴じゃないぞ！
{% {em{unless}em} %}
```
```output:Output
こりゃすごい靴じゃないぞ！
```

- `unless`は以下と同じ動きをします。
```:Input (product.titleの値が "すごくない靴" の場合)
{% if product.title {em{!=}em} "すごい靴" %}
  こりゃすごい靴じゃないぞ！
{% endif %}
```

{% endraw %}