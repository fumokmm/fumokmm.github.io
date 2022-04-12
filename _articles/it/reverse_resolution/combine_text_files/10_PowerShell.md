---
chapter_no: 10
chapter_title: PowerShellでテキストファイルを結合する
sub_category_id: powershell
created: 2022-04-12
updated: 2022-04-12
---
- PowerShellの場合、`Get-Content`と`Set-Content`を組み合わせると簡単です。

```
{em{Get-Content}em} `
aaa.txt, `
bbb.txt `
| {em{Set-Content}em} ccc.txt
```
```input:aaa.txt
aaa
aaa
aaa
```
```input:bbb.txt
bbb
bbb
bbb
```
```output:ccc.txt
aaa
aaa
aaa
bbb
bbb
bbb
```

### 参考サイト
- [(WIN.JUST4FUN.BIZ) PowerShellでテキストファイルを連結する方法 †](https://win.just4fun.biz/?PowerShell/%E3%83%86%E3%82%AD%E3%82%B9%E3%83%88%E3%83%95%E3%82%A1%E3%82%A4%E3%83%AB%E3%82%92%E9%80%A3%E7%B5%90%E3%81%99%E3%82%8B%E6%96%B9%E6%B3%95)
- [(スケ郎のお話) テキストファイルを結合するPowerShell](https://www.sukerou.com/2021/12/powershell.html)

### サンプルソース
- [(language-examples) 0021_combine_text_files](https://github.com/fumokmm/language-examples/blob/main/PowerShell/0021_combine_text_files.ps1)
