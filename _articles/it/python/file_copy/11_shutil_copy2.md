---
chapter_no: 11
chapter_title: shutil.copy2()
created: 2021-11-29
updated: 2021-11-29
---
- パーミッションに加え、メタ情報(作成日や変更日)もコピーしたい場合には`copy2`を利用します。
- 使い方などは[copy()](#shutil.copy())と一緒です。
```
import shutil
import pathlib

from_path = pathlib.Path({em:blue{<コピー元ファイルパス>}em})
to_path = pathlib.Path({em:blue{<コピー先ファイルパス>}em})
shutil.{em{copy2}em}({em:blue{from_path}em}, {em:blue{to_path}em})
```
