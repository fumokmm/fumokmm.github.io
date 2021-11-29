---
chapter_no: 10
chapter_title: shutil.copy()
created: 2021-11-29
updated: 2021-11-29
---
```
import shutil
import pathlib

from_path = pathlib.Path({em:blue{<コピー元ファイルパス>}em})
to_path = pathlib.Path({em:blue{<コピー先ファイルパス>}em})
shutil.{em{copy}em}({em:blue{from_path}em}, {em:blue{to_path}em})
```
- コピー先にディレクトリが指定された場合、コピー先ディレクトリに、元のファイル名でコピーされます。
- コピー先にファイル名が指定された場合、そのファイル名でコピーされます。
- コピー先のディレクトリがない場合、例外が発生します。[^mkdir]

[^mkdir]: [Pythonでフォルダを作成する]({% link _it_articles/python/make_directory.md %})を参照。