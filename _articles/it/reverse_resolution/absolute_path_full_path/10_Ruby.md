---
chapter_no: 10
chapter_title: Rubyで絶対パス・フルパスを取得する
sub_category_id: ruby
created: 2021-03-09
updated: 2022-02-13
---
- Rubyの場合、`Pathname#cleanpath`や、`File#expand_path`を使うことで絶対パスやフルパスを取得できます。

```:Pathnameを使う
require 'pathname'

{em{Pathname.new}em}("a/b/../c/x"){em:blue{.cleanpath}em}
```
- Pathnameを[require]({% link _it_articles/ruby/grammar.md %}#require)してから利用すること。

```:File.expand_pathを使う
{em{File.expand_path}em}("~oracle/bin")           {em:comment{#=> "/home/oracle/bin"}em}
{em{File.expand_path}em}("../../bin", "/tmp/x")   {em:comment{#=> "/bin"}em}
```

### 参考
- [(Stack Overflow) Canonical File Path in Ruby](https://stackoverflow.com/questions/3502611/canonical-file-path-in-ruby)
