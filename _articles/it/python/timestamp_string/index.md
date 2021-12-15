---
title: Pythonでタイムスタンプ文字列を作成する
article_group_id: reverse-lookup-group
display_order: 70
created: 2021-12-14
updated: 2021-12-14
---

```
import datetime

now = datetime.datetime.now()
print(now.strftime("%Y-%m-%d %H:%M:%S.%f"))
```
```output:実行結果
```

ミリ秒までに削りたい場合、文字列なので末尾の3桁を削れば良いようです。
```
print(now.strftime("%Y-%m-%d %H:%M:%S.%f")[:-3])
```
```output:実行結果
```

```utcnowを使う
from datetime import datetime
print(datetime.utcnow().isoformat(sep=" ", timespec="milliseconds"))
```

### 参考
- https://maku77.github.io/python/datetime/date-string.html
- https://python.civic-apps.com/date-format/
- https://www.delftstack.com/ja/howto/python/python-datetime-milliseconds/
- https://docs.python.org/ja/3/library/time.html#time.strftime

- https://stackoverflow.com/questions/7588511/format-a-datetime-into-a-string-with-milliseconds