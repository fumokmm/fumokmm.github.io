---
chapter_no: 10
chapter_title: FileSystemObject
created: 2021-12-01
updated: 2021-12-09
---
みんな大好き`FileSystemObject`です。ファイルやディレクトリ操作のモジュールです。

### 必要となる参照設定
```syntax
Microsoft Scripting Runtime
```
- `Microsoft Scripting Runtime`を参照設定に追加しておくと、`VBA.Collection`や`Scripting.Dictionary`も使えるようになります。

### 使用例
```:参照設定している場合
Dim p_fso As {em{Scripting.FileSystemObject}em}
Set p_fso = New {em{Scripting.FileSystemObject}em}
```
参照設定していない場合は、`CreateObject`を使って生成します。
```:参照設定していない場合
Dim p_fso As Object
Set p_fso = CreateObject({em{"Scripting.FileSystemObject"}em})
```

### 参考サイト
- [(インストラクターのネタ帳) FileSystemObjectの参照設定を行う](https://www.relief.jp/docs/fso-vba-references.html)