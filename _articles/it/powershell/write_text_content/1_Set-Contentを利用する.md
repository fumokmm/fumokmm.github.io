---
chapter_no: 1
chapter_title: Set-Contentを利用する
created: 2021-06-14
updated: 2021-06-14
---
`Set-Content`を使います。

```
$str = @'
aaaaa
あああああ
1234567890
'@

{em:comment{# 通常の使い方、-Pathで出力先を指定し、 -Value で出力する内容を指定する}em}
{em{Set-Content}em} -Path C:\temp\out.txt -Value $str

{em:comment{# -Value は省略可}em}
{em{Set-Content}em} -Path C:\temp\out2.txt $str

{em:comment{# -Value はパイプラインでも受け取り可}em}
Get-ChildItem C:\temp | {em{Set-Content}em} -Path C:\temp\out3.txt
```
