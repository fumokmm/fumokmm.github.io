---
chapter_no: 1
chapter_title: Copy-Itemを利用する
created: 2021-07-28
updated: 2021-07-28
---
- `Copy-Item`を使います。  
- コピー元のファイルを`-Path`で、コピー先のファイルを`-Destination`で指定します。
- コピー先のファイルが読み取り専用だった場合、エラーとなります。
```syntax
Copy-Item -Path {em{<コピー元パス>}em} -Destination {em{<コピー先パス>}em}
```

### 上書きコピー
- 上書きコピーする場合は`-Force`オプションを付けます。
- コピー先のファイルが読み取り専用だった場合でもエラーとなりません。
```syntax
Copy-Item -Path {em{<コピー元パス>}em} -Destination {em{<コピー先パス>}em} {em:orange{-Force}em}
```
