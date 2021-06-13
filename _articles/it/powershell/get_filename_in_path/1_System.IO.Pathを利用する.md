---
chapter_no: 2
chapter_title: System.IO.Pathを利用する
created: 2021-05-31
updated: 2021-05-31
---
.NET APIの`System.IO.Path`を使う方法です。  
拡張子ありの場合は`GetFileName`を使います。拡張子なしの場合`GetFileNameWithoutExtension`を使います。

```output:拡張子あり
{em:command{PS C:\Users\fumo>}em} [System.IO.Path]::{em{GetFileName}em}("C:\temp\fileA.txt")
fileA.txt
```

```output:拡張子なし
{em:command{PS C:\Users\fumo>}em} [System.IO.Path]::{em{GetFileNameWithoutExtension}em}("C:\temp\fileA.txt")
fileA
```
