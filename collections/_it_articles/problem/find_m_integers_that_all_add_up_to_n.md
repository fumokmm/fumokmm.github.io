---
title: 全て足してnになるm個の整数を求める
display_order: 20
created: 2021-04-20
updated: 2021-04-20
---

## <a name="index">目次</a>

<ul id="index_ul">
<li><a href="#problem">お題</a></li>
<li><a href="#by_groovy">Groovyで解いてみた</a></li>
</ul>

* * *
## <a name="problem">お題</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-04-20" updated="2021-04-20" %}</div>
<div class="code-box">
<div class="title">お題</div>
<pre>
全て足してnになるm個の整数を求める関数を作成せよ。

例: n = 2, m = 4の場合、
    結果 = [0, 0, 0, 2], [0, 0, 1, 1], [0, 0, 2, 0], [0, 1, 0, 1],
           [0, 1, 1, 0], [0, 2, 0, 0], [1, 0, 0, 1], [1, 0, 1, 0],
           [1, 1, 0, 0], [2, 0, 0, 0]
</pre>
</div>

{% include goto_pagetop.html %}

* * *
## <a name="by_groovy">Groovyで解いてみた</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-04-20" updated="2021-04-20" %}</div>
再帰呼び出しで実装してみました。副作用起こしてるのであまりきれいではないですね。

<div class="code-box">
<div class="title">find_m_integers_that_all_add_up_to_n.groovy</div>
<pre>
void find(result, list, n, m) {
    def makeTmpList = { def l = []; l.addAll(list); l }
    def remain = { n - (list.sum() ?: 0) }

    // サイズがmになったら結果をそのまま返却
    if (list.size() == m) {
        result << makeTmpList()
        return
    }
    // サイズがm-1になったら、nになるように調整して返却
    if (list.size() == m - 1) {
        def tmpList = makeTmpList()
        tmpList << remain()
        find(result, tmpList, n, m)
        return
    }
    // サイズがm-2以下の場合、0～n(ただし、最大nを超えないよう考慮)を選択して再起呼び出し
    if (list.size() <= m - 2) {
        for (i in 0..remain()) {
            def tmpList = makeTmpList()
            tmpList << i
            find(result, tmpList, n, m)
        }
        return
    }

    // それ以外はエラー
    throw new Exception("listのサイズが大きすぎます: ${list.size()}")
}

def result = []
find(result, [], 2, 4)
assert result == [[0, 0, 0, 2], [0, 0, 1, 1], [0, 0, 2, 0], [0, 1, 0, 1], [0, 1, 1, 0], [0, 2, 0, 0], [1, 0, 0, 1], [1, 0, 1, 0], [1, 1, 0, 0], [2, 0, 0, 0]]
</pre>
</div>

{% include goto_pagetop.html %}

{% include footnotes_link.html %}
