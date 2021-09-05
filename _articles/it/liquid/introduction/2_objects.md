---
chapter_no: 2
chapter_title: オブジェクト
created: 2021-09-05
updated: 2021-09-05
---
{% raw %}
オブジェクトはLiquidがページに表示する内容の入れ物です。  
オブジェクトと変数は二重の波括弧(`{{` と `}}`)に値を評価され出力されます。

```:Input
{{ page.title }}
```

```output:Output
Liquidの紹介
```

この例の場合、Liquidは`page`オブジェクトの`title`プロパティの内容を出力します。
それは "Liquidの紹介" という内容のテキストです。
{% endraw %}