---
chapter_no: 10
chapter_title: Excelでスネークケースをキャメルケースに変換する
sub_category_id: excel
created: 2022-03-31
updated: 2022-03-31
---
```:ローワーキャメルケース
=
SUBSTITUTE(
SUBSTITUTE(
SUBSTITUTE(
SUBSTITUTE(
SUBSTITUTE(
SUBSTITUTE(
SUBSTITUTE(
SUBSTITUTE(
SUBSTITUTE(
SUBSTITUTE(
SUBSTITUTE(
SUBSTITUTE(
SUBSTITUTE(
SUBSTITUTE(
SUBSTITUTE(
SUBSTITUTE(
SUBSTITUTE(
SUBSTITUTE(
SUBSTITUTE(
SUBSTITUTE(
SUBSTITUTE(
SUBSTITUTE(
SUBSTITUTE(
SUBSTITUTE(
SUBSTITUTE(
SUBSTITUTE(
SUBSTITUTE(
SUBSTITUTE(
SUBSTITUTE(
SUBSTITUTE(
SUBSTITUTE(
SUBSTITUTE(
SUBSTITUTE(
SUBSTITUTE(
SUBSTITUTE(
SUBSTITUTE(
LOWER(A1)
,"_0", "0")
,"_1", "1")
,"_2", "2")
,"_3", "3")
,"_4", "4")
,"_5", "5")
,"_6", "6")
,"_7", "7")
,"_8", "8")
,"_9", "9")
,"_a", "A")
,"_b", "B")
,"_c", "C")
,"_d", "D")
,"_e", "E")
,"_f", "F")
,"_g", "G")
,"_h", "H")
,"_i", "I")
,"_j", "J")
,"_k", "K")
,"_l", "L")
,"_m", "M")
,"_n", "N")
,"_o", "O")
,"_p", "P")
,"_q", "Q")
,"_r", "R")
,"_s", "S")
,"_t", "T")
,"_u", "U")
,"_v", "V")
,"_w", "W")
,"_x", "X")
,"_y", "Y")
,"_z", "Z")
```
例)
```input:A1セル
AAA_BBB_CCC
```
```output:B2セル(上記の数式の結果)
aaaBbbCcc
```

```:アッパーキャメルケース
=UPPER(LEFT(A1, 1))&
SUBSTITUTE(
SUBSTITUTE(
SUBSTITUTE(
SUBSTITUTE(
SUBSTITUTE(
SUBSTITUTE(
SUBSTITUTE(
SUBSTITUTE(
SUBSTITUTE(
SUBSTITUTE(
SUBSTITUTE(
SUBSTITUTE(
SUBSTITUTE(
SUBSTITUTE(
SUBSTITUTE(
SUBSTITUTE(
SUBSTITUTE(
SUBSTITUTE(
SUBSTITUTE(
SUBSTITUTE(
SUBSTITUTE(
SUBSTITUTE(
SUBSTITUTE(
SUBSTITUTE(
SUBSTITUTE(
SUBSTITUTE(
SUBSTITUTE(
SUBSTITUTE(
SUBSTITUTE(
SUBSTITUTE(
SUBSTITUTE(
SUBSTITUTE(
SUBSTITUTE(
SUBSTITUTE(
SUBSTITUTE(
SUBSTITUTE(
LOWER(MID(A1, 2, LEN(A1)))
,"_0", "0")
,"_1", "1")
,"_2", "2")
,"_3", "3")
,"_4", "4")
,"_5", "5")
,"_6", "6")
,"_7", "7")
,"_8", "8")
,"_9", "9")
,"_a", "A")
,"_b", "B")
,"_c", "C")
,"_d", "D")
,"_e", "E")
,"_f", "F")
,"_g", "G")
,"_h", "H")
,"_i", "I")
,"_j", "J")
,"_k", "K")
,"_l", "L")
,"_m", "M")
,"_n", "N")
,"_o", "O")
,"_p", "P")
,"_q", "Q")
,"_r", "R")
,"_s", "S")
,"_t", "T")
,"_u", "U")
,"_v", "V")
,"_w", "W")
,"_x", "X")
,"_y", "Y")
,"_z", "Z")
```
```input:A1セル
AAA_BBB_CCC
```
```output:B2セル(上記の数式の結果)
AaaBbbCcc
```
