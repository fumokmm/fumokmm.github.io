---
chapter_no: 1
chapter_title: size
created: 2021-06-02
updated: 2021-06-02
---
配列のサイズ(長さ)を調べたり、文字列の文字数を取得したりします。

{% raw %}
```syntax:配列の長さ(サイズ)を取得
{% assign my_array = "リンゴ, みかん, もも, 梅" | split: ", " %}
{{ my_array.size }}
```
{% endraw %}
```output:結果
4
```

{% raw %}
```syntax:文字列の長さ(文字数)を取得
{{ "abcde" | size }}
```
{% endraw %}
```output:結果
5
```
