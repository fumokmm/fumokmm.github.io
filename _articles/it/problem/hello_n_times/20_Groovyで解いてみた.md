---
chapter_no: 20
chapter_title: Groovyで解いてみた
created: 2022-08-26
updated: 2022-08-26
---
```:hello_n_times.groovy
def helloNTimes = { int n ->
    println ('hello' * n)
}
helloNTimes(1)
helloNTimes(2)
helloNTimes(3)
```
```output
hello
hellohello
hellohellohello
```
- n回出力するなら、Groovyの場合は`*`演算子が適役かなと思います。
