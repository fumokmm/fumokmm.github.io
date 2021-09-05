---
chapter_no: 4
chapter_title: フィルター
created: 2021-09-05
updated: 2021-09-05
---
{% raw %}
フィルターはLiquidのオブジェクトや変数の出力結果を変換します。関数みたいなものと考えてもらえるといいと思います。  
フィルターは二重波括弧内で使い、パイプ(`|`)で区切って変数などに適用して行きます。

```:Input
{{ "/my/fancy/url" | append: ".html" }}
```
```output:Output
/my/fancy/url.html
```

一つに出力に対して複数のフィルターが使用されることもあります。適用順は左から右です。
```:Input
{{ "fumo!" | capitalize | prepend: "Hello " }}
```
```output:Output
Hello Fumo!
```

この例では、まず "fumo!" という文字列の先頭を大文字にして、その後 "Hello " という文字列を頭にくっつけています。
{% endraw %}

利用可能な主なフィルターは[こちら]({% link _it_articles/liquid/filters.md %})で紹介しています。
