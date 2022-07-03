---
chapter_no: 10
chapter_title: UbuntuにGaucheをインストール
created: 2022-07-04
updated: 2022-07-04
---
- Schemeの処理系であるGaucheをUbuntuにインストールする際の手順をメモしておきます。

### apt-get
```output
$ sudo apt-get install gauche
```
これでおしまい。

### goshプロンプトを実行
- `gosh`というコマンドで実行できます。
- 終了は`(exit)`。

```output
$ gosh
gosh> (+ 1 2)
3
gosh> (exit)
$ 
```

### ファイルから実行
```:hello.scm
(print "Hello, World")
(print "こんにちは、世界")
(print (+ 1 2))
```
- UTF-8で保存

```output:実行
$ gosh hello.scm 
Hello, World
こんにちは、世界
3
$ 
```
