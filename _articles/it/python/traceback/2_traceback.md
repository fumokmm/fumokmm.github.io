---
chapter_no: 2
chapter_title: traceback
created: 2021-10-29
updated: 2021-10-29
---
ゼロ割で例外を発生させるサンプルです。
```
import {em{traceback}em}

try:
    num = 1 / 0  {em:comment{# ここで例外が発生}em}

except Exception as e:
    {em:comment{# 文字列を取得する}em}
    print("エラー情報\n" + {em{traceback.format_exc()}em})
```
```:output
{em:command{> python .\0006_traceback.py}em}
エラー情報
Traceback (most recent call last):
  File ".\0006_traceback.py", line 4, in <module>
    num = 1 / 0
ZeroDivisionError: division by zero
```
- tracebackの詳細については[こちら](https://docs.python.org/ja/3/library/traceback.html#module-traceback)を参照ください。
