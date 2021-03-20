---
chapter_no: 051
chapter_id: require
chapter_title: require
chapter_group: external-library
created: 2021-03-10
updated: 2021-03-19
---
`require`は外部ファイルを読み込む関数です。標準ライブラリや自分で書いたスクリプトなどを読み込みます。  
[load](#load)とほぼ同じ機能を提供しますが、`require`は*一度読み込まれたスクリプトは再読み込みしない*点が異なっています。

<div class="code-box-syntax">
<div class="title">require (標準ライブラリを読み込む)</div>
<pre>
require <em>'ライブラリ名'</em>
</pre>
</div>

自分で書いたスクリプトを読み込む場合は、`./`から始め相対参照とし、*拡張子の`.rb`は省略します*(書いてもOKです)。
<div class="code-box-syntax">
<div class="title">require (自分で書いたスクリプトを読み込む)</div>
<pre>
require <em>'./path/to/file'</em>
</pre>
</div>

### 関連項目
- [load](#load)
- [include](#include)
- [prepend](#prepend)
- [extend](#extend)

### 参考
- [(Qiita) Ruby基礎 \| requireとincludeとextendの違いを確認（includeとextendはメソッド探索で確認）](https://qiita.com/suzukiry/items/db936ff7312ba7d97315)
- [(Tech Academy) Rubyの外部ファイル読み込みとrequireの使い方を現役エンジニアが解説【初心者向け】](https://techacademy.jp/magazine/21359)