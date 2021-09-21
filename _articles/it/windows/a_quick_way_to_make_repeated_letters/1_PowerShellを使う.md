---
chapter_no: 1
chapter_title: PowerShellを使う
created: 2020-12-29
updated: 2021-09-21
---
{% capture link_to_powershell %}{% link _it_articles/powershell/index.md %}{% endcapture %}

手っ取り早く繰り返し文字を作りたい場合  
例えば255文字の`A`が欲しい場合は、以下のように[PowerShell]({{link_to_powershell | remove: 'index' }})を利用すると速いです。

1. PowerShellを起動 (`Winキー` + `R` > `powershell` → `Enter`)
1. 'A'*255

```output:PowerShell
PS> 'A'*255
```
<p class="center" markdown="span">
![](https://cdn-ak.f.st-hatena.com/images/fotolife/f/fumokmm/20201222/20201222115125.png)
</p>

あとは`コピー`するなり、`リダイレクト`するなりしてもらえたら使いやすいと思います。