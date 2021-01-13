---
article: /it/java/java_enums_cannot_be_inherited_but_interfaces_can_chapters
chapter_no: 002
chapter_id: interfaceoduction
chapter_title: インタフェース
created: 2012-05-03
updated: 2021-01-13
---
<div class="code-box">
<div class="title">インタフェース</div>
<pre>
interface Colored {
    String getColor();
}
</pre>
</div>

まず、こんな感じのenumに付けるインタフェースを用意します。Coloredは色付けされたものという意味で、`#getColor()`すると、色を文字列で取得できるイメージです。
