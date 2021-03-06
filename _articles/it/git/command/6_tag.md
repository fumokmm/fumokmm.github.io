---
chapter_no: 6
chapter_id: tag
chapter_title: タグ(tag)
created: 2010-11-07
updated: 2021-03-08
---
<div class="code-box">
<div class="title">タグを表示する</div>
<pre>
$ git <em class="blue">tag</em>
</pre>
</div>

<div class="code-box">
<div class="title">タグを付ける</div>
<pre>
$ git <em class="blue">tag</em> <em>&lt;タグ名&gt;</em>
</pre>
</div>
- 現在のブランチのHEADにタグが付けられる。

<div class="code-box">
<div class="title">別の時点のコミットにタグを付ける</div>
<pre>
$ git <em class="blue">tag</em> <em>&lt;タグ名&gt; &lt;コミット名&gt;</em>
</pre>
</div>

<div class="code-box">
<div class="title">タグを削除する</div>
<pre>
$ git <em class="blue">tag</em> <em class="command">-d</em> <em>&lt;タグ名&gt;</em>
</pre>
</div>

<div class="code-box">
<div class="title">タグをoriginにpushする</div>
<pre>
$ git <em class="blue">push origin</em> <em>&lt;タグ名&gt;</em>
</pre>
</div>

<div class="code-box">
<div class="title">タグをoriginにpushする(強制上書き)</div>
<pre>
$ git <em class="blue">push origin</em> <em>&lt;タグ名&gt;</em> <em class="command">-f</em>
</pre>
</div>
- タグはブランチをpushしただけでは、originにpushされない([参照](https://qiita.com/aki_55p/items/530754ac6e861122f29b))ので、個別にpushする必要があります。

<div class="code-box">
<div class="title">originのタグを削除する</div>
<pre>
$ git <em class="blue">push</em> <em class="blue">origin</em> <em>:&lt;タグ名&gt;</em>
または
$ git <em class="blue">push</em> <em class="command">--delete</em> <em class="blue">origin</em> <em>&lt;タグ名&gt;</em>
</pre>
</div>
- (参考) [(Stack Overflow) How to delete a remote tag?](https://stackoverflow.com/questions/5480258/how-to-delete-a-remote-tag)
- 1つ目の指定方法は、`<タグ名>`の前にコロン(`:`)が必要
  - これは、`<ローカルのタグ名>:<リモートのタグ名>`を表す形式の、ローカルのタグ名が省略されているパターンです。
  - ローカルのタグを失くして、その状態をpushするところをイメージすると分かりやすいかもしれません。
