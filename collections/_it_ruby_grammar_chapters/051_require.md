---
chapter_no: 051
chapter_id: require
chapter_title: require
chapter_group: external-library
created: 2021-03-10
updated: 2021-03-18
---
`require`は外部ファイルを読み込む関数です。標準ライブラリや自分で書いたスクリプトなどを読み込みます。  
<div class="code-box-syntax">
<div class="title">require (標準ライブラリを読み込む)</div>
<pre>
require <em>'ライブラリ名'</em>
</pre>
</div>

自分で書いたスクリプトを読み込む場合は、`./`から始め相対参照とし、拡張子の`.rb`は省略します。
<div class="code-box-syntax">
<div class="title">require (自分で書いたスクリプトを読み込む)</div>
<pre>
require <em>'./path/to/file'</em>
</pre>
</div>

- `require`と似ているものに、[load](#load)、[include](#include)、[prepend](#prepend)、[extend](#extend)があります。

### 参考
- [(Qiita) Ruby基礎 \| requireとincludeとextendの違いを確認（includeとextendはメソッド探索で確認）](https://qiita.com/suzukiry/items/db936ff7312ba7d97315)
- [(Tech Academy) Rubyの外部ファイル読み込みとrequireの使い方を現役エンジニアが解説【初心者向け】](https://techacademy.jp/magazine/21359)