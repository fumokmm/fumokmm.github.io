---
chapter_no: 1
chapter_title: Resolve-Pathを利用する
created: 2021-06-13
updated: 2021-06-13
---
`Resolve-Path`を使います。

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
