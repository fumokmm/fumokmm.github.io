---
chapter_no: 30
chapter_title: TryParseメソッド
created: 2022-02-21
updated: 2022-02-21
---
TryParseメソッドは、変換に失敗した時は例外をスローするのではなく、単純に戻り値で`false`を返却します。  
変換した結果の受け取りは、第2引数にOUTパラメータで指定して受け取ります。
```syntax
bool result = int.{em{TryParse}em}({em:blue{<変換する文字列>}em}, {em:blue{out <変換結果>}em});
```
```:例
string s = "10";
int i = -1;
bool result = int.{em{TryParse}em}(s, {em:blue{out i}em});
Console.WriteLine($"結果: {i}, 変換成功:{result}");
```
- 文字列の先頭と末尾の空白文字は、無視されるみたいです。
