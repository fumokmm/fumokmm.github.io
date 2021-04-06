---
chapter_no: 001
chapter_id: update-data-with-information-from-other-tables
chapter_title: 他テーブルの情報でデータを更新する
created: 2021-04-06
updated: 2021-04-06
---
<div class="code-box">
<div class="title">他テーブルの情報でデータを更新するSQL</div>
<pre>
UPDATE
  <em>&lt;更新したいテーブル&gt;</em>
SET
  aaa = <em class="blue">a</em>.xxx
  bbb = <em class="blue">a</em>.yyy
  ccc = <em class="blue">a</em>.zzz
FROM
  <em class="blue">&lt;他テーブル&gt; a</em>
WHERE
    <em>&lt;更新したいテーブル&gt;</em>.id1 = <em class="blue">a</em>.id1
AND <em>&lt;更新したいテーブル&gt;</em>.id2 = <em class="blue">a</em>.id2
AND <em>&lt;更新したいテーブル&gt;</em>.id3 = <em class="blue">a</em>.id3
</pre>
</div>
- `<他テーブル>`は別名指定(上記例では`a`)できるのですが、`<更新したいテーブル>`は別名指定できないようなので、フルでテーブル名を指定します。
