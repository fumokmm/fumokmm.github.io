---
title: Javaでシングルトンを実現するならInitialize-On-Demand Holderイディオムを使うといいらしい
article_group_id: tips-group
display_order: 40
created: 2008-04-10
updated: 2008-04-10
---
当メモは2008-04-10に[投稿されたもの](https://npnl.hatenablog.jp/entry/20080410/1207837279)を加筆修正し、再掲したものです。

## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<ul id="index_ul">
<li><a href="#Initialize-On-Demand Holder">Initialize-On-Demand Holder</a></li>
<li><a href="#参考">参考</a></li>
</ul>

* * *
## <a name="Initialize-On-Demand Holder">Initialize-On-Demand Holder</a><a class="heading-anchor-permalink" href="#Initialize-On-Demand Holder">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2008-04-10" updated="2008-04-10" %}</div>
忘れないようにメモ。  

Javaでシングルトンを実現しようとする際のクラス生成イディオム。  
`double-checked locking問題`をすっぱりと解決したもので、スレッドセーフな上に高速であり、混乱も少ないのが特徴。
簡単！安全！すっきりキレイ！

<div class="code-box no-title">
<div class="copy-button">Copy</div>
<pre>
class Singleton {
    <em class="comment">/** インスタンスホルダー */</em>
    private static class Holder {
        public static final Singleton instance = new Singleton();
    };
        :
        :
        :
    <em class="comment">/** コンストラクタは封印 */</em>
    private Singleton(){};

    <em class="comment">/** 唯一のSingletonインスタンスをゲット！ */</em>
    public static Singleton getInstance() {
        return Holder.instance;
    } 
}
</pre>
</div>
要するに、`Singleton#getInstance()`呼び出し時に、プライベートインナークラスの`Holder`の`instance`に最初にアクセスしたタイミングで、`Singleton`のインスタンスが唯一生成される。  
このタイミングは排他されるんで、`synchronized`しなくてもよい。ってな具合です。

{% include goto_pagetop.html %}

* * *
## <a name="参考">参考</a><a class="heading-anchor-permalink" href="#参考">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2008-04-10" updated="2008-04-10" %}</div>
### 元記事
- [(No Programming, No Life) シングルトンにInitialize-On-Demand Holder](https://npnl.hatenablog.jp/entry/20080410/1207837279)

### 参考記事
- [(Github) IBM / japan-technology](https://github.com/IBM/japan-technology)

### 関連
- [(Wikipedia) Singleton パターン](https://ja.wikipedia.org/wiki/Singleton_%E3%83%91%E3%82%BF%E3%83%BC%E3%83%B3)

{% include goto_pagetop.html %}

{% include articles_common_script.html %}
