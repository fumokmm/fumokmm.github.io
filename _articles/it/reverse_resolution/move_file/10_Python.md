---
chapter_no: 20
chapter_title: Pythonでファイルを移動する
sub_category_id: python
created: 2022-02-21
updated: 2022-02-21
---
- Pythonの場合、`shutil`モジュールの`move`を利用します。

### ファイル名は同じままで別ディレクトリに移動する
```syntax
shutil.{em{move}em}({em:blue{<コピー元ファイル>}em}, {em:blue{<コピー先ディレクトリ>}em})
```
```:ディレクトリへファイル移動
import shutil

new_path = shutil.{em{move}em}({em:blue{"from_dir/file.txt"}em}, {em:blue{"to_dir"}em})
```
- 戻り値はコピー後のパスとなります。

なお、既に同名のファイルがコピー先パスに存在する場合、例外(`shutil.Error`)が発生します。

### ファイルを移動（上書き）
コピー先ディレクトリにファイルが存在した場合でも上書きで移動したい場合は、以下のようにコピー先をファイルまでのパスで指定します。
```syntax
shutil.{em{move}em}({em:blue{<コピー元ファイル>}em}, {em:blue{<コピー先ファイル>}em})
```
```:上書き移動
import shutil

new_path = shutil.{em{move}em}({em:blue{"from_dir/file.txt"}em}, {em:blue{"to_dir/file.txt"}em})
```
- 戻り値はコピー後のパスとなります。


### 参照
- [shutil.move](https://docs.python.org/ja/3/library/shutil.html#shutil.move)

### 参考サイト
- [(け日記) Python: ファイルを移動する (shutil.move)](https://ohke.hateblo.jp/entry/2019/08/31/100000)