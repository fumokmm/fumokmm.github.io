---
chapter_no: 150
chapter_group: 基礎文法
chapter_title: 条件分岐 - Select-Caseステートメント
created: 2021-12-17
updated: 2021-12-17
---
Select Case文は複数の条件分岐をすっきり書くための構文です。  
基本的には[条件分岐 - If-Then-Elseステートメント](#条件分岐 - If-Then-Elseステートメント)で書けるものです。

### Select-Case
```syntax
{em{Select Case}em} {em:blue{<比較する値>}em}
    {em{Case}em} {em:blue{<条件1>}em}
        {em:comment{' 条件1を満たしたときの処理}em}
    {em{Case}em} {em:blue{<条件2>}em}
        {em:comment{' 条件2を満たしたときの処理}em}
    {em{Case Else}em}
        {em:comment{' いずれの条件も満たさなかったときの処理}em}
{em{End Select}em}
```
- [C言語]({{link_to_it_c}})と違って[フォールスルー](https://ja.wikipedia.org/wiki/Switch%E6%96%87#%E3%83%95%E3%82%A9%E3%83%BC%E3%83%AB%E3%82%B9%E3%83%AB%E3%83%BC)はしない。
- `<条件>`の書き方に以下パターンがあります。
  - 値とマッチするか。(完全一致)
  - 複数のどれかにマッチするか。(カンマ区切りる)
  - 範囲内に含まれる。(xx To yy)
  - 大小比較 (Is >= xx, Is <= xx)
- 上に記述した`<条件>`とマッチするか評価されてゆき、どれか一つでもマッチすると、以降の処理は実行されません。
- どの`<条件>`にもマッチしなかった場合、`Case Else`で指定した処理が実行されます。
  - `Case Else`を省略した場合で、かつどの`<条件>`にもマッチしなかった場合は、何も処理されません。

### 例：値とマッチ
```
Dim p_time As String
p_time = "朝"
Select Case p_time
    Case {em{"朝"}em}
        Debug.Print "おはようございます！"
    Case {em{"昼"}em}
        Debug.Print "こんにちは！"
    Case {em{"夜"}em}
        Debug.Print "こんばんは！"
    Case Else
        Debug.Print "Zzz..."
End Select
```
```output
おはようございます！
```

### 例：複数のどれかにマッチ
```
Dim p_num As Integer
p_num = 5
Select Case p_num
    Case {em{1, 3, 5, 7, 9}em}
        Debug.Print p_num & "は奇数です。"
    Case {em{2, 4, 6, 8}em}
        Debug.Print p_num & "は偶数です。"
    Case Else
        Debug.Print "1から9までの値を指定してください。"
End Select
```
```output
5は奇数です。
```

### 例：範囲内に含まれる
```
Dim p_age As Integer
p_age = 40
Select Case p_age
    Case {em{0 To 18}em}
        Debug.Print p_age & "歳はこどもです。"
    Case {em{19 To 65}em}
        Debug.Print p_age & "歳は大人です。"
    Case {em{66 To 99}em}
        Debug.Print p_age & "歳はシニアです。"
    Case Else
        Debug.Print p_age & "歳以上の人はセンテナリアンと呼びます。"
End Select
```
```output
40歳は大人です。
```
- センテナリアンって言葉をこのサンプルをメモしていて初めて知りました。

### 例：大小比較
```
Dim p_temperature As Integer
p_temperature = 105
Select Case p_temperature
    Case {em{Is <= 0}em}
        Debug.Print p_temperature & "度で水は固体です。"
    Case {em{Is >= 100}em}
        Debug.Print p_temperature & "度で水は気体です。"
    Case Else
        Debug.Print p_temperature & "度で水は液体です。"
End Select
```
```output
105度で水は気体です。
```
- `Is`の部分に`<比較する値>`が入っていると思ってCase句を書いてください。

### 参考
- [(Wikipedia) switch文](https://ja.wikipedia.org/wiki/Switch%E6%96%87)
- [(Valmore) 【Excel VBA入門】Select Case文の使い方。複数条件をスッキリ書く！](https://valmore.work/excel-vba-case/)