---
chapter_no: 52
chapter_group: 外部ライブラリの読み込み
chapter_title: load
created: 2021-03-18
updated: 2021-03-19
---
`load`は外部ファイルを読み込む関数です。標準ライブラリや自分で書いたスクリプトなどを読み込みます。  
[require](#require)とほぼ同じ機能を提供しますが、`load`は*スクリプトを再読み込みする*点と、*拡張子の`.rb`が省略できない*ところが異なっています。  
ずっと動かしているプログラムなどで、参照しているスクリプトだけ差し替えて動作させる場合などは、`load`を使うのだと思います。

<div class="code-box-syntax">
<div class="title">load (標準ライブラリを再読み込み)</div>
<pre>
load <em>'ライブラリ名</em><em class="blue">.rb</em><em>'</em>
</pre>
</div>

自分で書いたスクリプトを読み込む場合は、`./`から始め相対参照とします。  
<div class="code-box-syntax">
<div class="title">load (自分で書いたスクリプトを再読み込み)</div>
<pre>
load <em>'./path/to/file</em><em class="blue">.rb</em><em>'</em>
</pre>
</div>

### 関連項目
- [require](#require)
- [include](#include)
- [prepend](#prepend)
- [extend](#extend)
