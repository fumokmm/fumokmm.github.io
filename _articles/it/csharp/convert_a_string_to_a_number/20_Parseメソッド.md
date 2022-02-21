---
chapter_no: 20
chapter_title: Parseメソッド
created: 2022-02-21
updated: 2022-02-21
---
Parseメソッドは、変換に失敗した時に、`FormatException`がスローされますので、try-catchで例外を捕捉する必要があります。
```syntax
int result = int.{em{Parse}em}({em:blue{<変換する文字列>}em});
```
```:例
string s = "10";
try
{
    int result = int.{em{Parse}em}(s);
    Console.WriteLine($"結果 {i}");
}
catch(FormatException e)
{
    Console.WriteLine($"エラー {e.Message}");
}
```
- 文字列の先頭と末尾の空白文字は、無視されるみたいです。