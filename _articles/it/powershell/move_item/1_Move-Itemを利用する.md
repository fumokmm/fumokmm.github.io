---
chapter_no: 1
chapter_title: Move-Itemを利用する
created: 2021-07-28
updated: 2021-07-28
---
- `Move-Item`を使います。  
- 移動元のファイルを`-Path`で、移動先のファイルを`-Destination`で指定します。
- 移動先のファイルが既に存在していた場合、エラーとなります。
```syntax
Move-Item -Path {em{<移動元パス>}em} -Destination {em:blue{<移動先パス>}em}
```

### 上書きで移動
- 上書きで移動する場合は`-Force`オプションを付けます。
- 移動先のファイルが既に存在していた場合でもエラーとなりません。
```syntax
Move-Item -Path {em{<移動元パス>}em} -Destination {em:blue{<移動先パス>}em} {em:orange{-Force}em}
```
