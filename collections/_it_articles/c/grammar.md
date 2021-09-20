---
title: C言語の文法
article_group_id: basis-group
display_order: 10
created: 2021-09-20
updated: 2021-09-20
---

## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<div style="column-count: 2;">
    <ul id="index_ul">
        <li><a href="#基礎文法">基礎文法</a>
            <ul>
                <li><a href="#エスケープシーケンス文字">エスケープシーケンス文字</a></li>
            </ul>
        </li>
        <li><a href="#参照・参考">参照・参考</a>
            <ul>
                <li><a href="#参考">参考</a></li>
            </ul>
        </li>
    </ul>
</div>

## <a name="基礎文法">基礎文法</a><a class="heading-anchor-permalink" href="#基礎文法">§</a>
* * *
## <a name="エスケープシーケンス文字">エスケープシーケンス文字</a><a class="heading-anchor-permalink" href="#エスケープシーケンス文字">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-09-20" updated="2021-09-20" %}</div>
<table class="normal">
	<tr>
		<th markdown="span">文字</th>
		<th markdown="span">コード</th>
		<th markdown="span">略号</th>
		<th markdown="span">機能</th>
	</tr>
	<tr>
		<td markdown="span">\a</td>
		<td markdown="span">07</td>
		<td markdown="span">BEL</td>
		<td markdown="span">内臓ベルを鳴らす</td>
	</tr>
	<tr>
		<td markdown="span">\b</td>
		<td markdown="span">08</td>
		<td markdown="span">BS</td>
		<td markdown="span">バックスペース</td>
	</tr>
	<tr>
		<td markdown="span">\f</td>
		<td markdown="span">0C</td>
		<td markdown="span">FF</td>
		<td markdown="span">改ページ</td>
	</tr>
	<tr>
		<td markdown="span">\n</td>
		<td markdown="span">0A</td>
		<td markdown="span">LF</td>
		<td markdown="span">改行</td>
	</tr>
	<tr>
		<td markdown="span">\r</td>
		<td markdown="span">0D</td>
		<td markdown="span">CR</td>
		<td markdown="span">復帰(同じ行の先頭に戻る)</td>
	</tr>
	<tr>
		<td markdown="span">\t</td>
		<td markdown="span">09</td>
		<td markdown="span">HT</td>
		<td markdown="span">水平タブ</td>
	</tr>
	<tr>
		<td markdown="span">\v</td>
		<td markdown="span">0B</td>
		<td markdown="span">VT</td>
		<td markdown="span">垂直タブ</td>
	</tr>
	<tr>
		<td markdown="span">\0</td>
		<td markdown="span">00</td>
		<td markdown="span">NULL</td>
		<td markdown="span">ヌル文字</td>
	</tr>
	<tr>
		<td markdown="span">\\</td>
		<td markdown="span">5C</td>
		<td markdown="span"></td>
		<td markdown="span">\を表示</td>
	</tr>
	<tr>
		<td markdown="span">\'</td>
		<td markdown="span">27</td>
		<td markdown="span"></td>
		<td markdown="span">シングルクォーテーション(')を表示</td>
	</tr>
	<tr>
		<td markdown="span">\"</td>
		<td markdown="span">22</td>
		<td markdown="span"></td>
		<td markdown="span">ダブルクォーテーション(")を表示</td>
	</tr>
	<tr>
		<td markdown="span">\?</td>
		<td markdown="span">3F</td>
		<td markdown="span"></td>
		<td markdown="span">?</td>
	</tr>
	<tr>
		<td markdown="span">\ooo</td>
		<td markdown="span"></td>
		<td markdown="span"></td>
		<td markdown="span">8進定数(oooは8進数の定数)</td>
	</tr>
	<tr>
		<td markdown="span">\xhh</td>
		<td markdown="span"></td>
		<td markdown="span"></td>
		<td markdown="span">16進定数(hhは16進数の定数)</td>
	</tr>
</table>

### 参考サイト
- [(電脳産物) C初級：エスケープシーケンス文字](http://wisdom.sakura.ne.jp/programming/c/Cdata1.html)
- [(覚え書き.com) C言語：エスケープシーケンス一覧](http://write-remember.com/program/c/escape/)
- [(若葉プログラミング塾) ASCIIコード表](https://www.k-cube.co.jp/wakaba/server/ascii_code.html)

{% include goto_pagetop.html %}

## <a name="参照・参考">参照・参考</a><a class="heading-anchor-permalink" href="#参照・参考">§</a>
* * *
## <a name="参考">参考</a><a class="heading-anchor-permalink" href="#参考">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-09-20" updated="2021-09-20" %}</div>
### 参考サイト
- [(電脳産物) C初級：エスケープシーケンス文字](http://wisdom.sakura.ne.jp/programming/c/Cdata1.html)
- [(覚え書き.com) C言語：エスケープシーケンス一覧](http://write-remember.com/program/c/escape/)
- [(若葉プログラミング塾) ASCIIコード表](https://www.k-cube.co.jp/wakaba/server/ascii_code.html)

{% include goto_pagetop.html %}

{% include footnotes_link.html %}
