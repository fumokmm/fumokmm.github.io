---
chapter_no: 50
chapter_id: class
chapter_title: 4. クラス
created: 2010-06-05
updated: 2021-04-08
---
### 暗黙的インポート
Groovyでは以下のパッケージが暗黙的にインポート済みです。
<div class="code-box">
<div class="title">暗黙的インポート</div>
<pre>
java.io.*
java.lang.*
java.math.BigDecimal
java.math.BigInteger
java.net.*
java.util.*
groovy.lang.*
groovy.util.*
</pre>
</div>

### クラス宣言
<div class="code-box">
<div class="title">クラス</div>
<pre>
class Book {    <em class="comment">// クラスを宣言</em>
  String title  <em class="comment">// 型を明示的に指定してフィールドを宣言</em>
  def prop      <em class="comment">// defキーワードでフィールド宣言</em>
  Book() {      <em class="comment">// コンストラクタ</em>
    <em class="comment">// ...</em>
  }
  int methodA(int p) { <em class="comment">// 型を明示的に指定してメソッドを宣言</em>
    <em class="comment">// ...</em>
  }
  void methodB(String p) { <em class="comment">// 戻り値なしメソッド</em>
    <em class="comment">// ...</em>
  }
  def methodC(p) { <em class="comment">// defを使ってメソッドを宣言</em>
    <em class="comment">// ...</em>
  }
  static def methodS() { <em class="comment">// 静的メソッドを宣言</em>
    <em class="comment">// ...</em>
  }
}
</pre>
</div>

### GroovyBean
GroovyではJavaよりも簡単にbeanを扱えます。

<div class="code-box">
<div class="title">GroovyBean</div>
<pre>
class Book {
  String title  <em class="comment">// プロパティの宣言</em>
}
def groovyBook = new Book()

<em class="comment">// 明示的なメソッド呼び出しによるプロパティの利用</em>
groovyBook.setTitle('Groovy world')
assert groovyBook.getTitle() == 'Groovy world'

<em class="comment">// Groovyによるショートカットを使ったプロパティの利用</em>
groovyBook.title = 'No Groovy, No Life'
assert groovyBook.title == 'No Groovy, No Life'
</pre>
</div>

まだまだ紹介しきれないので、ちょこちょこ追加していく予定です。

{% comment %}
<!--
**5. GDK (([GinA] P235))
GroovyではGDKと呼ばれる、Javaクラスに対しての独自拡張を行っています。GDKを利用することでJavaクラスをより便利に利用することができます。

***java.lang.Objectに対して追加されたメソッド
>|groovy|
Boolean any { closure }
||<

**6.ビルダー (([GinA] P194))
**AntBuilder (([GinA] P205, P400))
**CliBuilder (([GinA] P416))
**SwingBuilder (([GinA] P209))
**MarkupBuilder (([GinA] P202))
-->

**おすすめリンク
[http://groovy.codehaus.org/groovy-jdk/:title:bookmark] Groovy JDK

**参考書籍 [GinA]
ISBN:4839927278:detail

**参考サイト
[http://www.okisoft.co.jp/esc/groovy/index.html:title:bookmark]
[http://d.hatena.ne.jp/uehaj/:title:bookmark]

**関連記事
[http://d.hatena.ne.jp/fumokmm/20081224/1230124652:title:bookmark]
[http://d.hatena.ne.jp/fumokmm/20100518/1274196024:title:bookmark]
[http://d.hatena.ne.jp/fumokmm/20080830/1220063759:title:bookmark]

**関連リンク
[http://groovy.codehaus.org/:title:bookmark] (本家)
[http://groovy.codehaus.org/Japanese+Home:title:bookmark] (本家の日本語版)
[http://en.wikipedia.org/wiki/Groovy_%28programming_language%29:title:bookmark]
[http://ja.wikipedia.org/wiki/Groovy:title:bookmark]
[http://groovy.codehaus.org/The+groovydoc+Ant+task:title:bookmark]

**更新履歴
- 2011-07-22 「doはない」の注釈に[http://d.hatena.ne.jp/fumokmm/20110630/1309446463:title:bookmark]を追加。
-->
{% endcomment %}
