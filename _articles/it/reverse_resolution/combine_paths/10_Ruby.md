---
chapter_no: 10
chapter_title: Rubyでパスを結合する
sub_category_id: ruby
created: 2022-01-02
updated: 2022-01-02
---
### 構文
```syntax
File.join(item...)
```
- `File::SEPARATOR`を間に入れて文字列を連結します。
- 戻り値の型は文字列です。
- パスが結合された文字列が返却されます。

### 例
```
File.{em{join}em}({em:blue{"a","b"}em})                        {em:comment{# => "a/b"}em}
File.{em{join}em}({em:blue{"a/","b"}em})                       {em:comment{# => "a/b"}em}
File.{em{join}em}({em:blue{"a/","/b"}em})                      {em:comment{# => "a/b"}em}
File.{em{join}em}({em:blue{"a","/b"}em})                       {em:comment{# => "a/b"}em}
File.{em{join}em}({em:blue{"a", ["b", ["c", ["d"]]]}em})       {em:comment{# => "a/b/c/d"}em}
File.{em{join}em}({em:blue{"", "a", ["b", ["c", ["d"]]]}em})   {em:comment{# => "/a/b/c/d"}em}
File.{em{join}em}({em:blue{[]}em})                             {em:comment{# => ""}em}
File.{em{join}em}                                 {em:comment{# => ""}em}
```

### 参考
- [File.join](https://docs.ruby-lang.org/ja/latest/class/File.html#S_JOIN)
