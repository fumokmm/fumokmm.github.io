---
chapter_no: 10
chapter_title: Rubyでテキストファイルへ出力する(書き込み)
sub_category_id: ruby
created: 2022-03-13
updated: 2022-03-13
---
- Rubyの場合、`File.open`を利用します。

```
{em{File.open}em}({em:blue{"data/bbb.txt"}em}, {em:orange{mode="w:UTF-8"}em}) do |w|
  w.write "あいう\n"
  w.write "abc\n"
  w.write "123\n"
end
```
```output:data/bbb.txt
あいう
abc
123
```
- エンコーディングを指定するのは引数`mode`で指定します。以下の参照・参考サイトを参照。

### 参照
- [class File](https://docs.ruby-lang.org/ja/latest/class/File.html)

### 参考サイト
- [(Build Insider) ファイルに文字列を書き込む（出力する）には？](https://www.buildinsider.net/language/rubytips/0022)

### サンプルソース
- [(language-examples) 0010_write_text](https://github.com/fumokmm/language-examples/tree/main/Ruby/0010_write_text.rb)
