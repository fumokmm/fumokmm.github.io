---
chapter_no: 10
chapter_title: BigDecimalのaddは戻り値を代入する必要あり
created: 2008-01-20
updated: 2021-07-12
---
`BigDecimal`の`#add`は戻り値を代入する必要があります。イミュータブルなので。
もちろん`#subtract`、`#multiply`、`#divide`なんかも同様です。

```
BigDecimal bd1 = new BigDecimal("1");
BigDecimal bd2 = new BigDecimal("2");

{em{bd1 = }em}bd1.add(bd2);
```

仮に
```
bd1.add(bd2);
```
これだけだと、`bd1`に`bd2`を足す演算はしてくれるんですが、  
結局どこにも代入されないため、`bd1`、`bd2`とも変化しません。
