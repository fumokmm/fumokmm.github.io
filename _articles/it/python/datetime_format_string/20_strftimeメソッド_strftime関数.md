---
chapter_no: 20
chapter_title: strftimeメソッド、strftime関数
created: 2022-02-07
updated: 2022-02-07
---
- Pythonのデフォルトでは`MM/DD/YY hh:mm:ss`という日付時刻形式のようです。
- デフォルトは`%x %X`というお手軽フォーマットが利用できます。
- 例を簡潔にするため、以降`%x %X`を使っていきます。

### datetime.datetime.strftimeメソッド
```
import datetime

now = datetime.datetime.now()
print(type(now))               {em:comment{# => <class 'datetime.datetime'>}em}
print(now.{em{strftime}em}({em:blue{"%x %X"}em}))   {em:comment{# => 02/07/22 20:23:28}em}
```
- たぶんこれが一番ベーシックな形式です。

### datetime.date.strftimeメソッド
```
import datetime

now = datetime.datetime.now()
d = now.date()
print(type(d))                 {em:comment{# => <class 'datetime.date'>}em}
print(d.{em{strftime}em}({em:blue{"%x %X"}em}))     {em:comment{# => 02/07/22 00:00:00}em}
```
- dateクラスだと時刻は00:00:00になるみたいです。

### datetime.time.strftimeメソッド
```
import datetime

now = datetime.datetime.now()
t = now.time()
print(type(t))                 {em:comment{# => <class 'datetime.time'>}em}
print(t.{em{strftime}em}({em:blue{"%x %X"}em}))     {em:comment{# => 01/01/00 20:23:28}em}
```
- timeクラスだと日付が01/01/00になるみたいです。

### time.strftime関数
```
import time

nowt = time.localtime()
print(type(nowt))                    {em:comment{# => <class 'time.struct_time'>}em}
print(time.{em{strftime}em}({em:blue{"%x %X"}em}, {em{nowt}em}))  {em:comment{# => 02/07/22 20:23:28}em}
```
- timeモジュールのstrftime関数を使う場合は、語順が逆になるみたいです。

### 日本用のフォーマット
- デフォルト以外を使いたい場合はフルでフォーマット文字列を指定していきます。
- 日本でよく使うのは`YYYY/MM/DD hh:mm:ss`なので、`%Y/%m/%d %H:%M:%S`とするとよいようです。
```
print({em{now}em}.strftime({em:blue{"%Y/%m/%d %H:%M:%S"}em}))  {em:comment{# => 2022/02/07 20:23:28}em}
```
