---
chapter_no: 20
chapter_title: ADODB
created: 2021-12-09
updated: 2021-12-09
---
DB操作したり、テキスト操作したりするモジュールです。

### 必要となる参照設定
```syntax
Microsoft ActiveX Data Objects x.x Library
```

### 使用例 (ADODB.Stream)
```:参照設定している場合
Dim p_stream As {em{ADODB.Stream}em}
Set p_stream = New {em{ADODB.Stream}em}
```
参照設定していない場合は、`CreateObject`を使って生成します。
```:参照設定していない場合
Dim p_stream As Object
Set p_stream = CreateObject({em{"ADODB.Stream"}em})
```

### 参考サイト
- [(インストラクターのネタ帳) ExcelでADO・ADODBへの参照設定を](https://www.relief.jp/docs/excel-vba-referencing-to-adodb-library.html)
- [(ExcelWork.info) テキストファイル（UTF-8）を読み込み、書き出し（ADODB.Stream）](https://excelwork.info/excel/adodbstream/)