---
chapter_no: 1
chapter_id: basis
chapter_title: 1. 基礎
created: 2021-05-28
updated: 2021-05-28
---
### 式の途中で改行する
式の途中で改行するには`サーカムフレックス(^)`を使用します。
ちなみに[PowerShellの方]({% link _it_articles/powershell/grammar.md %}#basis)では、<code>バッククォート(`)</code>を利用していましたね。
<div class="code-box">
<div class="title">test.bat</div>
<pre>
dir <em>^</em>
  /b <em>^</em>
  /s <em>^</em>
  /a-d <em>^</em>
  c:\temp
</pre>
</div>

- 参考：[Windowsバッチファイル（.bat）、コマンドの途中で改行する](http://piyopiyocs.blog115.fc2.com/blog-entry-1008.html)
