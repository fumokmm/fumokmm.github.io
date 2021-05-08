---
title: Javaのenumは継承できないけどインタフェースが継承できる
display_order: 10
created: 2012-05-03
updated: 2021-02-23
---
当メモは2012-05-03に[投稿されたもの](https://npnl.hatenablog.jp/entry/2012/05/03/103145)を加筆修正し、再掲したものです。

## <a name="index">目次</a>

<ul id="index_ul">
<li><a href="#introduction">はじめに</a></li>
<li><a href="#interfaceoduction">インタフェース</a></li>
<li><a href="#enum-definition">enum定義</a></li>
<li><a href="#use-it">使ってみる</a></li>
<li><a href="#supplement">補足</a></li>
<li><a href="#test-source">テストを書いた</a></li>
<li><a href="#reference">参考</a></li>
</ul>

* * *
## <a name="introduction">はじめに</a>
<div class="chapter-updated">{% include update_info_inline.html created="2012-05-03" updated="2021-01-14" %}</div>
Javaのenumって便利ですよね。enumを使い続けていくとグルーピングしたくなってくる事があると思いますが、継承はできないので、そんな場合はインタフェースを実装してやるといいようです。

{% include goto_pagetop.html %}

* * *
## <a name="interfaceoduction">インタフェース</a>
<div class="chapter-updated">{% include update_info_inline.html created="2012-05-03" updated="2021-01-14" %}</div>
<div class="code-box">
<div class="title">インタフェース</div>
<pre>
interface Colored {
    String getColor();
}
</pre>
</div>

まず、こんな感じのenumに付けるインタフェースを用意します。Coloredは色付けされたものという意味で、`#getColor()`すると、色を文字列で取得できるイメージです。

{% include goto_pagetop.html %}

* * *
## <a name="enum-definition">enum定義</a>
<div class="chapter-updated">{% include update_info_inline.html created="2012-05-03" updated="2021-01-14" %}</div>
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

{% include goto_pagetop.html %}

* * *
## <a name="use-it">使ってみる</a>
<div class="chapter-updated">{% include update_info_inline.html created="2012-05-03" updated="2021-01-14" %}</div>
<div class="code-box">
<div class="title">Colored型で取得</div>
<pre>
Colored colored1 = Animal.cat;
Colored colored2 = Food.rice;
</pre>
</div>

これで、定義したenumはColoredとしても扱えるようになりました。あとはお好きな場面でColored型として利用するだけです。

{% include goto_pagetop.html %}

* * *
## <a name="supplement">補足</a>
<div class="chapter-updated">{% include update_info_inline.html created="2012-05-03" updated="2021-01-14" %}</div>
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

{% include goto_pagetop.html %}

* * *
## <a name="test-source">テストを書いた</a>
<div class="chapter-updated">{% include update_info_inline.html created="2012-05-03" updated="2021-01-14" %}</div>
<div class="code-box">
<div class="title">EnumTest.java</div>
<pre>
import static org.junit.Assert.*;
import static org.hamcrest.CoreMatchers.*;

import java.util.List;
import java.util.ArrayList;

import org.junit.Test;

public class EnumTest {
  @Test
  public void enumでインタフェースの実装テスト() {
    <em class="comment">// 用意したenumは 動物 と 食べ物</em>
    assertThat(Animal.class.getSimpleName(), is("Animal"));
    assertThat(Food.class.getSimpleName(), is("Food"));

    <em class="comment">// #values() で全要素が取得可能</em>
    assertArrayEquals(new Animal[]{
        Animal.cat, Animal.tiger, Animal.lion,
        Animal.goat, Animal.sheep
    }, Animal.values());
    assertArrayEquals(new Food[]{
        Food.rice, Food.bread, Food.noodle
    }, Food.values());
    
    <em class="comment">// さていよいよインタフェースを利用する。</em>
    <em class="comment">// 動物も食べ物も色がついているものを実装しているので、色がついているものとして扱える</em>
    for (Colored whiteThing : new Colored[]{
        Animal.goat, Animal.sheep, Food.rice
     }) {
      assertThat(whiteThing.getColor(), is("白"));
    }
    
    <em class="comment">// 茶色いものリストを用意して</em>
    List&lt;Colored&gt; brownThings = new ArrayList&lt;Colored&gt;();
    brownThings.addAll(collectBrown(Animal.values()));
    brownThings.addAll(collectBrown(Food.values()));
    <em class="comment">// 茶色いものを確認</em>
    assertArrayEquals(new Colored[]{
        Animal.cat, Animal.lion, Food.bread
    }, brownThings.toArray(new Colored[brownThings.size()]));
  }
  
  <em class="comment">/**
   * 茶色だけに絞って返却
   * @param Coloredな配列
   * @return 茶色なColoredのリスト
   */</em>
  private List&lt;Colored&gt; collectBrown(Colored[] coloredList) {
    List&lt;Colored&gt; result = new ArrayList&lt;Colored&gt;();
    for (Colored colored : coloredList)
      if (colored.getColor().contains("茶"))
        result.add(colored);
    return result;
  }
}

<em class="comment">// ↓ 色付けされたものを表現するインタフェース</em>
interface Colored {
  String getColor();
}

<em class="comment">// ↓ プライベートコンストラクタでごにょごにょする実装</em>
enum Animal implements Colored {
  cat("白と黒と茶"), <em class="comment">// ねこ</em>
  tiger("黄と黒"),  <em class="comment">// とら</em>
  lion("茶"),      <em class="comment">// らいおん</em>
  goat("白"),      <em class="comment">// やぎ</em>
  sheep("白"),     <em class="comment">// ひつじ</em>
  ;
  private String color;
  private Animal(String color) { this.color = color; }
  @Override public String getColor() { return this.color; }
}

<em class="comment">// ↓ 直接インタフェースを実装してしまってもいい</em>
enum Food implements Colored {
  rice   { @Override public String getColor() { return "白";    } }, <em class="comment">// こめ</em>
  bread  { @Override public String getColor() { return "白と茶"; } }, <em class="comment">// ぱん</em>
  noodle { @Override public String getColor() { return "白";    } }, <em class="comment">// めん</em>
  ;
}
</pre>
</div>

{% include goto_pagetop.html %}

* * *
## <a name="reference">参考</a>
<div class="chapter-updated">{% include update_info_inline.html created="2012-05-03" updated="2021-01-14" %}</div>
### 関連記事

- [(No Programming, No Life) Javaでenumを使ってプロパティファイルのキーを定義する](https://npnl.hatenablog.jp/entry/2012/05/03/141341)

### 参考にした記事

- [(ひしだま's 技術メモページ) Java列挙型メモ(Hishidama's Java enum Memo)](http://www.ne.jp/asahi/hishidama/home/tech/java/enum.html)
- [(しげるメモ) enum basics](https://ashigeru.hatenadiary.org/entry/20090116/1232128313)
- [(しげるメモ) enumをもうちょっと使う](https://ashigeru.hatenadiary.org/entry/20090119/1232365391)
- [(Javaと情熱のあいだ) enum(列挙型)でinterfaceを使う](http://odasusu.hatenablog.com/entry/20080216/1203168579)
- [(dTblog \| デザインとプログラムの境界をさまようブログ) 列挙型は継承ができない](http://www.deftrash.com/blog/archives/2008/02/java_enum_interface.html)
- [(mike、mikeなるままに…) AnnotationとenumとInterface](http://mikeneck.blogspot.com/2011/04/annotationenuminterface.html)

{% include goto_pagetop.html %}

{% include footnotes_link.html %}
