---
title: Pythonでファイルをコピーする
article_group_id: reverse-lookup-group
display_order: 35
created: 2021-11-29
updated: 2021-11-29
---

## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<ul id="index_ul">
<li><a href="#概要">概要</a></li>
<li><a href="#shutil.copy()">shutil.copy()</a></li>
<li><a href="#shutil.copy2()">shutil.copy2()</a></li>
<li><a href="#参考">参考</a></li>
</ul>

* * *
## <a name="概要">概要</a><a class="heading-anchor-permalink" href="#概要">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-11-29" updated="2021-11-29" %}</div>
Pythonでファイルをコピーするには、`shutil`の`shutil.copy()`や`shutil.copy2()`を利用します。  

<table class="normal">
	<tr>
		<th markdown="span">方法</th>
		<th markdown="span">説明</th>
	</tr>
	<tr>
		<td markdown="span">`shutil.copy()`</td>
		<td markdown="span">パーミッション情報も含めてコピーできます。</td>
	</tr>
	<tr>
		<td markdown="span">`shutil.copy2()`</td>
		<td markdown="span">パーミッションに加え、メタ情報(作成日や変更日)もコピーされます。</td>
	</tr>
</table>

{% include goto_pagetop.html %}

* * *
## <a name="shutil.copy()">shutil.copy()</a><a class="heading-anchor-permalink" href="#shutil.copy()">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-11-29" updated="2021-11-29" %}</div>
<div class="code-box no-title">
<div class="copy-button">Copy</div>
<pre>
import shutil
import pathlib

from_path = pathlib.Path(<em class="blue">&lt;コピー元ファイルパス&gt;</em>)
to_path = pathlib.Path(<em class="blue">&lt;コピー先ファイルパス&gt;</em>)
shutil.<em>copy</em>(<em class="blue">from_path</em>, <em class="blue">to_path</em>)
</pre>
</div>
- コピー先にディレクトリが指定された場合、コピー先ディレクトリに、元のファイル名でコピーされます。
- コピー先にファイル名が指定された場合、そのファイル名でコピーされます。
- コピー先のディレクトリがない場合、例外が発生します。[^mkdir]

[^mkdir]: [Pythonでフォルダを作成する]({% link _it_articles/python/make_directory.md %})を参照。

{% include goto_pagetop.html %}

* * *
## <a name="shutil.copy2()">shutil.copy2()</a><a class="heading-anchor-permalink" href="#shutil.copy2()">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-11-29" updated="2021-11-29" %}</div>
- パーミッションに加え、メタ情報(作成日や変更日)もコピーしたい場合には`copy2`を利用します。
- 使い方などは[copy()](#shutil.copy())と一緒です。
<div class="code-box no-title">
<div class="copy-button">Copy</div>
<pre>
import shutil
import pathlib

from_path = pathlib.Path(<em class="blue">&lt;コピー元ファイルパス&gt;</em>)
to_path = pathlib.Path(<em class="blue">&lt;コピー先ファイルパス&gt;</em>)
shutil.<em>copy2</em>(<em class="blue">from_path</em>, <em class="blue">to_path</em>)
</pre>
</div>

{% include goto_pagetop.html %}

* * *
## <a name="参考">参考</a><a class="heading-anchor-permalink" href="#参考">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-11-29" updated="2021-11-29" %}</div>
### 参照
- [shutil.copy()](https://docs.python.org/ja/3/library/shutil.html#shutil.copy)
- [shutil.copy2()](https://docs.python.org/ja/3/library/shutil.html#shutil.copy2)

### 参考サイト
- [Python3 - pathlib で ファイルをコピーする](https://www.curict.com/item/c4/c4c84ed.html)

{% include goto_pagetop.html %}

{% include articles_common_script.html %}
