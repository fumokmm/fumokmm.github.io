---
title: Javaでenumを使ってシングルトンを素早く実装する
article_group_id: tips-group
display_order: 50
created: 2018-06-18
updated: 2022-11-06
---
当メモは2018-06-18に[投稿されたもの](https://qiita.com/fumokmm/items/904ea4d0cf4d018a60f2)を加筆修正し、再掲したものです。

## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<ul id="index_ul">
<li><a href="#概要">概要</a></li>
<li><a href="#実装例">実装例</a></li>
<li><a href="#利用例">利用例</a></li>
<li><a href="#参考">参考</a></li>
</ul>

* * *
## <a name="概要">概要</a><a class="heading-anchor-permalink" href="#概要">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2018-06-18" updated="2022-11-06" %}</div>
昔は[Initialize-On-Demand Holder]({% link _it_articles/java/initialize_on_demand_holder.md %})とかを使っていましたが、  
最近は`enum`でサクっとシングルトンは作ってしまっています。  
以下に文字列ユーティリティクラスの例を載せておきます。

{% include goto_pagetop.html %}

* * *
## <a name="実装例">実装例</a><a class="heading-anchor-permalink" href="#実装例">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2018-06-18" updated="2018-06-18" %}</div>
基本的には、唯一の要素である`INSTANCE`を持つような`enum`を作成して、あとは`public`メソッドを普通に作成していくだけです。  
簡単だし楽ですね。

<div class="code-box">
<div class="title">StringUtility.java</div>
<div class="copy-button">Copy</div>
<pre>
package jp.fumokmm;

import java.util.Objects;

public <em>enum StringUtility</em> {
    <em class="blue">INSTANCE;</em>

    /**
     * &lt;p&gt;指定の文字列をトリムします。
     * 指定の文字列がnullの場合は空文字が返却されます。&lt;/p&gt;
     * @param str トリムする文字列
     * @return トリム後の文字列
     */
    public String trim(String str) {
        return Objects.nonNull(str) ? str.trim() : "";
    }

    /**
     * &lt;p&gt;指定の文字列をトリム（全角スペース含む）します。
     * 指定の文字列がnullの場合は空文字が返却されます。&lt;/p&gt;
     * @param str トリムする文字列
     * @return トリム後の文字列
     */
    public String trimFull(String str) {
        if (Objects.isNull(str)) return "";
        int len = str.length();
        int st = 0;
        char[] val = str.toCharArray();
        while (st &lt; len &amp;&amp; (val[st] &lt;= ' ' || val[st] == '　')) {
            st++;
        }
        while (st &lt; len &amp;&amp; (val[len - 1] &lt;= ' ' || val[len - 1] == '　')) {
            len--;
        }
        return (st &gt; 0 || len &lt; str.length()) ? str.substring(st, len) : str;
    }

}
</pre>
</div>

{% include goto_pagetop.html %}

* * *
## <a name="利用例">利用例</a><a class="heading-anchor-permalink" href="#利用例">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2018-06-18" updated="2018-06-18" %}</div>
<div class="code-box">
<div class="title">StringUtilityTest.java</div>
<div class="copy-button">Copy</div>
<pre>
package jp.fumokmm;

import static org.hamcrest.CoreMatchers.*;
import static org.junit.Assert.*;

import org.junit.Test;

public class StringUtilityTest {

    @Test
    public void testTrim() {
        <em>StringUtility util = StringUtility.</em><em class="blue">INSTANCE</em><em>;</em>
        assertThat(util.trim(null), is(""));
        assertThat(util.trim(" "), is(""));
        assertThat(util.trim(" a "), is("a"));
        assertThat("全角スペース入りはトリムされない", util.trim("　 a 　"), is("　 a 　"));
    }

    @Test
    public void testTrimFull() {
        <em>StringUtility util = StringUtility.</em><em class="blue">INSTANCE</em><em>;</em>
        assertThat(util.trimFull(null), is(""));
        assertThat(util.trimFull(" "), is(""));
        assertThat(util.trimFull(" a "), is("a"));
        assertThat("全角スペース入りもトリムされる", util.trimFull("　 a 　"), is("a"));
    }

}
</pre>
</div>

### ちなみ
ちなみに上記テストでは、
<div class="code-box no-title">
<div class="copy-button">Copy</div>
<pre>
StringUtility util = StringUtility.INSTANCE;
</pre>
</div>
のように一度変数に代入してから使っていますが
<div class="code-box no-title">
<div class="copy-button">Copy</div>
<pre>
StringUtility.INSTANCE.trim(str);
</pre>
</div>
のようにそのまま使うも良しです。  
可読性を見極めてご利用下さい。

{% include goto_pagetop.html %}

* * *
## <a name="参考">参考</a><a class="heading-anchor-permalink" href="#参考">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2018-06-18" updated="2022-11-06" %}</div>
### 元記事
- [(Qiita) Javaでenumを使ってシングルトンを素早く実装する](https://qiita.com/fumokmm/items/904ea4d0cf4d018a60f2)

### 関連メモ
- [Javaでシングルトンを実現するならInitialize-On-Demand Holderイディオムを使うといいらしい]({% link _it_articles/java/initialize_on_demand_holder.md %})

{% include goto_pagetop.html %}

{% include articles_common_script.html %}
