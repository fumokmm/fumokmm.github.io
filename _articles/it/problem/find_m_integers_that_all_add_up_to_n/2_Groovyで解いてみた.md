---
chapter_no: 2
chapter_title: Groovyで解いてみた
created: 2021-04-20
updated: 2021-04-20
---
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
