---
chapter_no: 4
chapter_title: 範囲(Range)でループ
created: 2008-12-11
updated: 2021-06-29
---
```
def nums = ''

{em:comment{// 0〜4}em}
for (i in 0..4) {
  nums += i
}
assert nums == '01234'

nums = ''
{em:comment{// 0〜5より小さい}em}
for (i in 0..<5) {
  nums += i
}
assert nums == '01234'

nums = ''
{em:comment{// 4〜0 (逆範囲)}em}
for (i in 4..0) {
  nums += i 
}
assert nums == '43210'

nums = ''
{em:comment{// 4〜0より大きい (逆範囲)}em}
for (i in 4..<0) {
  nums += i 
}
assert nums == '4321'
```
- 一番最後のRangeの逆範囲に対しても、`<`が有効なのがユニークですね😉
