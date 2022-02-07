---
chapter_no: 30
chapter_title: f文字列、format関数、文字列のformatメソッド
created: 2022-02-07
updated: 2022-02-07
---
- お好きなものを利用できます。

### f文字列
```
print(f"{{em{now}em}:{em:blue{%x %X}em}}")          {em:comment{# => 02/07/22 20:23:28}em}
```

### format関数
```
print(format({em{now}em}, {em:blue{"%x %X"}em}))    {em:comment{# => 02/07/22 20:23:28}em}
```

### 文字列のformatメソッド
```
print({em:blue{"{:%x %X}"}em}.format({em{now}em}))  {em:comment{# => 02/07/22 20:23:28}em}
```
