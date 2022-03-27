---
chapter_no: 20
chapter_title: PythonでJSONの読み込み
sub_category_id: python
created: 2022-03-27
updated: 2022-03-27
---
- Pythonの場合、`json`モジュールの`loads`を利用します。

### テキストから読み込み
{% raw %}
```
import json

{em:comment{# JSON文字列}em}
s = f"""{{
    "a": "100",
    "b": {{
        "c": "def"
    }}
}}
"""
{em:comment{# JSON文字列 → JSONデータへ}em}
json_data = json.{em{loads}em}(s)
print(json_data)
print(type(json_data))
```
{% endraw %}
```output:出力結果
{'a': '100', 'b': {'c': 'def'}}
<class 'dict'>
```

### サンプルソース
- [(language-examples) 0017_read_json.py](https://github.com/fumokmm/language-examples/blob/main/Python/0017_read_json.py)

### 参考サイト
- [(note.nkmk.me) PythonでJSONファイル・文字列の読み込み・書き込み](https://note.nkmk.me/python-json-load-dump/)