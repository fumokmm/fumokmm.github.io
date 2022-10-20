---
title: Kotlinでクラスパス上にあるプロパティファイルを読み込む
article_group_id: howto-group
display_order: 20
created: 2019-12-04
updated: 2021-07-13
---
当メモは2019-12-04に[投稿されたもの](https://npnl.hatenablog.jp/entry/2019/12/04/085229)を加筆修正し、再掲したものです。

## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<ul id="index_ul">
<li><a href="#クラスパス上にあるプロパティファイルを読み込むには・・・？">クラスパス上にあるプロパティファイルを読み込むには・・・？</a></li>
<li><a href="#参考">参考</a></li>
</ul>

* * *
## <a name="クラスパス上にあるプロパティファイルを読み込むには・・・？">クラスパス上にあるプロパティファイルを読み込むには・・・？</a><a class="heading-anchor-permalink" href="#クラスパス上にあるプロパティファイルを読み込むには・・・？">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2019-12-04" updated="2021-07-13" %}</div>
Javaだとクラスパス上にあるリソースを読み込むにはJavaクラスクラス(`Class<?>`のクラス)の利用するが`Kotlin`だとどうするのかな？と思って調べたものです。  
Javaクラスクラスを参照するには、`this.javaClass`とすればいいらしいです。  
クラスローダーも`.classLoader`でいいみたいです。  
以下は簡単なクラスパスの通ったディレクトリに置かれたプロパティファイルを読み取るサンプルです。

<div class="code-box">
<div class="title">Main.kt</div>
<div class="copy-button">Copy</div>
<pre>
import java.io.File
import java.io.InputStreamReader
import java.net.URL
import java.util.*

class PropertiesReadSample1 {
    fun readProperty() {
        val prop = Properties()
        val resource: URL? = <em>this.javaClass</em><em class="blue">.classLoader</em>.getResource("sample.properties")
        InputStreamReader(resource?.openStream(), "UTF-8").use { inStream -&gt;
            prop.load(inStream)
            println("ooo's value is ${prop.getProperty("aaa")}")
            println("bbb's value is ${prop.getProperty("bbb")}")
            println("ううう's value is ${prop.getProperty("ううう")}")
        }
    }
}

fun main(args: Array&lt;String&gt;) {
    PropertiesReadSample1().readProperty()
}
</pre>
</div>

<div class="code-box">
<div class="title">sample.properties [UTF-8] (クラスパスの通ったディレクトリに置くこと)</div>
<div class="copy-button">Copy</div>
<pre>
aaa=100
bbb=200
ううう=300
</pre>
</div>

<div class="code-box-output">
<div class="title">出力結果</div>
<div class="copy-button">Copy</div>
<pre>
ooo's value is 100
bbb's value is 200
ううう's value is 300
</pre>
</div>

ちょっと脇道に逸れるけど、[Propertiesファイルってnative2asciiしなくても大丈夫になってた](http://www.ne.jp/asahi/hishidama/home/tech/java/resource.html)のね。

{% include goto_pagetop.html %}

* * *
## <a name="参考">参考</a><a class="heading-anchor-permalink" href="#参考">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2019-12-04" updated="2021-07-13" %}</div>
### 元記事
- [(No Programming, No Life) Kotlinでクラスパス上にあるプロパティファイルを読み込む](https://npnl.hatenablog.jp/entry/2019/12/04/085229)

### 参考
- [(Qiita) Kotlinでクラスオブジェクトを参照する(Javaのクラス名.classの代わり)](https://qiita.com/sekitaka_1214/items/5d0765d314c70d1c70b6)
- [(SWEng TIPs) \[Java\] getResourceAsStreamの使い方](http://sweng.web.fc2.com/ja/program/java/how-to-use-getresourceasstream.html)
- [Javaリソース・プロパティーメモ(Hishidama's Java resource/property Memo)](http://www.ne.jp/asahi/hishidama/home/tech/java/resource.html)
- [(yanok.net) Java 9 でようやくResourceBundle のデフォルト文字コードが UTF-8に](http://yanok.net/2017/07/java-9-resourcebundle-utf-8.html)

{% include goto_pagetop.html %}

{% include articles_common_script.html %}
