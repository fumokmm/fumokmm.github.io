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

まだまだ紹介しきれないので、ちょこちょこ追加していく予定です