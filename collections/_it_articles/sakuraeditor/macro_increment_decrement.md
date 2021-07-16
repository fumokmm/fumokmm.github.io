---
title: サクラエディタのマクロで数値のインクリメントとデクリメントを行う
article_group_id: macro-group
display_order: 10
created: 2021-07-16
updated: 2021-07-16
---
ニッチ過ぎて誰向けか分からないですが。
## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<ul id="index_ul">
<li><a href="#インクリメント">インクリメント</a></li>
<li><a href="#デクリメント">デクリメント</a></li>
<li><a href="#デモ">デモ</a></li>
<li><a href="#参考">参考</a></li>
</ul>

* * *
## <a name="インクリメント">インクリメント</a><a class="heading-anchor-permalink" href="#インクリメント">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-07-16" updated="2021-07-16" %}</div>
### ソース
<div class="code-box">
<div class="title">numIncrement.js</div>
<pre>
var e = Editor;
var selectedString = e.GetSelectedString(0);
<em class="comment">// 選択状態なら</em>
if (e.IsTextSelected() == 1) {
  var num = Number(selectedString);
  num++;
  e.Delete();
  e.InsText(num);
  <em class="comment">// 選択範囲の復元</em>
  e.Left();
  e.SelectWord();
}
</pre>
</div>

### 設定方法
- [メニュー] -> [設定] -> [共通設定]
  - [マクロ]タブ
    - `このマクロ`を登録
  - [キー割り当て]
    - 種別で「外部マクロ」を選択し、`このマクロ`を選択
      - 好きなキー割り当てを登録(例: `Shift+Ctrl+[`)

{% include goto_pagetop.html %}

* * *
## <a name="デクリメント">デクリメント</a><a class="heading-anchor-permalink" href="#デクリメント">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-07-16" updated="2021-07-16" %}</div>
### ソース
<div class="code-box">
<div class="title">numDecrement.js</div>
<pre>
var e = Editor;
var selectedString = e.GetSelectedString(0);
<em class="comment">// 選択状態なら</em>
if (e.IsTextSelected() == 1) {
  var num = Number(selectedString);
  num--;
  e.Delete();
  e.InsText(num);
  <em class="comment">// 選択範囲の復元</em>
  e.Left();
  e.SelectWord();
}
</pre>
</div>

### 設定方法
- [メニュー] -> [設定] -> [共通設定]
  - [マクロ]タブ
    - `このマクロ`を登録
  - [キー割り当て]
    - 種別で「外部マクロ」を選択し、`このマクロ`を選択
      - 好きなキー割り当てを登録(例: `Shift+Ctrl+]`)

{% include goto_pagetop.html %}

* * *
## <a name="デモ">デモ</a><a class="heading-anchor-permalink" href="#デモ">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-07-16" updated="2021-07-16" %}</div>
<p class="center" markdown="span">
![](https://cdn-ak.f.st-hatena.com/images/fotolife/f/fumokmm/20210716/20210716113407.gif)
</p>

### 説明
- 数値部分を範囲選択した状態で実行してください。
- キー割り当てしておけば連続実行もできます。

### 制約事項
- 整数のみ対応しています(小数点は未対応)。
- デクリメントして数値がマイナスまで行った場合、再選択するところでマイナスが選択から抜けてしまいます。
- 数値以外を選択した場合うまく動きません(エラー処理してません)。

{% include goto_pagetop.html %}

* * *
## <a name="参考">参考</a><a class="heading-anchor-permalink" href="#参考">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-07-16" updated="2021-07-16" %}</div>
### 参照
- [(サクラエディタ) マクロ専用関数/変数](https://sakura-editor.github.io/help/HLP000268.html)

### ソース
- [language-examples](https://github.com/fumokmm/language-examples/tree/main/SakuraEditorMacro)

{% include goto_pagetop.html %}

{% include footnotes_link.html %}
