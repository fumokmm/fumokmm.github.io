---
chapter_no: 1
chapter_title: mapToObj
created: 2020-08-28
updated: 2021-07-13
---
`IntStream`から`String`の`List(List)`を作りたかったんですが、`#map`だと`int`にしか変換できないなと思っていたら`#mapToObj`を使えばいいようです。

```
List<String> numList = IntStream.range(1, 10)
    {em{.mapToObj}em}(new DecimalFormat("000")::format)
    .collect(Collectors.toList());
```

こんな感じで。 numListには
```output
["000", "001", ... "009"]
```
が入ります。
