---
title: JSONの読み込み
article_group_id: data-format-io-group
display_order: 10
created: 2022-03-27
updated: 2022-03-27
---
{% capture link_to_it_python %}{% link _it_articles/python/index.md %}{% endcapture %}{% assign link_to_it_python = link_to_it_python | remove: 'index' %}

## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<ul id="index_ul">
<li><a href="#PythonでJSONの読み込み">PythonでJSONの読み込み</a></li>
<li><a href="#関連メモ">関連メモ</a></li>
</ul>

* * *
## <a name="PythonでJSONの読み込み">PythonでJSONの読み込み</a><a class="heading-anchor-permalink" href="#PythonでJSONの読み込み">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-03-27" updated="2022-03-27" %}</div>
- Pythonの場合、`json`モジュールの`loads`を利用します。

### テキストから読み込み
{% raw %}
<div class="code-box no-title">
<div class="copy-button">Copy</div>
<pre>
import json

<em class="comment"># JSON文字列</em>
s = f"""{{
    "a": "100",
    "b": {{
        "c": "def"
    }}
}}
"""
<em class="comment"># JSON文字列 → JSONデータへ</em>
json_data = json.<em>loads</em>(s)
print(json_data)
print(type(json_data))
</pre>
</div>
{% endraw %}
<div class="code-box-output">
<div class="title">出力結果</div>
<div class="copy-button">Copy</div>
<pre>
{'a': '100', 'b': {'c': 'def'}}
&lt;class 'dict'&gt;
</pre>
</div>

### サンプルソース
- [(language-examples) 0017_read_json.py](https://github.com/fumokmm/language-examples/blob/main/Python/0017_read_json.py)

### 参考サイト
- [(note.nkmk.me) PythonでJSONファイル・文字列の読み込み・書き込み](https://note.nkmk.me/python-json-load-dump/)

{% include goto_pagetop.html %}

* * *
## <a name="関連メモ">関連メモ</a><a class="heading-anchor-permalink" href="#関連メモ">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-03-27" updated="2022-03-27" %}</div>
- [Pythonのメモ]({{link_to_it_python}})

{% include goto_pagetop.html %}

{% include articles_common_script.html %}
