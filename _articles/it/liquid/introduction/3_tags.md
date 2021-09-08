---
chapter_no: 3
chapter_title: タグ
created: 2021-09-05
updated: 2021-09-08
---
{% raw %}
タグはテンプレート内でロジックは制御フローを生成します。  
波括弧とパーセント(`{%` と `%}`)で囲んだ内容は最終的には何も出力されません。  
ここの中では、変数に値を設定し、条件やループを生成することになります。

```:Input
{% if user %}
  Hello {{ user.name }}!
{% endif %}
```

```output:Output
  Hello fumo!
```
{% endraw %}

タグは色々なタイプに分類されます。
- [制御フロー]({% link _it_articles/liquid/control_flow.md %})
- 繰り返し
- テンプレート
- [変数設定]({% link _it_articles/liquid/variable.md %})

詳細はまたあとで書きます。
