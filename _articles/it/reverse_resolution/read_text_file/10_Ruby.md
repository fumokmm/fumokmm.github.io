---
chapter_no: 10
chapter_title: Rubyでテキストファイルから入力する(読み込み)
sub_category_id: ruby
created: 2022-03-02
updated: 2022-03-02
---
- Rubyの場合、`File.open`を利用します。

```
f = {em{File.open}em}({em:blue{"data/aaa.txt"}em})
lines = f.readlines
p lines {em:comment{# => ["aaa\n", "bbb\n", "ccc"]}em}
f.close
```
```input:data/aaa.txt
aaa
bbb
ccc
```
- エンコーディングを指定するのは引数`mode`で指定します。以下の参照・参考サイトを参照。

### 参照
- [class File](https://docs.ruby-lang.org/ja/latest/class/File.html)

### 参考サイト
- [(Build Insider) ファイルから文字列を読み込む（入力する）には？（基本編）](https://www.buildinsider.net/language/rubytips/0019)

### サンプルソース
- [(language-examples) 0009_read_text](https://github.com/fumokmm/language-examples/tree/main/Ruby/0009_read_text.rb)
