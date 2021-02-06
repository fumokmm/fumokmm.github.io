---
chapter_no: 006
chapter_id: test-source
chapter_title: テストを書いた
created: 2012-05-03
updated: 2021-01-14
---
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
