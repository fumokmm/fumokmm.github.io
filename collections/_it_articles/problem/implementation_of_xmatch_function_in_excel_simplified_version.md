---
title: "[お題] ExcelのXMATCH関数(簡易版)の実装"
display_order: 80
created: 2022-09-01
updated: 2022-09-01
---

## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<ul id="index_ul">
<li><a href="#お題">お題</a></li>
<li><a href="#参考">参考</a></li>
</ul>

* * *
## <a name="お題">お題</a><a class="heading-anchor-permalink" href="#お題">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-09-01" updated="2022-09-01" %}</div>
<div class="code-box">
<div class="title">お題</div>
<pre>
ExcelのXMATCH関数を実装してください。

形式:
XMATCH(検索値, 検索範囲, 一致モード)
  - 検索値に検索する文字列が入ります
  - 検索範囲に検索される文字列の配列やリストが入ります(長さ1以上)
    空配列やnull(空を明示的に表すもの)だった場合は"#VALUE!"という文字列を返却します
  - 一致モードは整数で0だったら完全一致
                    -1だったら完全一致または次に小さい項目(辞書順)
                    1だったら完全一致または次に大きい項目(辞書順)
    を検索します
    0,-1,1以外が指定されたら"#VALUE!"という文字列を返却します
  - 上記3つの引数省略は不可とします(必ず3つ指定する)
  - 上記で検索して、値が見つかった場合、検索範囲を1オリジンとした場合のインデックスを返却します
  - 上記で検索して、値がみつからなかった場合、"#N/A"という文字列を返却します

※簡易版のため、以下仕様を省略しています。また一部Excelと異なる部分はエラー処理を拡張しています。
省略する仕様:
  - 検索値、検索範囲の型は文字列のみに限定(それ以外の型は省略)
　- ワイルドカードでの検索
  - 検索報告の指定、バイナリ検索
エラー処理拡張:
  - 検索範囲の長さが0の場合やnull(空を明示的に表すもの)の場合、"#VALUE!"を返却
    ※Excelでは空の範囲をそもそも指定できないので
</pre>
</div>
### 動作イメージ
<div class="code-box no-title">
<pre>
XMATCH("b", ["a", "b", "e", "f", "c"], 0) <em class="comment">=&gt; 2</em>
XMATCH("d", ["a", "b", "e", "f", "c"], 0) <em class="comment">=&gt; "#N/A"</em>
XMATCH("d", ["a", "b", "e", "f", "c"], -1) <em class="comment">=&gt; 5 # dを探すがdがないので、この中にある内でdの次に小さい項目(=c)のインデックスが返る</em>
XMATCH("d", ["a", "b", "g", "f", "c"], 1) <em class="comment">=&gt; 4 # dを探すがdがないので、この中にある内でdの次に大きな項目(=f)のインデックスが返る</em>
</pre>
</div>

{% include goto_pagetop.html %}

* * *
## <a name="参考">参考</a><a class="heading-anchor-permalink" href="#参考">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-09-01" updated="2022-09-01" %}</div>
### 関連メモ
- [ExcelのXMATCH関数]({% link _it_articles/excel/formula_xmatch.md %})

### 参考
- [XMATCH関数](https://support.microsoft.com/ja-jp/office/xmatch-%E9%96%A2%E6%95%B0-d966da31-7a6b-4a13-a1c6-5a33ed6a0312)

{% include goto_pagetop.html %}

{% include footnotes_link.html %}
