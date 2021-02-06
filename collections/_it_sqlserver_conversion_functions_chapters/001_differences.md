---
chapter_no: 001
chapter_id: differences
chapter_title: 4つの変換系関数の違い
created: 2020-12-21
updated: 2020-12-21
---
4つは変換系関数ということで似ているんですが、違いを簡単にまとめると以下のようになります。

- `CAST`と`CONVERT`は型変換
  - `CAST`はスタイルを指定できない
  - `CONVERT`はスタイルを指定できる
  - この2つは語順が反対(どうしてこうなった…)
- `FORMAT`と`PARSE`は型⇔文字列の指定した形式での変換
  - `FORMAT`は型→文字列
  - `PARSE`は文字列→型

なお、`CAST`と`CONVERT`と`PARSE`には、変換に失敗したらエラーとするのではなく、`NULL`を返却するTRYバージョンが(それぞれ`TRY_CAST`、`TRY_CONVERT`、`TRY_CAST`)というものが存在します。
