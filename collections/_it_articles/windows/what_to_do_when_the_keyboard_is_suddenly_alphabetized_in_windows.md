---
title: Windowsでキーボードが突然英字配列になってしまった時の対処方法
article_group_id: trouble-shooting-group
display_order: 10
created: 2022-03-04
updated: 2022-03-04
---

## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<ul id="index_ul">
<li><a href="#概要">概要</a></li>
<li><a href="#対処法">対処法</a></li>
<li><a href="#参考">参考</a></li>
</ul>

* * *
## <a name="概要">概要</a><a class="heading-anchor-permalink" href="#概要">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-03-04" updated="2022-03-04" %}</div>
- なぜか、キーボードを打っている途中で変な記号が出始める時がある。
  - 例えば`@`と打ったのに`[`が出るとか、`_`を打ってるのに文字が出ないとか。
- そんなときは`キーボードレイアウト`を変更すれば良いようです。
- ちなみに、対処法の操作手順は`Windows10`のものです。

{% include goto_pagetop.html %}

* * *
## <a name="対処法">対処法</a><a class="heading-anchor-permalink" href="#対処法">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-03-04" updated="2022-03-04" %}</div>
1. 「Windows」+「R」で［設定］（⚙マーク）を選択します。
1. ［時刻と言語］を選択します。
1. ［言語］を選択します。
1. Windowsの表示言語で「日本語」を選択します。
1. 優先する言語の下に出てくる「日本語」を選択し、「オプション」ボタンをクリックします。
1. ハードウェアキーボードレイアウトの下にある「レイアウトを変更する」ボタンをクリックします。
1. ハードウェアキーボードレイアウトの変更画面が表示されます。
  - ※たぶん、ここで「`日本語キーボード (106/109 キー)`」以外（「`英語キーボード(101/102 キー)`」とか）になってしまっているかと思いますので、
  - 「`日本語キーボード (106/109 キー)`」を選択し、「OK」をクリックします。
1. 再起動します。

以上

{% include goto_pagetop.html %}

* * *
## <a name="参考">参考</a><a class="heading-anchor-permalink" href="#参考">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-03-04" updated="2022-03-04" %}</div>
### 参考サイト
- [(INTERNET Watch) アップグレードしたらキーボードが英語入力になってしまった？](https://internet.watch.impress.co.jp/docs/column/win7faq/1196844.html)
- [(@IT) Windows 10で異なる言語のキーボード配列に誤認識される場合の対処方法](https://atmarkit.itmedia.co.jp/ait/articles/1707/21/news021.html)

{% include goto_pagetop.html %}

{% include articles_common_script.html %}
