---
chapter_no: 30
chapter_title: PowerShellで絶対パス・フルパスを取得する
sub_category_id: powershell
created: 2021-06-13
updated: 2022-02-13
---
- PowerShellの場合、`Resolve-Path`で取得できます。

```output
{em:command{PS C:\temp\java-currentver>}em} ls


    ディレクトリ: C:\temp\java-currentver


Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
d-----        2019/11/08     21:30                bin
d-----        2019/11/08     21:30                conf
d-----        2019/11/08     21:30                include
d-----        2019/11/08     21:30                jmods
d-----        2019/11/08     21:30                legal
d-----        2019/11/08     21:30                lib
-a----        2019/10/06     12:01           3244 COPYRIGHT
-a----        2019/11/08     21:30           1263 release


{em:command{PS C:\temp\java-currentver>}em} cd lib
{em:command{PS C:\temp\java-currentver\lib>}em} {em{Resolve-Path}em} {em:blue{..\bin}em}

Path
----
C:\temp\java-currentver\bin
```

### 参照
- [(Microsoft \| Docs) Resolve-Path](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.management/resolve-path?view=powershell-7.1)
