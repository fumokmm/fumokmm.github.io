---
title: Windows Batchの文法
display_order: 10
created: 2021-03-29
updated: 2021-03-29
---

## <a name="index">目次</a>

<ul id="index_ul">
<li><a href="#delayed-expansion">遅延環境変数</a></li>
<li><a href="#reference">参考</a></li>
</ul>

* * *
## <a name="delayed-expansion">遅延環境変数</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-03-29" updated="2021-03-29" %}</div>
Windowsバッチは、通常変数は`%記号`で囲みますが、この%で囲った変数は、その変数がある行に*入った瞬間*にすべて展開されます。
遅延環境変数は、そうならないように変数を読み込むタイミングを遅らせる変数のことです。  

### 宣言
<div class="code-box-syntax">
<div class="title">宣言</div>
<pre>
@echo off
<em>setlocal enabledelayedexpansion</em>
</pre>
</div>

### 使う時
変数を囲む`%記号`を`!記号`に変えるだけです。
<div class="code-box">
<div class="title">% を !に変えるだけ</div>
<pre>
@echo off
setlocal enabledelayedexpansion

set num=1
if %num% == 1 (
    set /a num+=1
    echo <em>!num!</em>
)
pause
</pre>
</div>

### 参考
- [(Qiita) バッチファイル界の魔境『遅延環境変数』に挑む（おまけもあるよ）](https://qiita.com/plcherrim/items/c7c477cacf8c97792e17)

{% include goto_pagetop.html %}

* * *
## <a name="reference">参考</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-03-29" updated="2021-03-29" %}</div>
- [(Qiita) バッチファイル界の魔境『遅延環境変数』に挑む（おまけもあるよ）](https://qiita.com/plcherrim/items/c7c477cacf8c97792e17)

{% include goto_pagetop.html %}

{% include footnotes_link.html %}
