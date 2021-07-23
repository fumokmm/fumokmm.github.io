---
chapter_no: 1
chapter_title: Test-Pathを利用する
created: 2021-07-24
updated: 2021-07-24
---
- `Test-Path`を使います。  
- ファイルやフォルダが存在する場合`True`が、存在しない場合`False`が返ってきます。

```output
{em:command{PS C:\Users\fumo>}em} ls c:\temp


    ディレクトリ: C:\temp


Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
                     :
                     : (略)
                     :
-a----        2021/06/14      0:26             31 out.txt
-a----        2021/06/14      0:26             31 out2.txt
-a----        2021/06/14      0:26             70 out3.txt
                     :
                     : (略)
                     :


{em:command{PS C:\Users\fumo>}em} {em{Test-Path}em} {em:blue{C:\temp\out.txt}em}
True
{em:command{PS C:\Users\fumo>}em} {em{Test-Path}em} {em:blue{C:\temp\out2.txt}em}
True
{em:command{PS C:\Users\fumo>}em} {em{Test-Path}em} {em:blue{C:\temp\out3.txt}em}
True
{em:command{PS C:\Users\fumo>}em} {em{Test-Path}em} {em:blue{C:\temp\out4.txt}em}
False
{em:command{PS C:\Users\fumo>}em} {em{Test-Path}em} {em:blue{C:\temp}em}
True
{em:command{PS C:\Users\fumo>}em} {em{Test-Path}em} {em:blue{C:\temp2}em}
False
```
