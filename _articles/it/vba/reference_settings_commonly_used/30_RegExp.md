---
chapter_no: 30
chapter_title: RegExp
created: 2021-12-09
updated: 2021-12-09
---
正規表現モジュールです。

### 必要となる参照設定
```syntax
Microsoft VBScript Regular Expressions 5.5
```

### 使用例
```:参照設定している場合
Dim p_re As {em{VBScript_RegExp_55.RegExp}em}
Set p_re = New {em{VBScript_RegExp_55.RegExp}em}
```
参照設定していない場合は、`CreateObject`を使って生成します。
```:参照設定していない場合
Dim p_re As Object
Set p_re = CreateObject({em{"VBScript.RegExp"}em})
```

### 参考サイト
- [(Qiita) VBAの正規表現の参照設定の5.5 と 1.0の違い](https://qiita.com/Q11Q/items/56db596629a124f94b7e)
- [(侍エンジニアブログ)【VBA入門】正規表現で文字列を抽出、置換する方法(RegExp)](https://www.sejuku.net/blog/33541)