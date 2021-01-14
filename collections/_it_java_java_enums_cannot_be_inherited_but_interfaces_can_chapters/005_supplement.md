---
article: /it/java/java_enums_cannot_be_inherited_but_interfaces_can_chapters
chapter_no: 005
chapter_id: supplement
chapter_title: 補足
created: 2012-05-03
updated: 2021-01-14
---
今回作ったインタフェースのColoredは`#getColor()`メソッドしか定義していませんので、enumにもとからあるメソッド(`#name()`とか)は当然の事ながら使えません。なので、必要に応じてinterfaceの方に加えておくとよいでしょう。

<div class="code-box">
<div class="title">#nameメソッドの追加</div>
<pre>
interface Colored {
    String getColor();
    String name(); <em class="comment">// ← 追加！</em>
}
</pre>
</div>

こうしておけば、enumはもとから`#name()`は持っているので、そのままenum側のコードには何も手を加えずに、Coloredとしても`#name()`を利用できるようになります。
