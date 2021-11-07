---
chapter_no: 2
chapter_title: boolのリストを取得
created: 2021-11-07
updated: 2021-11-07
---
`pandas`の`Series`のデータから`bool`のリストやSeriesを取得します。  
ここでは例として以下のような`Series`を利用します。

```
import pandas as pd

ser = pd.Series(["晴れ", "雨", "くもり","晴れ時々くもり", "雨"])
print(ser)
```
```output
0         晴れ
1          雨
2        くもり
3    晴れ時々くもり
4          雨
dtype: object
```

### 完全一致
完全一致する場合`True`を返却するようにする場合は`==`を利用します。
```
print(ser {em{==}em} "雨")
```
```output
0    False
{em{1     True}em}
2    False
3    False
{em{4     True}em}
dtype: bool
```

### 含まれる文字列(str.contains)
```
print(ser{em{.str.contains}em}("時々"))
```
```output
0    False
1    False
2    False
{em{3     True}em}
4    False
dtype: bool
```

### 指定文字で終わる(str.endswith)
```
print(ser{em{.str.endswith}em}("くもり"))
```
```output
0    False
1    False
{em{2     True}em}
{em{3     True}em}
4    False
dtype: bool
```

# 指定文字で始まる(str.startswith)
```
print(ser{em{.str.startswith}em}("晴れ"))
```
```output
{em{0     True}em}
1    False
2    False
{em{3     True}em}
4    False
dtype: bool
```
