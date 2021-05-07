---
chapter_no: 3
chapter_id: enum-definition
chapter_title: enum定義
created: 2012-05-03
updated: 2021-01-14
---
<div class="code-box">
<div class="title">enum定義</div>
<pre>
enum Food <em>implements Colored</em> {
    rice { <em>@Override public String getColor() { return "白"; }</em> }, // こめ
    bread { <em>@Override public String getColor() { return "白と茶"; }</em> }, // ぱん
    noodle { <em>@Override public String getColor() { return "白"; }</em> }, // めん
    ;
}
</pre>
</div>

enumの定義時にインタフェースを実装してあげます。これは直接実装していってますが、以下のようにプライベートコンストラクタで値を受け取る方法でも可能です。

<div class="code-box">
<div class="title">enum定義 (プライベートコンストラクタ版)</div>
<pre>
enum Animal <em>implements Colored</em> {
    cat(<em class="blue">"白と黒と茶"</em>), // ねこ
    tiger(<em class="blue">"黄と黒"</em>), // とら
    lion(<em class="blue">"茶"</em>), // らいおん
    goat(<em class="blue">"白"</em>), // やぎ
    sheep(<em class="blue">"白"</em>), // ひつじ
    ;
    <em class="blue">private String color;
    private Animal(String color) { this.color = color; }</em>
    <em>@Override public String getColor() { return</em> <em class="blue">this.color</em>; <em>}</em>
}
</pre>
</div>
